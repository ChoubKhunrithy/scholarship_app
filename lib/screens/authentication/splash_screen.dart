
// file for splash screen.dart

import 'package:flutter/material.dart';
import 'package:scholarship_app/routes/app_routes.dart';
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
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        navigateToOnboarding();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/icons/app_logo.png",
          width: size.width * 0.6,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}