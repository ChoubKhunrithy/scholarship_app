// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';

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
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

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
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.7, curve: Curves.easeOutCubic),
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    for (var c in _codeControllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }

  // ── Timer ────────────────────────────────────────────────────────────────────

  void _startResendTimer() {
    _remainingSeconds = 60;
    _canResend = false;
    _tick();
  }

  void _tick() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _remainingSeconds--;
        if (_remainingSeconds <= 0) {
          _canResend = true;
        } else {
          _tick();
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
    final t = AppLocalizations.of(context);
    FocusScope.of(context).unfocus();
    setState(() => _error = null);

    final code = _getOTPCode();
    if (code.length < 6) {
      setState(() => _error = t.translate('verifyCodeEnterAllDigits'));
      return;
    }

    setState(() => _isLoading = true);

    if (code == '123456') {
      await Future.delayed(const Duration(milliseconds: 600));
      if (!mounted) return;
      setState(() => _isLoading = false);
      _showSuccessSnackBar(t.translate('verifyCodeSuccess'));
      await Future.delayed(const Duration(milliseconds: 900));
      //if (mounted) Navigator.pushNamed(context, AppRoutes.tellUsAboutYouScreen);
    } else {
      await Future.delayed(const Duration(milliseconds: 600));
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = t.translate('verifyCodeIncorrect');
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
    final t = AppLocalizations.of(context);
    _showInfoSnackBar(t.translate('verifyCodeNewCodeSent'));
    _startResendTimer();
  }

  // ── SnackBars ─────────────────────────────────────────────────────────────────

  void _showSuccessSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check_circle_rounded,
              color: Colors.white, size: 18),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(msg, style: const TextStyle(fontWeight: FontWeight.w600)),
        ),
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
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(msg, style: const TextStyle(fontWeight: FontWeight.w600)),
        ),
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
    final t = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: Column(
        children: [
          // ── Gradient Header ─────────────────────────────────────────────
          Container(
            width: double.infinity,
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
                            t.translate('verifyCodeTitle'),
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
                    // Shield icon in white circle
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
                        Icons.verified_user_rounded,
                        size: 38,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Title
                    Text(
                      t.translate('verifyCodeSubtitle'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subtitle
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.85),
                          height: 1.4,
                        ),
                        children: [
                          TextSpan(
                              text: '${t.translate('verifyCodeSentTo')}\n'),
                          TextSpan(
                            text: _maskedDestination(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
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

          // ── Card Content ────────────────────────────────────────────────
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
                                    colorScheme: cs,
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
                                        padding: const EdgeInsets.only(top: 16),
                                        child: Row(
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
                                                  fontSize: 13,
                                                  color: cs.error,
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

                              const SizedBox(height: 24),

                              // ── Timer / Resend ──────────────────────────
                              !_canResend
                                  ? _TimerBadge(
                                      seconds: _remainingSeconds,
                                      colorScheme: cs,
                                    )
                                  : GestureDetector(
                                      onTap: _resendCode,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: cs.primary, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.refresh_rounded,
                                                size: 16, color: cs.primary),
                                            const SizedBox(width: 6),
                                            Text(
                                              t.translate('verifyCodeResend'),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: cs.primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                              const SizedBox(height: 24),

                              // ── Verify Button ──────────────────────────
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: _isLoading ? null : _verifyCode,
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
                                            Icon(Icons.verified_user_rounded,
                                                size: 20, color: cs.onPrimary),
                                            const SizedBox(width: 8),
                                            Text(
                                              t.translate('verifyCodeButton'),
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

// ── OTP Box Widget ────────────────────────────────────────────────────────────

class _OTPBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool hasValue;
  final bool isError;
  final ColorScheme colorScheme;
  final ValueChanged<String> onChanged;
  final ValueChanged<KeyEvent> onKeyDown;

  const _OTPBox({
    required this.controller,
    required this.focusNode,
    required this.hasValue,
    required this.isError,
    required this.colorScheme,
    required this.onChanged,
    required this.onKeyDown,
  });

  @override
  Widget build(BuildContext context) {
    final cs = colorScheme;

    final Color borderColor = isError
        ? cs.error
        : hasValue
            ? cs.primary
            : cs.outlineVariant;

    final Color fillColor = isError
        ? cs.errorContainer.withOpacity(0.3)
        : hasValue
            ? cs.primaryContainer.withOpacity(0.3)
            : cs.surfaceContainerHighest.withOpacity(0.4);

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
                      color: cs.primary.withOpacity(0.15),
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
            cursorColor: cs.primary,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: isError ? cs.error : cs.onSurface,
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
  final ColorScheme colorScheme;

  const _TimerBadge({required this.seconds, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final cs = colorScheme;
    final double progress = seconds / 60.0;

    return Column(
      children: [
        Text(
          t.translate('verifyCodeDidntReceive'),
          style: TextStyle(
            fontSize: 13,
            color: cs.onSurfaceVariant,
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
                backgroundColor: cs.outlineVariant,
                valueColor: AlwaysStoppedAnimation<Color>(cs.primary),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${t.translate('verifyCodeResendIn')} ${seconds}s',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: cs.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
