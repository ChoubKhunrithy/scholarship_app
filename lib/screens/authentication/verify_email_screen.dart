
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scholarship_app/screens/authentication/otp_service.dart';


class VerifyEmailScreen extends StatefulWidget {
  final String emailOrPhone;

  const VerifyEmailScreen({super.key, required this.emailOrPhone});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen>
    with SingleTickerProviderStateMixin {
  final List<TextEditingController> _codeControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List.generate(6, (_) => FocusNode());
  final OTPService _otpService = OTPService();

  bool _isLoading = false;
  String? _error;
  int _remainingSeconds = 60;
  bool _canResend = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
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
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    for (var c in _codeControllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // ── Timer ────────────────────────────────────────────────────────────────────
  // ✅ Fix: _startResendTimer() reset once only, _tick() handles countdown

  void _startResendTimer() {
    _remainingSeconds = 60;  // Reset once here only
    _canResend = false;
    _tick();                  // Start ticking
  }

  void _tick() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _remainingSeconds--;
        if (_remainingSeconds <= 0) {
          _canResend = true;   // Enable resend button
        } else {
          _tick();             // Continue countdown (no reset!)
        }
      });
    });
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────

  String _getOTPCode() => _codeControllers.map((c) => c.text).join();

  String _maskedDestination() {
    final d = widget.emailOrPhone;
    if (d.contains('@')) {
      final parts = d.split('@');
      final name = parts[0];
      return '${name.substring(0, name.length.clamp(0, 3))}***@${parts[1]}';
    }
    if (d.length > 4) {
      return '${d.substring(0, d.length - 4)}****';
    }
    return d;
  }

  // ── Verify ───────────────────────────────────────────────────────────────────

  Future<void> _verifyCode() async {
    FocusScope.of(context).unfocus();
    setState(() => _error = null);

    final code = _getOTPCode();
    if (code.length < 6) {
      setState(() => _error = 'Please enter all 6 digits');
      return;
    }

    setState(() => _isLoading = true);

    if (code == '123456') {
      await Future.delayed(const Duration(milliseconds: 600));
      if (!mounted) return;
      setState(() => _isLoading = false);
      _showSuccessSnackBar('OTP verified successfully!');
      await Future.delayed(const Duration(milliseconds: 900));
      //if (mounted) Navigator.pushNamed(context, AppRoutes.tellUsAboutYouScreen);
    } else {
      await Future.delayed(const Duration(milliseconds: 600));
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Incorrect code. Please try again.';
      });
    }
  }

  // ── Resend ───────────────────────────────────────────────────────────────────

  Future<void> _resendCode() async {
    if (!_canResend) return;
    setState(() {
      _error = null;
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _canResend = false;
    });
    _showInfoSnackBar('A new code has been sent');
    _startResendTimer();
  }

  // ── SnackBars ─────────────────────────────────────────────────────────────────

  void _showSuccessSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(children: [
        const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
        const SizedBox(width: 10),
        Text(msg, style: const TextStyle(fontWeight: FontWeight.w600)),
      ]),
      backgroundColor: const Color(0xff10B981),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150,
        left: 20,
        right: 20,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      duration: const Duration(seconds: 2),
      elevation: 8,
    ));
  }

  void _showInfoSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(children: [
        const Icon(Icons.send_rounded, color: Colors.white, size: 20),
        const SizedBox(width: 10),
        Text(msg, style: const TextStyle(fontWeight: FontWeight.w600)),
      ]),
      backgroundColor: const Color(0xff2196F3),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150,
        left: 20,
        right: 20,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      duration: const Duration(seconds: 2),
      elevation: 8,
    ));
  }

  // ── Build ─────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // ── App Bar ───────────────────────────────────────────────────────
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
                      'Verify Code',
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

            // ── Body ──────────────────────────────────────────────────────────
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        // ── App Logo ──────────────────────────────────────────
                        Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 20,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/icons/app_logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        // ── Title ─────────────────────────────────────────────
                        const Text(
                          'Enter Verification Code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff212121),
                            letterSpacing: -0.5,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ── Subtitle ──────────────────────────────────────────
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff64748B),
                              height: 1.5,
                            ),
                            children: [
                              const TextSpan(text: 'We sent a 6-digit code to\n'),
                              TextSpan(
                                text: _maskedDestination(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2196F3),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        // ── OTP Card ──────────────────────────────────────────
                        Container(
                          padding: const EdgeInsets.all(24),
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
                            children: [
                              // 6 OTP Boxes
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(6, (i) {
                                  final hasValue =
                                      _codeControllers[i].text.isNotEmpty;
                                  final isError = _error != null;

                                  return _OTPBox(
                                    controller: _codeControllers[i],
                                    focusNode: _focusNodes[i],
                                    hasValue: hasValue,
                                    isError: isError,
                                    onChanged: (val) {
                                      setState(() {});
                                      if (val.isNotEmpty && i < 5) {
                                        _focusNodes[i + 1].requestFocus();
                                      }
                                      if (val.isEmpty && i > 0) {
                                        _focusNodes[i - 1].requestFocus();
                                      }
                                      if (_error != null) {
                                        setState(() => _error = null);
                                      }
                                    },
                                    onKeyDown: (event) {
                                      if (event is KeyDownEvent &&
                                          event.logicalKey ==
                                              LogicalKeyboardKey.backspace &&
                                          _codeControllers[i].text.isEmpty &&
                                          i > 0) {
                                        _focusNodes[i - 1].requestFocus();
                                      }
                                    },
                                  );
                                }),
                              ),

                              // Error Message
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 250),
                                child: _error != null
                                    ? Padding(
                                        key: const ValueKey('error'),
                                        padding:
                                            const EdgeInsets.only(top: 16),
                                        child: Row(
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
                                                  fontSize: 13,
                                                  color: Color(0xffEF4444),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox(
                                        key: ValueKey('empty'),
                                        height: 0,
                                      ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ── Timer / Resend ────────────────────────────────────
                        Center(
                          child: !_canResend
                              ? _TimerBadge(seconds: _remainingSeconds)
                              : GestureDetector(
                                  onTap: _resendCode,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff2196F3),
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.refresh_rounded,
                                            size: 16,
                                            color: Color(0xff2196F3)),
                                        SizedBox(width: 6),
                                        Text(
                                          'Resend Code',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff2196F3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ),

                        const SizedBox(height: 28),

                        // ── Verify Button ─────────────────────────────────────
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: [Color(0xff2196F3), Color(0xff1976D2)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff2196F3).withOpacity(0.30),
                                blurRadius: 16,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _verifyCode,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              disabledBackgroundColor:
                                  const Color(0xffE2E8F0),
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
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.white),
                                    ),
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Verify Code',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(Icons.verified_user_rounded,
                                          size: 20),
                                    ],
                                  ),
                          ),
                        ),

                        // ── END ───────────────────────────────────────────────
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

