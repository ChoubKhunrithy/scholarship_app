
import 'package:flutter/material.dart';
import 'package:scholarship_app/routes/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // PageView Content (ផ្នែកខាងលើ)
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: const [
                  OnboardingContent(
                    image: 'assets/images/onboarding/onboarding1.png',
                    title: 'Welcome to Scholarship',
                    description:
                        'Discover new learning opportunities and connect with fellow scholarship holders to enhance your educational journey!',
                  ),
                  OnboardingContent(
                    image: 'assets/images/onboarding/onboarding2.png',
                    title: 'Discovered',
                    description:
                        'Unlock the full potential of your learning with personalized recommendations, progress tracking, and a vibrant community!',
                  ),
                  OnboardingContent(
                    image: 'assets/images/onboarding/onboarding3.png',
                    title: 'Join us now',
                    description:
                        'Join us today and start your learning journey. Our easy to use platform is designed to help you succeed!',
                  ),
                ],
              ),
            ),

            // Bottom Section (Indicators + Button)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFF2196F3)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Next / Get Started Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_currentPage == 2) {
                            // ទំព័រចុងក្រោយ: ទៅ Login
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.loginScreen,
                            );
                          } else {
                            // ទំព័របន្ទាប់
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2196F3),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _currentPage == 2 ? 'Get Started' : 'Next',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            Image.asset(image, height: 280, fit: BoxFit.contain),

            const SizedBox(height: 32),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xff212121),
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xff757575),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
