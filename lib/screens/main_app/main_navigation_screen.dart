import 'package:flutter/material.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
import 'package:scholarship_app/screens/main_app/chat_ai_screen.dart';
import 'package:scholarship_app/screens/main_app/discover_screen.dart';
import 'package:scholarship_app/screens/main_app/homescreens.dart';
import 'package:scholarship_app/screens/main_app/profile_screen.dart';
import 'package:scholarship_app/screens/scholarship/saved_scholarship_screen.dart';
import 'package:scholarship_app/widgets/bottom_nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    DiscoverScreen(),
    ChatAIScreen(),
    SavedScholarshipScreen(),
    ProfileScreen(embedded: true),
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: ModernBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          NavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
            label: t.translate('navHome'),
          ),
          NavItem(
            icon: Icons.explore_outlined,
            activeIcon: Icons.explore_rounded,
            label: t.translate('navDiscover'),
          ),
          NavItem(
            icon: Icons.auto_awesome_outlined,
            activeIcon: Icons.auto_awesome,
            label: t.translate('navChatAI'),
          ),
          NavItem(
            icon: Icons.bookmark_border_rounded,
            activeIcon: Icons.bookmark_rounded,
            label: t.translate('navSaved'),
          ),
          NavItem(
            icon: Icons.person_outline_rounded,
            activeIcon: Icons.person_rounded,
            label: t.translate('navProfile'),
          ),
        ],
        centerIndex: 2,
      ),
      // Make body extend behind the nav bar for frosted glass effect
      extendBody: true,
    );
  }
}
