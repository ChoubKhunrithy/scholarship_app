

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scholarship_app/routes/app_routes.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  // ============ CONTROLLERS & FORM ============
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  
  // ============ STATE ============
  bool _obscurePassword = true;
  bool _isLoading = false;
  bool _isGoogleLoading = false;
  
  // ============ ANIMATIONS ============
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // ============ GOOGLE SIGN-IN ============
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  // ============ LIFECYCLE ============
  
  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize();
    } catch (error) {
      debugPrint('Google Sign-In init error: $error');
    }
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }


  // ============ VALIDATION ============
  
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  // ============ MESSAGES ============
  
  void _showMessage({
    required String message,
    String? subtitle,
    required Color backgroundColor,
    required IconData icon,
  }) {
    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 20,
          right: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 3),
        elevation: 6,
      ),
    );
  }

  void _showSuccessMessage(String message, String userName) {
    _showMessage(
      message: message,
      subtitle: 'Welcome, $userName!',
      backgroundColor: const Color(0xff4CAF50),
      icon: Icons.check_circle_rounded,
    );
  }

  void _showErrorMessage(String message) {
    _showMessage(
      message: message,
      backgroundColor: const Color(0xffF44336),
      icon: Icons.error_rounded,
    );
  }

  // ============ AUTHENTICATION ============

  Future<void> _handleLogin() async {
    // Dismiss keyboard
    FocusScope.of(context).unfocus();
    
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      setState(() => _isLoading = false);

      final userName = _emailController.text.split('@')[0];
      _showSuccessMessage('Login successful!', userName);

      // Navigate to home screen (uncomment when ready)
      // await Future.delayed(const Duration(milliseconds: 500));
      // if (mounted) {
      //   Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
      // }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      _showErrorMessage('Login failed. Please try again.');
    }
  }

  Future<void> _handleGoogleSignIn() async {
    // Dismiss keyboard
    FocusScope.of(context).unfocus();
    
    setState(() => _isGoogleLoading = true);

    try {
      await _googleSignIn.initialize();
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );

      if (!mounted) return;

      final String userName = googleUser.displayName ?? 'User';
      final String userEmail = googleUser.email;

      debugPrint('Google Sign-In success');
      debugPrint('Name: $userName');
      debugPrint('Email: $userEmail');
      debugPrint('Photo: ${googleUser.photoUrl}');

      setState(() => _isGoogleLoading = false);
      _showSuccessMessage('Google Sign-In successful!', userName);

      // Navigate to home screen (uncomment when ready)
      // await Future.delayed(const Duration(milliseconds: 500));
      // if (mounted) {
      //   Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
      // }
    } on GoogleSignInException catch (error) {
      debugPrint('Google Sign-In exception: ${error.code} ${error.description}');
      if (!mounted) return;
      setState(() => _isGoogleLoading = false);
      if (error.code == GoogleSignInExceptionCode.canceled) {
        _showErrorMessage('Sign-in was cancelled');
      } else {
        _showErrorMessage('Failed to sign in with Google');
      }
    } catch (error) {
      debugPrint('Google Sign-In error: $error');
      if (!mounted) return;
      setState(() => _isGoogleLoading = false);
      _showErrorMessage('Failed to sign in with Google');
    }
  }

  void _handleFacebookSignIn() {
    _showErrorMessage('Facebook Sign-In coming soon!');
  }

  void _handleEmailSignIn() {
    // Scroll to top and focus email field
    _emailFocusNode.requestFocus();
  }


  // ============ UI BUILDERS ============

  Widget _buildLogo() {
    return Hero(
      tag: 'app_logo',
      child: Image.asset(
        "assets/icons/app_logo.png",
        width: 150,
        height: 150,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Welcome Back!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff212121),
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Log in to continue your journey',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff757575),
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xff212121),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _emailController,
          focusNode: _emailFocusNode,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: _validateEmail,
          onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
          cursorHeight: 20,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: 'Enter your email address',
            hintStyle: TextStyle(
              color: Color(0xffBDBDBD),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Color(0xff757575),
              size: 22,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xff2196F3), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffF44336), width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffF44336), width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            errorStyle: TextStyle(fontSize: 12, height: 1.2),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xff212121),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          obscureText: _obscurePassword,
          textInputAction: TextInputAction.done,
          validator: _validatePassword,
          onFieldSubmitted: (_) => _handleLogin(),
          cursorHeight: 20,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: TextStyle(
              color: Color(0xffBDBDBD),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(
              Icons.lock_outlined,
              color: Color(0xff757575),
              size: 22,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword 
                    ? Icons.visibility_outlined 
                    : Icons.visibility_off_outlined,
                color: Color(0xff757575),
                size: 22,
              ),
              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              tooltip: _obscurePassword ? 'Show password' : 'Hide password',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xff2196F3), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffF44336), width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffF44336), width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            errorStyle: TextStyle(fontSize: 12, height: 1.2),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.forgetPasswordScreen),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff2196F3),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: (_isLoading || _isGoogleLoading) ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff2196F3),
          foregroundColor: Colors.white,
          disabledBackgroundColor: Color(0xffBDBDBD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: _isLoading
            ? SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Log In',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffE0E0E0),
            thickness: 1,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Or continue with',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff9E9E9E),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xffE0E0E0),
            thickness: 1,
            height: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required VoidCallback? onPressed,
    required Widget child,
    bool isLoading = false,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffE5E7EB),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff2196F3)),
                    ),
                  )
                : child,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          onPressed: (_isLoading || _isGoogleLoading) ? null : _handleEmailSignIn,
          child: Icon(
            Icons.email_outlined,
            color: Color(0xff757575),
            size: 26,
          ),
        ),
        const SizedBox(width: 16),
        _buildSocialButton(
          onPressed: (_isLoading || _isGoogleLoading) ? null : _handleFacebookSignIn,
          child: Image.asset(
            "assets/icons/facebook_icon.png",
            width: 26,
            height: 26,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 16),
        _buildSocialButton(
          onPressed: (_isLoading || _isGoogleLoading) ? null : _handleGoogleSignIn,
          isLoading: _isGoogleLoading,
          child: Image.asset(
            "assets/icons/google_icon.png",
            width: 26,
            height: 26,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterLink() {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff757575),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.registerScreen),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff2196F3),
                decoration: TextDecoration.underline,
                decorationColor: Color(0xff2196F3),
              ),
            ),
          ),
        ],
      ),
    );
  }


  // ============ BUILD ============

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      
                      // Logo
                      _buildLogo(),
                      const SizedBox(height: 24),
                      
                      // Header
                      _buildHeader(),
                      const SizedBox(height: 40),
                      
                      // Email Field
                      _buildEmailField(),
                      const SizedBox(height: 20),
                      
                      // Password Field
                      _buildPasswordField(),
                      const SizedBox(height: 12),
                      
                      // Forgot Password
                      _buildForgotPassword(),
                      const SizedBox(height: 28),
                      
                      // Login Button
                      _buildLoginButton(),
                      const SizedBox(height: 24),
                      
                      // Divider
                      _buildDivider(),
                      const SizedBox(height: 24),
                      
                      // Social Buttons
                      _buildSocialButtons(),
                      const SizedBox(height: 28),
                      
                      // Register Link
                      _buildRegisterLink(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



