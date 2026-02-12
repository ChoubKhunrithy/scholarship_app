import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_app/routes/app_routes.dart';
import 'package:scholarship_app/screens/authentication/forget_password_screen.dart';
import 'package:scholarship_app/screens/authentication/login_screen.dart';
import 'package:scholarship_app/screens/authentication/onboarding_screen.dart';
import 'package:scholarship_app/screens/authentication/register_screen.dart';
import 'package:scholarship_app/screens/authentication/splash_screen.dart';
import 'package:scholarship_app/screens/authentication/verify_email_screen.dart';
import 'package:scholarship_app/screens/fill_information/personal_info_screen.dart';
import 'package:scholarship_app/screens/main_app/discover_screen.dart';
import 'package:scholarship_app/screens/main_app/homescreens.dart';
import 'package:scholarship_app/screens/main_app/notification_screen.dart';
import 'package:scholarship_app/screens/main_app/profile_screen.dart';
import 'package:scholarship_app/screens/scholarship/saved_scholarship_screen.dart';
import 'package:scholarship_app/screens/scholarship/scholarship_detail_screen.dart';

void main() {
  runApp(const ScholarshipApp());
}

class ScholarshipApp extends StatelessWidget {
  const ScholarshipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scholarship Application',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.kantumruyProTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'GB'), // British uses dd/mm/yyyy
        Locale('en', 'US'), // American uses mm/dd/yyyy
      ],
      locale: const Locale('en', 'GB'),
      // Disable device text size and bold text
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            boldText: false,
            textScaler: TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      routes: {
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        AppRoutes.onboardingScreen: (context) => const OnboardingScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
        AppRoutes.registerScreen: (context) => const RegisterScreen(),
        AppRoutes.verifyEmailScreen: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as String?;
          return VerifyEmailScreen(emailOrPhone: args ?? '');
        },
        AppRoutes.forgetPasswordScreen: (context) =>
            const ForgetPasswordScreen(),
        AppRoutes.homeScreen: (context) => const HomeScreen(),
        AppRoutes.discoverScreen: (context) => const DiscoverScreen(),
        AppRoutes.profileScreen: (context) =>
            const ProfileScreen(), // Assuming ProfileScreen exists in profile_screen.dart
        AppRoutes.notificationScreen: (context) => const NotificationsScreen(),
        AppRoutes.savedScholarshipScreen: (context) =>
            const SavedScholarshipScreen(),
        AppRoutes.scholarshipDetailScreen: (context) =>
            const ScholarshipDetailScreen(),
        AppRoutes.personalInfoScreen: (context) => const PersonalInfoScreen(),
      },
      // home: PersonalInfoScreen(), // Removed home as initialRoute is used
    );
  }
}
