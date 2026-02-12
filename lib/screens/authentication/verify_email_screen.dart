import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:scholarship_app/routes/app_routes.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String emailOrPhone;
  
  const VerifyEmailScreen({super.key, required this.emailOrPhone});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  late String email;
  late Timer _timer;
  int _secondsRemaining = 45;
  bool _canResend = false;

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    email = widget.emailOrPhone;
    // Add listeners to focus nodes to update UI when focus changes
    for (var focusNode in _focusNodes) {
      focusNode.addListener(_onFocusChange);
    }
    _startTimer();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.removeListener(_onFocusChange);
      focusNode.dispose();
    }
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _onCodeChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _canResend = true;
          _timer.cancel();
        }
      });
    });
  }

  void _handleResendCode() {
    if (_canResend) {
      setState(() {
        _secondsRemaining = 45;
        _canResend = false;
      });
      _startTimer();
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left, 
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.registerScreen);
          },
        ),
        title: Text(
          'Verify Code',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff212121),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 20),
              // Header Icon
              Center(
                child: Image.asset(
                  "assets/icons/app_logo.png",
                  width: 140,
                  height: 140,
                ),
              ),
              // Description
              Text(
                'We sent a 6-digit code to $email',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff757575),
                ),
              ),
              SizedBox(height: 40),
              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  // final isFocused = _focusNodes[index].hasFocus;
                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff212121),
                        height: 1.0,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xff2691f3),
                            width: 3,
                          ),
                        ),
                        filled: true,
                        fillColor: _controllers[index].text.isNotEmpty
                            ? const Color(0xFFF3F4F6)
                            : Colors.white,
                      ),
                      onChanged: (value) {
                        _onCodeChanged(index, value);
                        setState(() {});
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 40),
              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Check if all fields are filled
                    bool allFilled = _controllers.every(
                      (controller) => controller.text.isNotEmpty,
                    );
                    if (allFilled) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.personalInfoScreen, //tellUsAboutYouScreen
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2196f3),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Resend Code Link
              Center(
                child: GestureDetector(
                  onTap: _canResend ? _handleResendCode : null,
                  child: Text(
                    'Resend Code (${_formatTime(_secondsRemaining)})',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _canResend ? const Color(0xFF2196F3) : const Color(0xFF6B7280),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
