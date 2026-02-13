
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scholarship_app/routes/app_routes.dart';
import 'package:scholarship_app/screens/authentication/otp_service.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final OTPService _otpService = OTPService();

  bool _isLoading = false;
  String? _error;
  String? _verificationId;
  String _selectedCountryCode = '+855';

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final Map<String, Map<String, String>> _countryCodes = {
    '+855': {'flag': '🇰🇭', 'name': 'Cambodia', 'code': '+855'},
    '+1': {'flag': '🇺🇸', 'name': 'USA', 'code': '+1'},
    '+44': {'flag': '🇬🇧', 'name': 'UK', 'code': '+44'},
    '+91': {'flag': '🇮🇳', 'name': 'India', 'code': '+91'},
    '+86': {'flag': '🇨🇳', 'name': 'China', 'code': '+86'},
    '+81': {'flag': '🇯🇵', 'name': 'Japan', 'code': '+81'},
    '+82': {'flag': '🇰🇷', 'name': 'South Korea', 'code': '+82'},
    '+84': {'flag': '🇻🇳', 'name': 'Vietnam', 'code': '+84'},
    '+66': {'flag': '🇹🇭', 'name': 'Thailand', 'code': '+66'},
    '+65': {'flag': '🇸🇬', 'name': 'Singapore', 'code': '+65'},
    '+60': {'flag': '🇲🇾', 'name': 'Malaysia', 'code': '+60'},
    '+62': {'flag': '🇮🇩', 'name': 'Indonesia', 'code': '+62'},
    '+63': {'flag': '🇵🇭', 'name': 'Philippines', 'code': '+63'},
    '+61': {'flag': '🇦🇺', 'name': 'Australia', 'code': '+61'},
    '+33': {'flag': '🇫🇷', 'name': 'France', 'code': '+33'},
    '+49': {'flag': '🇩🇪', 'name': 'Germany', 'code': '+49'},
  };

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );
    _animationController.forward();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // ── Validation ──────────────────────────────────────────────────────────────

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final clean = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    if (!RegExp(r'^[\d]+$').hasMatch(clean)) {
      return 'Phone number must contain only digits';
    }
    if (clean.length < 8 || clean.length > 12) {
      return 'Phone number must be 8–12 digits';
    }
    if (clean.startsWith('0') && _selectedCountryCode == '+855') {
      return 'Remove leading 0 from phone number';
    }
    return null;
  }

  // ── Country Picker ──────────────────────────────────────────────────────────

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        height: MediaQuery.of(ctx).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Select Country',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff212121),
                ),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: _countryCodes.length,
                itemBuilder: (_, index) {
                  final code = _countryCodes.keys.elementAt(index);
                  final country = _countryCodes[code]!;
                  final isSelected = code == _selectedCountryCode;
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedCountryCode = code;
                          if (_error != null) _error = null;
                        });
                        Navigator.pop(ctx);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        color: isSelected
                            ? const Color(0xFFEFF6FF)
                            : Colors.transparent,
                        child: Row(
                          children: [
                            Text(
                              country['flag']!,
                              style: const TextStyle(fontSize: 28),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                country['name']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? const Color(0xff2196F3)
                                      : const Color(0xff212121),
                                ),
                              ),
                            ),
                            Text(
                              country['code']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff64748B),
                              ),
                            ),
                            const SizedBox(width: 12),
                            if (isSelected)
                              const Icon(
                                Icons.check_circle_rounded,
                                color: Color(0xff2196F3),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Send OTP ────────────────────────────────────────────────────────────────

  Future<void> _sendRealOTP() async {
    FocusScope.of(context).unfocus();
    setState(() => _error = null);

    final value = _phoneController.text.trim();
    final validationError = _validatePhone(value);
    if (validationError != null) {
      setState(() => _error = validationError);
      return;
    }

    setState(() => _isLoading = true);

    final cleanPhone = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    final fullPhoneNumber = '$_selectedCountryCode$cleanPhone';

    await _otpService.sendOTP(
      phoneNumber: fullPhoneNumber,
      onCodeSent: (verificationId) {
        if (!mounted) return;
        setState(() {
          _isLoading = false;
          _verificationId = verificationId;
        });
        _showSuccessMessage('OTP sent via SMS to $fullPhoneNumber');
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            Navigator.pushNamed(
              context,
              AppRoutes.verifyEmailScreen,
              arguments: fullPhoneNumber,
            );
          }
        });
      },
      onError: (errorMessage) {
        if (!mounted) return;
        setState(() {
          _isLoading = false;
          _error = errorMessage;
        });
      },
      onAutoVerify: (credential) {
        if (!mounted) return;
        setState(() => _isLoading = false);
        _showSuccessMessage('Phone verified automatically!');
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            Navigator.pushNamed(
              context,
              AppRoutes.verifyEmailScreen,
              arguments: fullPhoneNumber,
            );
          }
        });
      },
    );
  }

  // ── Success SnackBar ────────────────────────────────────────────────────────

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Success!',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff10B981),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 20,
          right: 20,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        duration: const Duration(seconds: 3),
        elevation: 8,
      ),
    );
  }

  // ── Build ───────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final currentCountry = _countryCodes[_selectedCountryCode]!;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // ── App Bar ────────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff212121),
                        size: 18,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      'Forgot Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff212121),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // ── Content ────────────────────────────────────────────────────
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8),

                        // App Logo
                        Center(
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 24,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            // padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              'assets/icons/app_logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Title
                        const Text(
                          'Reset Your Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff212121),
                            letterSpacing: -0.5,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Description
                        const Text(
                          'Enter your phone number and we\'ll send\nyou a verification code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff64748B),
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 40),

                        // ── Input Card ──────────────────────────────────────
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Label
                              const Row(
                                children: [
                                  Icon(
                                    Icons.phone_android_rounded,
                                    size: 18,
                                    color: Color(0xff2196F3),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff475569),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              // Input Row (Country + Phone)
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: _error != null
                                        ? const Color(0xffEF4444)
                                        : _focusNode.hasFocus
                                        ? const Color(0xff2196F3)
                                        : const Color(0xFFE2E8F0),
                                    width: _focusNode.hasFocus ? 2 : 1.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Country Selector
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: _showCountryPicker,
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                              left: Radius.circular(14),
                                            ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 16,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                currentCountry['flag']!,
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                currentCountry['code']!,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff1E293B),
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              const Icon(
                                                Icons.arrow_drop_down_rounded,
                                                color: Color(0xff64748B),
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Divider
                                    Container(
                                      width: 1,
                                      height: 40,
                                      color: const Color(0xFFE2E8F0),
                                    ),

                                    // Phone Input
                                    Expanded(
                                      child: TextFormField(
                                        controller: _phoneController,
                                        focusNode: _focusNode,
                                        keyboardType: TextInputType.phone,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (_) => _sendRealOTP(),
                                        cursorColor: const Color(0xff2196F3),
                                        cursorHeight: 20,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff1E293B),
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: '12 345 678',
                                          hintStyle: TextStyle(
                                            color: Color(0xffCBD5E1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 16,
                                          ),
                                        ),
                                        onChanged: (_) {
                                          if (_error != null) {
                                            setState(() => _error = null);
                                          }
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Error Message
                              if (_error != null) ...[
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.error_outline_rounded,
                                      size: 16,
                                      color: Color(0xffEF4444),
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        _error!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffEF4444),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ── Send Button ─────────────────────────────────────
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: [Color(0xff2196F3), Color(0xff1976D2)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xff2196F3).withOpacity(0.3),
                                blurRadius: 16,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _sendRealOTP,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              disabledBackgroundColor: const Color(0xffE2E8F0),
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Send Verification Code',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        // ── END ────────────────────────────────────────────
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
