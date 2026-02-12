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
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          OnboardingPage(
            image: 'assets/images/onboarding/onboarding1.png',
            title: 'Welcome to Scholarship',
            description:
                '"Discover new learning opportunities and connect with fellow scholarship to enhance your educational journey!"',
            currentPage: _currentPage,
            pageIndex: 0,
          ),
          OnboardingPage(
            image: 'assets/images/onboarding/onboarding2.png',
            title: 'Discovered',
            description:
                '"Unlock the full potential of your learning with personalized recommendations, progress tracking, and a vibrant community!"',
            currentPage: _currentPage,
            pageIndex: 1,
          ),
          OnboardingPage(
            image: 'assets/images/onboarding/onboarding3.png',
            title: 'Join us now',
            description:
                '"Join us today and start your learning journey. Our easy to use platform is designed to help you succeed!"',
            currentPage: _currentPage,
            pageIndex: 2,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final bool isLast;
  final int currentPage;
  final int pageIndex;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.currentPage,
    required this.pageIndex,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6, right: 6), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 308, width: 266),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff757575),
            ),
            textAlign: TextAlign.center,
          ),
          // Spacer(),
          SizedBox(height: 60),
      
          /// Dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.blue.withOpacity(
                    index == currentPage ? 1 : 0.3,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
      
          SizedBox(height: 60),
          // Spacer(),
      
          /// Button only on last page
          if (isLast)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2196F3),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}
