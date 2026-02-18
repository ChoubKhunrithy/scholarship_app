import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
import 'package:scholarship_app/routes/app_routes.dart';
import 'package:scholarship_app/screens/authentication/forget_password_screen.dart';
import 'package:scholarship_app/screens/authentication/login_screen.dart';
import 'package:scholarship_app/screens/authentication/onboarding_screen.dart';
import 'package:scholarship_app/screens/authentication/register_screen.dart';
import 'package:scholarship_app/screens/authentication/splash_screen.dart';
import 'package:scholarship_app/screens/authentication/verify_email_screen.dart';
import 'package:scholarship_app/screens/main_app/discover_screen.dart';
import 'package:scholarship_app/screens/main_app/editProfile.dart';
import 'package:scholarship_app/screens/main_app/filter_result_screen.dart';
import 'package:scholarship_app/screens/main_app/main_navigation_screen.dart';
import 'package:scholarship_app/screens/main_app/notification_screen.dart';
import 'package:scholarship_app/screens/main_app/profile_screen.dart';
import 'package:scholarship_app/screens/main_app/search_filter_screen.dart';
import 'package:scholarship_app/screens/main_app/settings_screen.dart';
import 'package:scholarship_app/screens/scholarship/saved_scholarship_screen.dart';
import 'package:scholarship_app/screens/scholarship/scholarship_detail_screen.dart';
import 'package:scholarship_app/services/language_service.dart';
import 'package:scholarship_app/services/theme_service.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LanguageService().loadSavedLanguage();
  runApp(const ScholarshipApp());
}

class ScholarshipApp extends StatefulWidget {
  const ScholarshipApp({super.key});

  @override
  State<ScholarshipApp> createState() => _ScholarshipAppState();
}

class _ScholarshipAppState extends State<ScholarshipApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.themeNotifier,
      builder: (context, isDarkMode, child) {
        return ValueListenableBuilder<Locale>(
          valueListenable: LanguageService.localeNotifier,
          builder: (context, locale, child) {
            return MaterialApp(
              title: 'Scholarship Application',
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.splashScreen, // Initial route
              theme: ThemeService.lightTheme,
              darkTheme: ThemeService.darkTheme,
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('km'),
              ],
              locale: locale,
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
                  final args =
                      ModalRoute.of(context)?.settings.arguments as String?;
                  return VerifyEmailScreen(emailOrPhone: args ?? 'your email');
                },
                AppRoutes.forgetPasswordScreen: (context) =>
                    ForgetPasswordScreen(),
                AppRoutes.scholarshipDetailScreen: (context) =>
                    ScholarshipDetailScreen(),
                AppRoutes.savedScholarshipScreen: (context) =>
                    SavedScholarshipScreen(),
                AppRoutes.homeScreen: (context) => MainNavigationScreen(),
                AppRoutes.profileScreen: (context) => ProfileScreen(),
                AppRoutes.notificationScreen: (context) =>
                    NotificationsScreen(),
                AppRoutes.searchFilterScreen: (context) => SearchFilterScreen(),
                AppRoutes.filterResultScreen: (context) => FilterResultScreen(),
                AppRoutes.settingsScreen: (context) => SettingsScreen(),
                AppRoutes.settingScreen: (context) => SettingsScreen(),
                AppRoutes.editProfileScreen: (context) => EditProfileScreen(),
              },
            );
          },
        );
      },
    );
  }
}