// ── OTP Box Widget ────────────────────────────────────────────────────────────

class _OTPBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool hasValue;
  final bool isError;
  final ValueChanged<String> onChanged;
  final ValueChanged<KeyEvent> onKeyDown;

  const _OTPBox({
    required this.controller,
    required this.focusNode,
    required this.hasValue,
    required this.isError,
    required this.onChanged,
    required this.onKeyDown,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isError
        ? const Color(0xffEF4444)
        : hasValue
            ? const Color(0xff2196F3)
            : const Color(0xFFE2E8F0);

    final Color fillColor = isError
        ? const Color(0xFFFEF2F2)
        : hasValue
            ? const Color(0xFFEFF6FF)
            : const Color(0xFFF8FAFC);

    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: onKeyDown,
      child: SizedBox(
        width: 48,
        height: 56,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor, width: 1.8),
            boxShadow: hasValue && !isError
                ? [
                    BoxShadow(
                      color: const Color(0xff2196F3).withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: onChanged,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: isError
                  ? const Color(0xffEF4444)
                  : const Color(0xff212121),
            ),
          ),
        ),
      ),
    );
  }
}


// ── Timer Badge Widget ────────────────────────────────────────────────────────

class _TimerBadge extends StatelessWidget {
  final int seconds;

  const _TimerBadge({required this.seconds});

  @override
  Widget build(BuildContext context) {
    final double progress = seconds / 60.0;

    return Column(
      children: [
        const Text(
          'Didn\'t receive the code?',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xff94A3B8),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 2.5,
                backgroundColor: const Color(0xFFE2E8F0),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xff2196F3),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Resend in ${seconds}s',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff94A3B8),
              ),
            ),
          ],
        ),
      ],
    );
  }
}