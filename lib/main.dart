import 'package:firebase_core/firebase_core.dart';
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
import 'package:scholarship_app/screens/main_app/discover_screen.dart';
import 'package:scholarship_app/screens/main_app/homescreens.dart';
import 'package:scholarship_app/screens/main_app/notification_screen.dart';
import 'package:scholarship_app/screens/main_app/profile_screen.dart';
import 'package:scholarship_app/screens/scholarship/saved_scholarship_screen.dart';
import 'package:scholarship_app/screens/scholarship/scholarship_detail_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          AppRoutes.discoverScreen: (context) => DiscoverScreen(),
          AppRoutes.splashScreen: (context) => SplashScreen(),
          AppRoutes.onboardingScreen: (context) => OnboardingScreen(),
          AppRoutes.registerScreen: (context) => RegisterScreen(),
          AppRoutes.loginScreen: (context) => LoginScreen(),
          AppRoutes.verifyEmailScreen: (context) {
            final args = ModalRoute.of(context)?.settings.arguments as String?;
            return VerifyEmailScreen(emailOrPhone: args ?? 'your email');
          },
          AppRoutes.forgetPasswordScreen: (context) => ForgetPasswordScreen(),
          AppRoutes.scholarshipDetailScreen: (context) =>
              ScholarshipDetailScreen(),
          AppRoutes.savedScholarshipScreen: (context) =>
              SavedScholarshipScreen(),
          AppRoutes.homeScreen: (context) => HomeScreen(),
          AppRoutes.profileScreen: (context) => ProfileScreen(),
          AppRoutes.notificationScreen: (context) => NotificationsScreen(),
        });
  }
}
