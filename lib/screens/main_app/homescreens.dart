// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_app/routes/app_routes.dart';

class Homescreens extends StatelessWidget {
  const Homescreens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scholarship App',
      theme: ThemeData(
        // កំណត់ Font ទាំងមូលទៅជា Kantumruy Pro ឬ Font ខ្មែរផ្សេងទៀត
        textTheme: GoogleFonts.kantumruyProTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF0F1C36), // ពណ៌ផ្ទៃខាងក្រោយ (Dark Navy)
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              // 1. Header (Title & Bell)
              const _HeaderSection(),
              const SizedBox(height: 20),

              // 2. Profile Section
              const _ProfileSection(),
              const SizedBox(height: 20),

              // 3. Search Bar
              const _SearchBarSection(),
              const SizedBox(height: 20),

              // 4. Scrollable Content (Banner, Grid, News)
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Banner Slider
                      const _BannerSection(),
                      const SizedBox(height: 20),

                      // Grid Menu Buttons
                      const _MenuGridSection(),
                      const SizedBox(height: 20),

                      // Bottom Info Card
                      const _BottomInfoCard(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0F1C36),
        border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF0F1C36),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

// ================== Sub-Widgets ==================

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              "Scholarship",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            // Logo Icon (Graduation Cap)
            Icon(Icons.school, size: 32, color: Colors.blue.shade400),
          ],
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.notificationScreen),
          icon: const Icon(Icons.notifications_outlined, size: 28),
        ),
      ],
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
      child: Row(
        children: [
          // Profile Image
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
              image: const DecorationImage(
                image: NetworkImage("https://i.pravatar.cc/150?img=11"), // Mock Image
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Name Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "សួស្តី, Khunrithy",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "ព័ត៌មានផ្ទាល់ខ្លួន >",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _SearchBarSection extends StatelessWidget {
  const _SearchBarSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9), // Light Grey background
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                hintText: "Search scholarships",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Filter Button
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}

class _BannerSection extends StatelessWidget {
  const _BannerSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9), // Placeholder color
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(height: 10),
        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDot(isActive: true),
            _buildDot(isActive: false),
            _buildDot(isActive: false),
          ],
        )
      ],
    );
  }

  Widget _buildDot({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF335C81) : Colors.grey.shade600,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _MenuGridSection extends StatelessWidget {
  const _MenuGridSection();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      childAspectRatio: 1.4, // Adjust width/height ratio
      children: [
        _MenuButton(
          icon: Icons.lightbulb_outline,
          label: "Discover",
          onTap: () => Navigator.pushNamed(context, AppRoutes.discoverScreen),
        ),
        const _MenuButton(
          icon: Icons.stars_outlined, // Or VerifiedUserOutlined
          label: "Match",
        ),
        _MenuButton(
          icon: Icons.folder_open,
          label: "Save",
          onTap: () => Navigator.pushNamed(context, AppRoutes.savedScholarshipScreen),
        ),
        const _MenuButton(
          icon: Icons.edit_outlined,
          label: "Fill personal Info",
        ),
      ],
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _MenuButton({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF335C81), // Blue-Greyish color from design
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomInfoCard extends StatelessWidget {
  const _BottomInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0), // Placeholder Grey
        borderRadius: BorderRadius.circular(8), // Less rounded than buttons
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mock lines representing text
          Container(height: 2, width: 200, color: Colors.grey.shade600),
          const SizedBox(height: 20),
          Container(height: 2, width: double.infinity, color: Colors.grey.shade600),
          const SizedBox(height: 20),
          Container(height: 2, width: double.infinity, color: Colors.grey.shade600),
        ],
      ),
    );
  }
}
