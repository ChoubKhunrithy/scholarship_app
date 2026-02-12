// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToOnboarding() async {
    var pref = await SharedPreferences.getInstance();
    var isLogin = pref.getBool("isLogin") ?? false;

    if (mounted) {
      if (isLogin) {
        // Navigate to home screen (when implemented)
        Navigator.pushReplacementNamed(context, "/onboarding_screen");
      } else {
        // Navigate to onboarding screen
        Navigator.pushReplacementNamed(context, "/onboarding_screen");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        navigateToOnboarding();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/icons/app_logo.png",
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
