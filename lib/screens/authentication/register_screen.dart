// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
import 'package:scholarship_app/routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _useEmail = true;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String _selectedCountryCode = '+1';

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  final Map<String, String> _countryCodes = {
    '+1': '🇺🇸 +1',
    '+44': '🇬🇧 +44',
    '+91': '🇮🇳 +91',
    '+86': '🇨🇳 +86',
    '+81': '🇯🇵 +81',
    '+33': '🇫🇷 +33',
    '+49': '🇩🇪 +49',
    '+39': '🇮🇹 +39',
    '+34': '🇪🇸 +34',
    '+61': '🇦🇺 +61',
    '+55': '🇧🇷 +55',
    '+54': '🇦🇷 +54',
    '+52': '🇲🇽 +52',
    '+27': '🇿🇦 +27',
    '+234': '🇳🇬 +234',
    '+20': '🇪🇬 +20',
    '+60': '🇲🇾 +60',
    '+65': '🇸🇬 +65',
    '+82': '🇰🇷 +82',
    '+84': '🇻🇳 +84',
    '+62': '🇮🇩 +62',
    '+63': '🇵🇭 +63',
    '+855': '🇰🇭 +855',
    '+90': '🇹🇷 +90',
    '+966': '🇸🇦 +966',
    '+971': '🇦🇪 +971',
  };

  String? _nameError;
  String? _emailError;
  String? _phoneError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.1, 0.8, curve: Curves.easeOutCubic),
      ),
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _animController.dispose();
    super.dispose();
  }

  // ============ VALIDATION ============

  void _validateForm() {
    final t = AppLocalizations.of(context);
    setState(() {
      _nameError = null;
      _emailError = null;
      _phoneError = null;
      _passwordError = null;
      _confirmPasswordError = null;

      if (_nameController.text.trim().isEmpty) {
        _nameError = t.translate('registerNameRequired');
      }

      if (_useEmail) {
        if (_emailController.text.trim().isEmpty) {
          _emailError = t.translate('registerEmailRequired');
        } else if (!_isValidEmail(_emailController.text.trim())) {
          _emailError = t.translate('registerEmailInvalid');
        }
      } else {
        if (_phoneController.text.trim().isEmpty) {
          _phoneError = t.translate('registerPhoneRequired');
        } else if (!_isValidPhone(_phoneController.text.trim())) {
          _phoneError = t.translate('registerPhoneInvalid');
        }
      }

      if (_passwordController.text.isEmpty) {
        _passwordError = t.translate('registerPasswordInvalid');
      } else if (!_isValidPassword(_passwordController.text)) {
        _passwordError = t.translate('registerPasswordInvalid');
      }

      if (_confirmPasswordController.text.isEmpty) {
        _confirmPasswordError = t.translate('registerConfirmPasswordRequired');
      } else if (_passwordController.text != _confirmPasswordController.text) {
        _confirmPasswordError = t.translate('registerPasswordsMismatch');
      }
    });
  }

  bool _isValidEmail(String email) =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  bool _isValidPhone(String phone) {
    final cleaned = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    return RegExp(r'^[1-9][0-9]{7,14}$').hasMatch(cleaned);
  }

  bool _isValidPassword(String password) {
    if (password.length < 8) return false;
    if (!password.contains(RegExp(r'[A-Z]'))) return false;
    if (!password.contains(RegExp(r'[a-z]'))) return false;
    if (!password.contains(RegExp(r'[0-9]'))) return false;
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
    return true;
  }

  Future<void> _handleRegister() async {
    FocusScope.of(context).unfocus();
    _validateForm();

    if (_nameError == null &&
        (_useEmail ? _emailError == null : _phoneError == null) &&
        _passwordError == null &&
        _confirmPasswordError == null) {
      setState(() => _isLoading = true);

      await Future.delayed(const Duration(seconds: 2));

      setState(() => _isLoading = false);

      if (mounted) {
        final emailOrPhone = _useEmail
            ? _emailController.text
            : '$_selectedCountryCode${_phoneController.text}';
        Navigator.pushNamed(
          context,
          AppRoutes.verifyEmailScreen,
          arguments: emailOrPhone,
        );
      }
    }
  }

  // ============ INPUT DECORATION ============

  InputDecoration _inputDecoration({
    required String hint,
    required IconData prefixIcon,
    Widget? suffixIcon,
    bool hasError = false,
    required ColorScheme cs,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: cs.onSurfaceVariant.withOpacity(0.5),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: Container(
        margin: const EdgeInsets.only(left: 4),
        child: Icon(prefixIcon, color: cs.onSurfaceVariant, size: 20),
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: cs.surfaceContainerHighest.withOpacity(0.4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: hasError ? cs.error : cs.outlineVariant.withOpacity(0.5),
          width: hasError ? 1.5 : 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cs.primary, width: 1.8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cs.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cs.error, width: 1.8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  Widget _buildErrorText(String? error, ColorScheme cs) {
    if (error == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 4),
      child: Text(
        error,
        style: TextStyle(fontSize: 12, color: cs.error, height: 1.2),
      ),
    );
  }

  // ============ BUILD ============

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: cs.surface,
      body: FadeTransition(
        opacity: _fadeAnim,
        child: SlideTransition(
          position: _slideAnim,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ── Gradient Header ─────────────────────────────────────
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 8,
                    bottom: 32,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF1565C0),
                        Color(0xFF1976D2),
                        Color(0xFF2196F3),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Back button row
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Container(
                        width: 76,
                        height: 76,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0D47A1).withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          "assets/icons/app_logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        t.translate('registerTitle'),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        t.translate('registerSubtitle'),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.85),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // ── Form Card ───────────────────────────────────────────
                Transform.translate(
                  offset: const Offset(0, -16),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                    decoration: BoxDecoration(
                      color: cs.surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: cs.shadow.withOpacity(0.08),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Full Name ────────────────────────
                        Text(
                          t.translate('registerFullNameLabel'),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _nameController,
                          cursorHeight: 20,
                          style: TextStyle(
                            fontSize: 15,
                            color: cs.onSurface,
                          ),
                          decoration: _inputDecoration(
                            hint: t.translate('registerFullNameHint'),
                            prefixIcon: Icons.person_outlined,
                            hasError: _nameError != null,
                            cs: cs,
                          ),
                          onChanged: (_) {
                            if (_nameError != null) {
                              setState(() => _nameError = null);
                            }
                          },
                        ),
                        _buildErrorText(_nameError, cs),

                        const SizedBox(height: 18),

                        // ── Email / Phone ────────────────────
                        Row(
                          children: [
                            Text(
                              _useEmail
                                  ? t.translate('registerEmailLabel')
                                  : t.translate('registerPhoneLabel'),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: cs.onSurface,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _useEmail = !_useEmail;
                                  if (_useEmail) {
                                    _phoneError = null;
                                  } else {
                                    _emailError = null;
                                  }
                                });
                              },
                              child: Text(
                                _useEmail
                                    ? t.translate('registerUsePhoneInstead')
                                    : t.translate('registerUseEmailInstead'),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: cs.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        if (_useEmail)
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorHeight: 20,
                            style: TextStyle(
                              fontSize: 15,
                              color: cs.onSurface,
                            ),
                            decoration: _inputDecoration(
                              hint: t.translate('registerEmailHint'),
                              prefixIcon: Icons.email_outlined,
                              hasError: _emailError != null,
                              cs: cs,
                            ),
                            onChanged: (_) {
                              if (_emailError != null) {
                                setState(() => _emailError = null);
                              }
                            },
                          )
                        else
                          Row(
                            children: [
                              // Country code picker
                              Container(
                                height: 52,
                                decoration: BoxDecoration(
                                  color: cs.surfaceContainerHighest
                                      .withOpacity(0.4),
                                  border: Border.all(
                                    color: cs.outlineVariant.withOpacity(0.5),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: DropdownButton<String>(
                                  value: _selectedCountryCode,
                                  items: _countryCodes.entries
                                      .map((e) => DropdownMenuItem(
                                            value: e.key,
                                            child: Text(
                                              e.value,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: cs.onSurface,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (v) {
                                    if (v != null) {
                                      setState(() {
                                        _selectedCountryCode = v;
                                        _phoneError = null;
                                      });
                                    }
                                  },
                                  underline: const SizedBox(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  isExpanded: false,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: cs.onSurfaceVariant,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    _PhoneInputFormatter(),
                                  ],
                                  cursorHeight: 20,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: cs.onSurface,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: t.translate('registerPhoneHint'),
                                    hintStyle: TextStyle(
                                      color:
                                          cs.onSurfaceVariant.withOpacity(0.5),
                                      fontSize: 14,
                                    ),
                                    filled: true,
                                    fillColor: cs.surfaceContainerHighest
                                        .withOpacity(0.4),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide(
                                        color: _phoneError != null
                                            ? cs.error
                                            : cs.outlineVariant
                                                .withOpacity(0.5),
                                        width: _phoneError != null ? 1.5 : 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide(
                                        color: cs.primary,
                                        width: 1.8,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                  onChanged: (_) {
                                    if (_phoneError != null) {
                                      setState(() => _phoneError = null);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        _buildErrorText(
                          _useEmail ? _emailError : _phoneError,
                          cs,
                        ),

                        const SizedBox(height: 18),

                        // ── Password ─────────────────────────
                        Text(
                          t.translate('registerPasswordLabel'),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          cursorHeight: 20,
                          style: TextStyle(
                            fontSize: 15,
                            color: cs.onSurface,
                          ),
                          decoration: _inputDecoration(
                            hint: t.translate('registerPasswordHint'),
                            prefixIcon: Icons.lock_outlined,
                            hasError: _passwordError != null,
                            cs: cs,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: cs.onSurfaceVariant,
                                size: 20,
                              ),
                              onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword),
                            ),
                          ),
                          onChanged: (_) {
                            if (_passwordError != null) {
                              setState(() => _passwordError = null);
                            }
                          },
                        ),
                        _buildErrorText(_passwordError, cs),

                        const SizedBox(height: 18),

                        // ── Confirm Password ─────────────────
                        Text(
                          t.translate('registerConfirmPasswordLabel'),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          cursorHeight: 20,
                          style: TextStyle(
                            fontSize: 15,
                            color: cs.onSurface,
                          ),
                          decoration: _inputDecoration(
                            hint: t.translate('registerConfirmPasswordHint'),
                            prefixIcon: Icons.lock_outlined,
                            hasError: _confirmPasswordError != null,
                            cs: cs,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: cs.onSurfaceVariant,
                                size: 20,
                              ),
                              onPressed: () => setState(() =>
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword),
                            ),
                          ),
                          onChanged: (_) {
                            if (_confirmPasswordError != null) {
                              setState(() => _confirmPasswordError = null);
                            }
                          },
                        ),
                        _buildErrorText(_confirmPasswordError, cs),

                        const SizedBox(height: 24),

                        // ── Register Button ──────────────────
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleRegister,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: cs.primary,
                              foregroundColor: cs.onPrimary,
                              disabledBackgroundColor:
                                  cs.primary.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  )
                                : Text(
                                    t.translate('registerButton'),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Divider ─────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: cs.outlineVariant.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          t.translate('loginOrContinueWith'),
                          style: TextStyle(
                            fontSize: 13,
                            color: cs.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: cs.outlineVariant.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ── Social Icons ─────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    children: [
                      Expanded(
                        child: _SocialCircle(
                          child: Image.asset(
                            "assets/icons/google_icon.png",
                            width: 22,
                            height: 22,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SocialCircle(
                          child: Image.asset(
                            "assets/icons/facebook_icon.png",
                            width: 22,
                            height: 22,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ── Login Link ──────────────────────────────────────────
                Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        t.translate('registerAlreadyHaveAccount'),
                        style: TextStyle(
                          fontSize: 14,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRoutes.loginScreen),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 4),
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          t.translate('registerLoginLink'),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: cs.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Social Circle Widget ────────────────────────────────────────────────────

class _SocialCircle extends StatelessWidget {
  final Widget child;
  const _SocialCircle({required this.child});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withOpacity(0.35),
        border: Border.all(
          color: cs.outlineVariant.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(child: child),
    );
  }
}

// ── Phone Input Formatter ───────────────────────────────────────────────────

class _PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;
    if (newText.isNotEmpty && newText.startsWith('0')) {
      newText = newText.substring(1);
    }
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newText.length),
      ),
    );
  }
}
