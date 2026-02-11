import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scholarship_app/screens/admin/admin_dashboard_screen.dart';

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
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
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
              boldText: false, textScaler: TextScaler.linear(1.0),
              // textScaler: 1.0,
            ),
            child: child!,
          );
        },
        home: AdminDashboardScreen());
  }
}
