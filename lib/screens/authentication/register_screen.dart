
// file for register screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_app/routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _useEmail = true;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String _selectedCountryCode = '+1'; // Default to +1 (USA)

  // List of countries with their dial codes
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

  // Validation errors
  String? _nameError;
  String? _emailError;
  String? _phoneError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      // Reset errors
      _nameError = null;
      _emailError = null;
      _phoneError = null;
      _passwordError = null;
      _confirmPasswordError = null;

      // Validate Full Name
      if (_nameController.text.trim().isEmpty) {
        _nameError = 'Please enter name.';
      }

      // Validate Email or Phone
      if (_useEmail) {
        if (_emailController.text.trim().isEmpty) {
          _emailError = 'Please enter email address.';
        } else if (!_isValidEmail(_emailController.text.trim())) {
          _emailError = 'Please enter a valid email address.';
        }
      } else {
        if (_phoneController.text.trim().isEmpty) {
          _phoneError = 'Please enter phone number.';
        } else if (!_isValidPhone(_phoneController.text.trim())) {
          _phoneError = 'Please enter a valid phone number.';
        }
      }

      // Validate Password
      if (_passwordController.text.isEmpty) {
        _passwordError =
            'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.';
      } else if (!_isValidPassword(_passwordController.text)) {
        _passwordError =
            'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.';
      }

      // Validate Confirm Password
      if (_confirmPasswordController.text.isEmpty) {
        _confirmPasswordError = 'Please confirm password again.';
      } else if (_passwordController.text != _confirmPasswordController.text) {
        _confirmPasswordError = 'Passwords do not match.';
      }
    });
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isValidPhone(String phone) {
    final cleanedPhone = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    // Check if phone number is valid length and doesn't start with 0
    return RegExp(r'^[1-9][0-9]{7,14}$').hasMatch(cleanedPhone);
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
    _validateForm();

    if (_nameError == null &&
        (_useEmail ? _emailError == null : _phoneError == null) &&
        _passwordError == null &&
        _confirmPasswordError == null) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Navigate to verify email screen
      if (mounted) {
        final emailOrPhone = _useEmail ? _emailController.text : '$_selectedCountryCode${_phoneController.text}';
        Navigator.pushNamed(
          context,
          AppRoutes.verifyEmailScreen,
          arguments: emailOrPhone,
        );
      }
    }
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
            Navigator.pushNamed(context, AppRoutes.loginScreen);
          },
        ),
        title: Text(
          'Register',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xff212121),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Icon
                Center(
                  child: Image.asset(
                    "assets/icons/app_logo.png",
                    width: 140,
                    height: 140,
                  ),
                ),
                // Subtitle
                Center(
                  child: Text(
                    'Please enter your detail to sign in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff757575),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Full Name Field
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff212121),
                  ),
                ),
                SizedBox(height: 2),
                SizedBox(
                  height: 50,
                  child: TextField(
                    cursorHeight: 14,
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Color(0xffbdbdbd),
                        size: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _nameError != null
                              ? Colors.red
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _nameError != null
                              ? Colors.red
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xff2196f3),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (_) {
                      if (_nameError != null) {
                        setState(() {
                          _nameError = null;
                        });
                      }
                    },
                  ),
                ),
                if (_nameError != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    _nameError!,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ],
                SizedBox(height: 16),
                // Email or Phone Field
                Text(
                  _useEmail ? 'Email' : 'Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff212121),
                  ),
                ),
                SizedBox(height: 2),
                if (_useEmail)
                  SizedBox(
                    height: 50,
                    child: TextField(
                      cursorHeight: 14,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xffbdbdbd),
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: _emailError != null
                                ? Colors.red
                                : const Color(0xFFE5E7EB),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: _emailError != null
                                ? Colors.red
                                : const Color(0xFFE5E7EB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xff2196f3),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (_) {
                        if (_emailError != null) {
                          setState(() {
                            _emailError = null;
                          });
                        }
                      },
                    ),
                  )
                else
                  Row(
                    children: [
                      // Country Code Dropdown
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButton<String>(
                          value: _selectedCountryCode,
                          items: _countryCodes.entries
                              .map((entry) => DropdownMenuItem(
                                    value: entry.key,
                                    child: Text(
                                      entry.value,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedCountryCode = newValue;
                                if (_phoneError != null) {
                                  _phoneError = null;
                                }
                              });
                            }
                          },
                          underline: SizedBox(),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          isExpanded: false,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffbdbdbd),
                            size: 20,
                          ),
                          style: TextStyle(
                            color: Color(0xff212121),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      // Phone Number TextField
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            cursorHeight: 14,
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              _PhoneInputFormatter(),
                            ],
                            decoration: InputDecoration(
                              hintText: 'Enter phone number',
                              hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: _phoneError != null
                                      ? Colors.red
                                      : const Color(0xFFE5E7EB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: _phoneError != null
                                      ? Colors.red
                                      : const Color(0xFFE5E7EB),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Color(0xff2196f3),
                                  width: 2,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                            ),
                            onChanged: (_) {
                              if (_phoneError != null) {
                                setState(() {
                                  _phoneError = null;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 2),
                // Toggle Link
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
                        ? 'Use phone number instead'
                        : 'Use email address instead',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2196f3),
                    ),
                  ),
                ),
                if ((_useEmail ? _emailError : _phoneError) != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    _useEmail ? _emailError! : _phoneError!,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ],
                SizedBox(height: 10),
                // Password Field
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff212121),
                  ),
                ),
                SizedBox(height: 2),
                SizedBox(
                  height: 50,
                  child: TextField(
                    cursorHeight: 14,
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xffbdbdbd),
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: const Color(0xffbdbdbd),
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _passwordError != null
                              ? Colors.red
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _passwordError != null
                              ? Colors.red
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xff2196f3),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (_) {
                      if (_passwordError != null) {
                        setState(() {
                          _passwordError = null;
                        });
                      }
                    },
                  ),
                ),
                if (_passwordError != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    _passwordError!,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ],
                SizedBox(height: 16),
                // Confirm Password Field
                Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff212121),
                  ),
                ),
                SizedBox(height: 2),
                SizedBox(
                  height: 50,
                  child: TextField(
                    cursorHeight: 16,
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      hintText: 'Confirm your password',
                      hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xffbdbdbd),
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Color(0xffbdbdbd),
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _confirmPasswordError != null
                              ? Colors.red
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _confirmPasswordError != null
                              ? Colors.red
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xff2196f3),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (_) {
                      if (_confirmPasswordError != null) {
                        setState(() {
                          _confirmPasswordError = null;
                        });
                      }
                    },
                  ),
                ),
                if (_confirmPasswordError != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    _confirmPasswordError!,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ],
                SizedBox(height: 18),
                // Register Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleRegister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isLoading
                          ? const Color(0xFF9CA3AF)
                          : const Color(0xff2196f3),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                      disabledBackgroundColor: const Color(0xFF9CA3AF),
                    ),
                    child: _isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 12),
                // Already have account link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffbdbdbd),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.loginScreen);
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2196f3),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                // Social Login Icons
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Facebook Icon
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/icons/google_icon.png",
                            width: 22,
                            height: 22,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      // Google Icon
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        child: Center(
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
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom formatter to prevent phone numbers from starting with 0
class _PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    // If the text starts with 0, remove it
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
