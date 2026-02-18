// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
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
  String _selectedCountryCode = '+855';

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final Map<String, Map<String, String>> _countryCodes = {
    '+855': {'flag': '🇰🇭', 'nameKey': 'countryNameCambodia', 'code': '+855'},
    '+1': {'flag': '🇺🇸', 'nameKey': 'countryNameUSA', 'code': '+1'},
    '+44': {'flag': '🇬🇧', 'nameKey': 'countryNameUK', 'code': '+44'},
    '+91': {'flag': '🇮🇳', 'nameKey': 'countryNameIndia', 'code': '+91'},
    '+86': {'flag': '🇨🇳', 'nameKey': 'countryNameChina', 'code': '+86'},
    '+81': {'flag': '🇯🇵', 'nameKey': 'countryNameJapan', 'code': '+81'},
    '+82': {'flag': '🇰🇷', 'nameKey': 'countryNameSouthKorea', 'code': '+82'},
    '+84': {'flag': '🇻🇳', 'nameKey': 'countryNameVietnam', 'code': '+84'},
    '+66': {'flag': '🇹🇭', 'nameKey': 'countryNameThailand', 'code': '+66'},
    '+65': {'flag': '🇸🇬', 'nameKey': 'countryNameSingapore', 'code': '+65'},
    '+60': {'flag': '🇲🇾', 'nameKey': 'countryNameMalaysia', 'code': '+60'},
    '+62': {'flag': '🇮🇩', 'nameKey': 'countryNameIndonesia', 'code': '+62'},
    '+63': {'flag': '🇵🇭', 'nameKey': 'countryNamePhilippines', 'code': '+63'},
    '+61': {'flag': '🇦🇺', 'nameKey': 'countryNameAustralia', 'code': '+61'},
    '+33': {'flag': '🇫🇷', 'nameKey': 'countryNameFrance', 'code': '+33'},
    '+49': {'flag': '🇩🇪', 'nameKey': 'countryNameGermany', 'code': '+49'},
  };

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _focusNode.addListener(() => setState(() {}));
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.7, curve: Curves.easeOutCubic),
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
    final t = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return t.translate('forgotPasswordPhoneRequired');
    }
    final clean = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    if (!RegExp(r'^[\d]+$').hasMatch(clean)) {
      return t.translate('forgotPasswordPhoneDigitsOnly');
    }
    if (clean.length < 8 || clean.length > 12) {
      return t.translate('forgotPasswordPhoneLength');
    }
    if (clean.startsWith('0') && _selectedCountryCode == '+855') {
      return t.translate('forgotPasswordRemoveLeadingZero');
    }
    return null;
  }

  // ── Country Picker ──────────────────────────────────────────────────────────

  void _showCountryPicker() {
    final t = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        height: MediaQuery.of(ctx).size.height * 0.6,
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: const BorderRadius.only(
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
                color: cs.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                t.translate('forgotPasswordSelectCountry'),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: cs.onSurface,
                ),
              ),
            ),
            Divider(height: 1, color: cs.outlineVariant),
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
                            ? cs.primary.withOpacity(0.08)
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
                                t.translate(country['nameKey']!),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isSelected ? cs.primary : cs.onSurface,
                                ),
                              ),
                            ),
                            Text(
                              country['code']!,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 12),
                            if (isSelected)
                              Icon(
                                Icons.check_circle_rounded,
                                color: cs.primary,
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
    final t = AppLocalizations.of(context);
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
        });
        _showSuccessMessage(t
            .translate('forgotPasswordOtpSent')
            .replaceAll('\$phone', fullPhoneNumber));
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
        _showSuccessMessage(t.translate('forgotPasswordAutoVerified'));
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
    final t = AppLocalizations.of(context);
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
                  Text(
                    t.translate('forgotPasswordSuccess'),
                    style: const TextStyle(
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
    final t = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final currentCountry = _countryCodes[_selectedCountryCode]!;

    return Scaffold(
      backgroundColor: cs.surface,
      body: Column(
        children: [
          // ── Gradient Header ──────────────────────────────────────────
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1565C0),
                  Color(0xFF1976D2),
                  Color(0xFF2196F3)
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 48),
                child: Column(
                  children: [
                    // Back button row
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Text(
                            t.translate('forgotPasswordTitle'),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Lock icon in white circle
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 20,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.lock_reset_rounded,
                        size: 38,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Title on header
                    Text(
                      t.translate('forgotPasswordResetTitle'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subtitle on header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        t.translate('forgotPasswordDescription'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.85),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Card Content ────────────────────────────────────────────
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -16),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: cs.surface,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 24,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Phone label
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone_android_rounded,
                                    size: 18,
                                    color: cs.primary,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    t.translate('forgotPasswordPhoneLabel'),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: cs.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              // Input Row (Country + Phone)
                              Container(
                                decoration: BoxDecoration(
                                  color: cs.surfaceContainerHighest
                                      .withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: _error != null
                                        ? cs.error
                                        : _focusNode.hasFocus
                                            ? cs.primary
                                            : cs.outlineVariant,
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
                                                    fontSize: 24),
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                currentCountry['code']!,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: cs.onSurface,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Icon(
                                                Icons.arrow_drop_down_rounded,
                                                color: cs.onSurfaceVariant,
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
                                      color: cs.outlineVariant,
                                    ),

                                    // Phone Input
                                    Expanded(
                                      child: TextFormField(
                                        controller: _phoneController,
                                        focusNode: _focusNode,
                                        keyboardType: TextInputType.phone,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (_) => _sendRealOTP(),
                                        cursorColor: cs.primary,
                                        cursorHeight: 20,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: cs.onSurface,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: t.translate(
                                              'forgotPasswordPhoneHint'),
                                          hintStyle: TextStyle(
                                            color: cs.onSurfaceVariant
                                                .withOpacity(0.5),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
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
                                    Icon(
                                      Icons.error_outline_rounded,
                                      size: 16,
                                      color: cs.error,
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        _error!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: cs.error,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],

                              const SizedBox(height: 24),

                              // ── Send Button ─────────────────────────────
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: _isLoading ? null : _sendRealOTP,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: cs.primary,
                                    foregroundColor: cs.onPrimary,
                                    disabledBackgroundColor:
                                        cs.onSurface.withOpacity(0.12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: _isLoading
                                      ? SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    cs.onPrimary),
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.send_rounded,
                                                size: 20, color: cs.onPrimary),
                                            const SizedBox(width: 8),
                                            Text(
                                              t.translate(
                                                  'forgotPasswordSendButton'),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.3,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ── Back to Login link ──────────────────────────────
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              t.translate('forgotPasswordRememberPassword'),
                              style: TextStyle(
                                fontSize: 14,
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                t.translate('forgotPasswordBackToLogin'),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: cs.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
