import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scholarship_app/routes/app_routes.dart';

// class Homescreens extends StatelessWidget {
//   const Homescreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Scholarship App',
//       theme: ThemeData(
//         // កំណត់ Font ទាំងមូលទៅជា Kantumruy Pro ឬ Font ខ្មែរផ្សេងទៀត
//         textTheme: GoogleFonts.kantumruyProTextTheme(
//           Theme.of(context).textTheme.apply(
//             bodyColor: Colors.white,
//             displayColor: Colors.white,
//           ),
//         ),
//         scaffoldBackgroundColor: const Color(0xFF0F1C36), // ពណ៌ផ្ទៃខាងក្រោយ (Dark Navy)
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//           child: Column(
//             children: [
//               // 1. Header (Title & Bell)
//               const _HeaderSection(),
//               const SizedBox(height: 20),

//               // 2. Profile Section
//               const _ProfileSection(),
//               const SizedBox(height: 20),

//               // 3. Search Bar
//               const _SearchBarSection(),
//               const SizedBox(height: 20),

//               // 4. Scrollable Content (Banner, Grid, News)
//               Expanded(
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     children: [
//                       // Banner Slider
//                       const _BannerSection(),
//                       const SizedBox(height: 20),

//                       // Grid Menu Buttons
//                       const _MenuGridSection(),
//                       const SizedBox(height: 20),

//                       // Bottom Info Card
//                       const _BottomInfoCard(),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Color(0xFF0F1C36),
//         border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
//       ),
//       child: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) => setState(() => _selectedIndex = index),
//         backgroundColor: const Color(0xFF0F1C36),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white60,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_filled),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat_bubble_outline),
//             label: 'chat',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'Menu',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ================== Sub-Widgets ==================

// class _HeaderSection extends StatelessWidget {
//   const _HeaderSection();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             const Text(
//               "Scholarship",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 8),
//             // Logo Icon (Graduation Cap)
//             Icon(Icons.school, size: 32, color: Colors.blue.shade400),
//           ],
//         ),
//         IconButton(
//           onPressed: () => Navigator.pushNamed(context, AppRoutes.notificationScreen),
//           icon: const Icon(Icons.notifications_outlined, size: 28),
//         ),
//       ],
//     );
//   }
// }

// class _ProfileSection extends StatelessWidget {
//   const _ProfileSection();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
//       child: Row(
//         children: [
//           // Profile Image
//           Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white, width: 1.5),
//               image: const DecorationImage(
//                 image: NetworkImage("https://i.pravatar.cc/150?img=11"), // Mock Image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           // Name Text
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "សួស្តី, Khunrithy",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 "ព័ត៌មានផ្ទាល់ខ្លួន >",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey.shade400,
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class _SearchBarSection extends StatelessWidget {
//   const _SearchBarSection();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 50,
//             decoration: BoxDecoration(
//               color: const Color(0xFFD9D9D9), // Light Grey background
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const TextField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search, color: Colors.black54),
//                 hintText: "Search scholarships",
//                 hintStyle: TextStyle(color: Colors.black54),
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.symmetric(vertical: 15),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         // Filter Button
//         Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             color: const Color(0xFFD9D9D9),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.tune, color: Colors.black87),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _BannerSection extends StatelessWidget {
//   const _BannerSection();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 140,
//           decoration: BoxDecoration(
//             color: const Color(0xFFD9D9D9), // Placeholder color
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//         const SizedBox(height: 10),
//         // Dots Indicator
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildDot(isActive: true),
//             _buildDot(isActive: false),
//             _buildDot(isActive: false),
//           ],
//         )
//       ],
//     );
//   }

//   Widget _buildDot({required bool isActive}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       width: 10,
//       height: 10,
//       decoration: BoxDecoration(
//         color: isActive ? const Color(0xFF335C81) : Colors.grey.shade600,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }

// class _MenuGridSection extends StatelessWidget {
//   const _MenuGridSection();

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       crossAxisSpacing: 15,
//       mainAxisSpacing: 15,
//       childAspectRatio: 1.4, // Adjust width/height ratio
//       children: [
//         _MenuButton(
//           icon: Icons.lightbulb_outline,
//           label: "Discover",
//           onTap: () => Navigator.pushNamed(context, AppRoutes.discoverScreen),
//         ),
//         const _MenuButton(
//           icon: Icons.stars_outlined, // Or VerifiedUserOutlined
//           label: "Match",
//         ),
//         _MenuButton(
//           icon: Icons.folder_open,
//           label: "Save",
//           onTap: () => Navigator.pushNamed(context, AppRoutes.savedScholarshipScreen),
//         ),
//         const _MenuButton(
//           icon: Icons.edit_outlined,
//           label: "Fill personal Info",
//         ),
//       ],
//     );
//   }
// }

// class _MenuButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback? onTap;

//   const _MenuButton({required this.icon, required this.label, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xFF335C81), // Blue-Greyish color from design
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 4,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: Colors.white),
//             const SizedBox(height: 8),
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _BottomInfoCard extends StatelessWidget {
//   const _BottomInfoCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 180,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE0E0E0), // Placeholder Grey
//         borderRadius: BorderRadius.circular(8), // Less rounded than buttons
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Mock lines representing text
//           Container(height: 2, width: 200, color: Colors.grey.shade600),
//           const SizedBox(height: 20),
//           Container(height: 2, width: double.infinity, color: Colors.grey.shade600),
//           const SizedBox(height: 20),
//           Container(height: 2, width: double.infinity, color: Colors.grey.shade600),
//         ],
//       ),
//     );
//   }
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scholarship_app/routes/app_routes.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Homescreens extends StatelessWidget {
//   const Homescreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Scholarship App',
//       theme: ThemeData(
//         textTheme: GoogleFonts.kantumruyProTextTheme(
//           Theme.of(context).textTheme.apply(
//                 bodyColor: Colors.white,
//                 displayColor: Colors.white,
//               ),
//         ),
//         scaffoldBackgroundColor: const Color(0xFF0F1C36),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//           child: Column(
//             children: [
//               // 1. Header
//               const _HeaderSection(),
//               const SizedBox(height: 20),

//               // 2. Profile Section
//               const _ProfileSection(),
//               const SizedBox(height: 20),

//               // 3. Search Bar
//               const _SearchBarSection(),
//               const SizedBox(height: 20),

//               // 4. Scrollable Content
//               const Expanded(
//                 child: SingleChildScrollView(
//                   physics: BouncingScrollPhysics(),
//                   child: Column(
//                     children: [
//                       // Banner Slider (Carousel)
//                       _BannerSection(),
//                       SizedBox(height: 20),

//                       // Grid Menu Buttons
//                       _MenuGridSection(),
//                       SizedBox(height: 20),

//                       // Bottom Info Card
//                       _BottomInfoCard(),
//                       SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Color(0xFF0F1C36),
//         border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
//       ),
//       child: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) => setState(() => _selectedIndex = index),
//         backgroundColor: const Color(0xFF0F1C36),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white60,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_filled),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat_bubble_outline),
//             label: 'Chat',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'Menu',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Header ────────────────────────────────────────────────────────────────────

// class _HeaderSection extends StatelessWidget {
//   const _HeaderSection();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             const Text(
//               "Scholarship",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 8),
//             Icon(Icons.school, size: 32, color: Colors.blue.shade400),
//           ],
//         ),
//         IconButton(
//           onPressed: () =>
//               Navigator.pushNamed(context, AppRoutes.notificationScreen),
//           icon: const Icon(Icons.notifications_outlined, size: 28),
//         ),
//       ],
//     );
//   }
// }

// // ── Profile ───────────────────────────────────────────────────────────────────

// class _ProfileSection extends StatelessWidget {
//   const _ProfileSection();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
//       child: Row(
//         children: [
//           Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white, width: 1.5),
//               image: const DecorationImage(
//                 image: NetworkImage("https://i.pravatar.cc/150?img=11"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "សួស្តី, Khunrithy",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 "ព័ត៌មានផ្ទាល់ខ្លួន >",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey.shade400,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Search Bar ────────────────────────────────────────────────────────────────

// class _SearchBarSection extends StatelessWidget {
//   const _SearchBarSection();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 50,
//             decoration: BoxDecoration(
//               color: const Color(0xFFD9D9D9),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const TextField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search, color: Colors.black54),
//                 hintText: "Search scholarships",
//                 hintStyle: TextStyle(color: Colors.black54),
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.symmetric(vertical: 15),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             color: const Color(0xFFD9D9D9),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.tune, color: Colors.black87),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ── Banner Slider (Carousel) ───────────────────────────────────────────────────

// class _BannerSection extends StatefulWidget {
//   const _BannerSection();

//   @override
//   State<_BannerSection> createState() => _BannerSectionState();
// }

// class _BannerSectionState extends State<_BannerSection> {
//   final List<Map<String, String>> _slides = [
//     {
//       //'https://images.unsplash.com/photo-xxx?ixlib=rb-4.0.3&auto=format&fit=crop&w=900&q=80'
//       // 'image': 'https://d39l2hkdp2esp1.cloudfront.net/img/photo/131086/131086_00_2x.jpg?20170904115552',
//       'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRU0QzCrFe54Ne8qUBrLcJDwvW4PpMTvKPQQ&s',
//       'label': '🎓 Apply for Scholarships',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=900&q=90',
//       'label': '🏆 Achieve Your Dreams',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=900&q=90',
//       'label': '📚 Start Learning Today',
//     },
//   ];

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // ── Carousel ─────────────────────────────────────────────────────────
//         Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: 160,
//                 viewportFraction: 1.0,
//                 autoPlay: true,
//                 autoPlayInterval: const Duration(seconds: 3),
//                 autoPlayCurve: Curves.easeInOut,
//                 autoPlayAnimationDuration: const Duration(milliseconds: 500),
//                 onPageChanged: (index, reason) {
//                   setState(() => _currentIndex = index);
//                 },
//               ),
//               items: _slides.map((slide) {
//                 return Builder(
//                   builder: (context) {
//                     return Container(
//                       width: double.infinity,
//                       margin: const EdgeInsets.symmetric(horizontal: 4),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF335C81),
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       clipBehavior: Clip.hardEdge,
//                       child: Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           // Background image
//                           Image.network(
//                             slide['image']!,
//                             fit: BoxFit.cover,
//                             loadingBuilder: (context, child, progress) {
//                               if (progress == null) return child;
//                               return const Center(
//                                 child: CircularProgressIndicator(
//                                   color: Colors.white54,
//                                   strokeWidth: 2,
//                                 ),
//                               );
//                             },
//                             errorBuilder: (_, __, ___) => const Center(
//                               child: Icon(Icons.image_not_supported,
//                                   color: Colors.white54, size: 40),
//                             ),
//                           ),
//                           // Dark gradient overlay
//                           Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Colors.transparent,
//                                   Colors.black.withOpacity(0.65),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // Label text
//                           Positioned(
//                             bottom: 28,
//                             left: 16,
//                             right: 16,
//                             child: Text(
//                               slide['label']!,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700,
//                                 shadows: [
//                                   Shadow(
//                                     color: Colors.black45,
//                                     blurRadius: 6,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),

//             // ── Dots Indicator ────────────────────────────────────────────────
//             Positioned(
//               bottom: 10,
//               child: AnimatedSmoothIndicator(
//                 activeIndex: _currentIndex,
//                 count: _slides.length,
//                 effect: const ExpandingDotsEffect(
//                   dotWidth: 8,
//                   dotHeight: 8,
//                   expansionFactor: 2.5,
//                   spacing: 5,
//                   dotColor: Colors.white38,
//                   activeDotColor: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// // ── Menu Grid ─────────────────────────────────────────────────────────────────

// class _MenuGridSection extends StatelessWidget {
//   const _MenuGridSection();

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       crossAxisSpacing: 15,
//       mainAxisSpacing: 15,
//       childAspectRatio: 1.4,
//       children: [
//         _MenuButton(
//           icon: Icons.lightbulb_outline,
//           label: "Discover",
//           onTap: () => Navigator.pushNamed(context, AppRoutes.discoverScreen),
//         ),
//         const _MenuButton(
//           icon: Icons.stars_outlined,
//           label: "Match",
//         ),
//         _MenuButton(
//           icon: Icons.folder_open,
//           label: "Save",
//           onTap: () =>
//               Navigator.pushNamed(context, AppRoutes.savedScholarshipScreen),
//         ),
//         const _MenuButton(
//           icon: Icons.edit_outlined,
//           label: "Fill personal Info",
//         ),
//       ],
//     );
//   }
// }

// class _MenuButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback? onTap;

//   const _MenuButton({required this.icon, required this.label, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xFF335C81),
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 4,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: Colors.white),
//             const SizedBox(height: 8),
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ── Bottom Info Card ──────────────────────────────────────────────────────────

// class _BottomInfoCard extends StatelessWidget {
//   const _BottomInfoCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 180,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE0E0E0),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(height: 2, width: 200, color: Colors.grey.shade600),
//           const SizedBox(height: 20),
//           Container(
//               height: 2, width: double.infinity, color: Colors.grey.shade600),
//           const SizedBox(height: 20),
//           Container(
//               height: 2, width: double.infinity, color: Colors.grey.shade600),
//         ],
//       ),
//     );
//   }
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scholarship_app/routes/app_routes.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Homescreens extends StatelessWidget {
//   const Homescreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Scholarship App',
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         scaffoldBackgroundColor: const Color(0xFFF8FAFB),
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAFB),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ── Header ────────────────────────────────────────────────────
//             _buildHeader(),

//             // ── Body ──────────────────────────────────────────────────────
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 16),

//                     // Profile Card
//                     _buildProfileCard(),

//                     const SizedBox(height: 20),

//                     // Search Bar
//                     _buildSearchBar(),

//                     const SizedBox(height: 24),

//                     // Banner Slider
//                     const _BannerSection(),

//                     const SizedBox(height: 24),

//                     // Quick Actions
//                     _buildQuickActions(),

//                     const SizedBox(height: 24),

//                     // Latest Scholarships Header
//                     _buildSectionHeader(),

//                     const SizedBox(height: 16),

//                     // Scholarship Cards
//                     _buildScholarshipCards(),

//                     const SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   // ── Header ────────────────────────────────────────────────────────────────
//   Widget _buildHeader() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xff2196F3), Color(0xff1976D2)],
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(Icons.school_rounded,
//                     size: 24, color: Colors.white),
//               ),
//               const SizedBox(width: 12),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Scholarship',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xff212121),
//                       letterSpacing: -0.5,
//                     ),
//                   ),
//                   Text(
//                     'Find Your Future',
//                     style: TextStyle(
//                       fontSize: 11,
//                       color: Color(0xff9E9E9E),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 onPressed: () =>
//                     Navigator.pushNamed(context, AppRoutes.notificationScreen),
//                 icon: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF5F5F5),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(
//                     Icons.notifications_outlined,
//                     color: Color(0xff424242),
//                     size: 22,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                     color: Color(0xffF44336),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Profile Card ──────────────────────────────────────────────────────────
//   Widget _buildProfileCard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: GestureDetector(
//         onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xff2196F3), Color(0xff1976D2)],
//             ),
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xff2196F3).withOpacity(0.3),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 56,
//                 height: 56,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.white, width: 3),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.15),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                   image: const DecorationImage(
//                     image: NetworkImage("https://i.pravatar.cc/150?img=11"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'សួស្តី, Khunrithy 👋',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                         letterSpacing: -0.3,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.25),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: const Text(
//                             'Student',
//                             style: TextStyle(
//                               fontSize: 11,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         Text(
//                           'View Profile',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.white.withOpacity(0.9),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.white,
//                           size: 11,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ── Search Bar ────────────────────────────────────────────────────────────
//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               child: Container(
//                 height: 52,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(color: const Color(0xffE2E8F0)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.03),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: const Row(
//                   children: [
//                     Icon(Icons.search, color: Color(0xff9E9E9E), size: 22),
//                     SizedBox(width: 12),
//                     Text(
//                       'Search scholarships...',
//                       style: TextStyle(
//                         color: Color(0xffBDBDBD),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Container(
//             width: 52,
//             height: 52,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [Color(0xff2196F3), Color(0xff1976D2)],
//               ),
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color(0xff2196F3).withOpacity(0.3),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: IconButton(
//               onPressed: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               icon: const Icon(
//                 Icons.tune_rounded,
//                 color: Colors.white,
//                 size: 22,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Quick Actions ─────────────────────────────────────────────────────────
//   Widget _buildQuickActions() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Quick Actions',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: Color(0xff212121),
//               letterSpacing: -0.3,
//             ),
//           ),
//           const SizedBox(height: 14),
//           GridView.count(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisCount: 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 1.5,
//             children: [
//               _ActionCard(
//                 icon: Icons.explore_outlined,
//                 label: 'Discover',
//                 color: const Color(0xff2196F3),
//                 onTap: () =>
//                     Navigator.pushNamed(context, AppRoutes.discoverScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.military_tech_outlined,
//                 label: 'Match',
//                 color: const Color(0xffFF9800),
//                 onTap: () {},
//               ),
//               _ActionCard(
//                 icon: Icons.bookmark_outline,
//                 label: 'Saved',
//                 color: const Color(0xff4CAF50),
//                 onTap: () => Navigator.pushNamed(
//                     context, AppRoutes.savedScholarshipScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.edit_document,
//                 label: 'Fill Info',
//                 color: const Color(0xff9C27B0),
//                 onTap: () {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Section Header ────────────────────────────────────────────────────────
//   Widget _buildSectionHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             'Latest Scholarships',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: Color(0xff212121),
//               letterSpacing: -0.3,
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             style: TextButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             ),
//             child: Row(
//               children: const [
//                 Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Color(0xff2196F3),
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(width: 4),
//                 Icon(Icons.arrow_forward_ios,
//                     size: 12, color: Color(0xff2196F3)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Scholarship Cards ─────────────────────────────────────────────────────
//   Widget _buildScholarshipCards() {
//     return Column(
//       children: [
//         _ScholarshipCard(
//           title: 'Full Scholarship to MIT',
//           university: 'MIT',
//           location: 'United States',
//           type: 'Full Scholarship',
//           deadline: 'Mar 30, 2026',
//           imageUrl: 'assets/images/mit.png', // Placeholder
//         ),
//         const SizedBox(height: 12),
//         _ScholarshipCard(
//           title: 'Engineering Excellence Award',
//           university: 'Stanford',
//           location: 'USA',
//           type: 'Partial',
//           deadline: 'Apr 15, 2026',
//           imageUrl: 'assets/images/stanford.png',
//         ),
//       ],
//     );
//   }

//   // ── Bottom Navigation ─────────────────────────────────────────────────────
//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 12,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: (index) => setState(() => _selectedIndex = index),
//           backgroundColor: Colors.white,
//           selectedItemColor: const Color(0xff2196F3),
//           unselectedItemColor: const Color(0xff9E9E9E),
//           selectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 12,
//           ),
//           unselectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 11,
//           ),
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           elevation: 0,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined, size: 26),
//               activeIcon: Icon(Icons.home_rounded, size: 26),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.chat_bubble_outline, size: 24),
//               activeIcon: Icon(Icons.chat_bubble, size: 24),
//               label: 'Chat',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.menu_rounded, size: 26),
//               label: 'Menu',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// // REUSABLE WIDGETS
// // ══════════════════════════════════════════════════════════════════════════════

// // ── Action Card ───────────────────────────────────────────────────────────────

// class _ActionCard extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onTap;

//   const _ActionCard({
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: const Color(0xffF0F0F0)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.12),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, size: 28, color: color),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xff424242),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ── Banner Section ────────────────────────────────────────────────────────────

// class _BannerSection extends StatefulWidget {
//   const _BannerSection();

//   @override
//   State<_BannerSection> createState() => _BannerSectionState();
// }

// class _BannerSectionState extends State<_BannerSection> {
//   final List<Map<String, String>> _slides = [
//     {
//       'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRU0QzCrFe54Ne8qUBrLcJDwvW4PpMTvKPQQ&s',
//       'label': '🎓 Apply for Scholarships',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=900&q=90',
//       'label': '🏆 Achieve Your Dreams',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=900&q=90',
//       'label': '📚 Start Learning Today',
//     },
//   ];

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         children: [
//           // ── Carousel ─────────────────────────────────────────────────────────
//           Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 160,
//                   viewportFraction: 1.0,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlayCurve: Curves.easeInOut,
//                   autoPlayAnimationDuration: const Duration(milliseconds: 500),
//                   onPageChanged: (index, reason) {
//                     setState(() => _currentIndex = index);
//                   },
//                 ),
//                 items: _slides.map((slide) {
//                   return Builder(
//                     builder: (context) {
//                       return Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.symmetric(horizontal: 4),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF335C81),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         clipBehavior: Clip.hardEdge,
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: [
//                             // Background image
//                             Image.network(
//                               slide['image']!,
//                               fit: BoxFit.cover,
//                               loadingBuilder: (context, child, progress) {
//                                 if (progress == null) return child;
//                                 return const Center(
//                                   child: CircularProgressIndicator(
//                                     color: Colors.white54,
//                                     strokeWidth: 2,
//                                   ),
//                                 );
//                               },
//                               errorBuilder: (_, __, ___) => const Center(
//                                 child: Icon(Icons.image_not_supported,
//                                     color: Colors.white54, size: 40),
//                               ),
//                             ),
//                             // Dark gradient overlay
//                             Container(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.transparent,
//                                     Colors.black.withOpacity(0.65),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // Label text
//                             Positioned(
//                               bottom: 28,
//                               left: 16,
//                               right: 16,
//                               child: Text(
//                                 slide['label']!,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                   shadows: [
//                                     Shadow(
//                                       color: Colors.black45,
//                                       blurRadius: 6,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),

//               // ── Dots Indicator ────────────────────────────────────────────────
//               Positioned(
//                 bottom: 10,
//                 child: AnimatedSmoothIndicator(
//                   activeIndex: _currentIndex,
//                   count: _slides.length,
//                   effect: const ExpandingDotsEffect(
//                     dotWidth: 8,
//                     dotHeight: 8,
//                     expansionFactor: 2.5,
//                     spacing: 5,
//                     dotColor: Colors.white38,
//                     activeDotColor: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Scholarship Card ──────────────────────────────────────────────────────────

// class _ScholarshipCard extends StatelessWidget {
//   final String title;
//   final String university;
//   final String location;
//   final String type;
//   final String deadline;
//   final String imageUrl;

//   const _ScholarshipCard({
//     required this.title,
//     required this.university,
//     required this.location,
//     required this.type,
//     required this.deadline,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: const Color(0xffF0F0F0)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image
//               Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: const Color(0xffF5F5F5),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Center(
//                   child: Icon(Icons.school_rounded,
//                       size: 32, color: Color(0xff2196F3)),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               // Content
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xff212121),
//                         height: 1.3,
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on_outlined,
//                             size: 13, color: Color(0xff9E9E9E)),
//                         const SizedBox(width: 4),
//                         Text(
//                           '$university, $location',
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: Color(0xff757575),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: const Color(0xffE3F2FD),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Text(
//                             type,
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xff1976D2),
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.access_time,
//                             size: 12, color: Color(0xffFF9800)),
//                         const SizedBox(width: 4),
//                         Text(
//                           deadline,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xffFF9800),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scholarship_app/routes/app_routes.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Homescreens extends StatelessWidget {
//   const Homescreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Scholarship App',
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         scaffoldBackgroundColor: const Color(0xFFF8FAFB),
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAFB),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ── Header ────────────────────────────────────────────────────
//             _buildHeader(),

//             // ── Body ──────────────────────────────────────────────────────
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 16),

//                     // Profile Card
//                     _buildProfileCard(),

//                     const SizedBox(height: 20),

//                     // Search Bar
//                     _buildSearchBar(),

//                     const SizedBox(height: 24),

//                     // Banner Slider
//                     const _BannerSection(),

//                     const SizedBox(height: 24),

//                     // Quick Actions
//                     _buildQuickActions(),

//                     const SizedBox(height: 24),

//                     // Latest Scholarships Header
//                     _buildSectionHeader(),

//                     const SizedBox(height: 16),

//                     // Scholarship Cards
//                     _buildScholarshipCards(),

//                     const SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   // ── Header ────────────────────────────────────────────────────────────────
//   Widget _buildHeader() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xff2196F3), Color(0xff1976D2)],
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(Icons.school_rounded,
//                     size: 24, color: Colors.white),
//               ),
//               const SizedBox(width: 12),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Scholarship',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xff212121),
//                       letterSpacing: -0.5,
//                     ),
//                   ),
//                   Text(
//                     'Find Your Future',
//                     style: TextStyle(
//                       fontSize: 11,
//                       color: Color(0xff9E9E9E),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 onPressed: () =>
//                     Navigator.pushNamed(context, AppRoutes.notificationScreen),
//                 icon: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF5F5F5),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(
//                     Icons.notifications_outlined,
//                     color: Color(0xff424242),
//                     size: 22,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                     color: Color(0xffF44336),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Profile Card ──────────────────────────────────────────────────────────
//   Widget _buildProfileCard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: GestureDetector(
//         onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xff2196F3), Color(0xff1976D2)],
//             ),
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xff2196F3).withOpacity(0.3),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 56,
//                 height: 56,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.white, width: 3),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.15),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                   image: const DecorationImage(
//                     image: NetworkImage("https://i.pravatar.cc/150?img=11"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'សួស្តី, Khunrithy 👋',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                         letterSpacing: -0.3,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.25),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: const Text(
//                             'Student',
//                             style: TextStyle(
//                               fontSize: 11,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         Text(
//                           'View Profile',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.white.withOpacity(0.9),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.white,
//                           size: 11,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ── Search Bar ────────────────────────────────────────────────────────────
//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               child: Container(
//                 height: 52,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(color: const Color(0xffE2E8F0)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.03),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: const Row(
//                   children: [
//                     Icon(Icons.search, color: Color(0xff9E9E9E), size: 22),
//                     SizedBox(width: 12),
//                     Text(
//                       'Search scholarships...',
//                       style: TextStyle(
//                         color: Color(0xffBDBDBD),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Container(
//             width: 52,
//             height: 52,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [Color(0xff2196F3), Color(0xff1976D2)],
//               ),
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color(0xff2196F3).withOpacity(0.3),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: IconButton(
//               onPressed: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               icon: const Icon(
//                 Icons.tune_rounded,
//                 color: Colors.white,
//                 size: 22,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Quick Actions ─────────────────────────────────────────────────────────
//   Widget _buildQuickActions() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Quick Actions',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: Color(0xff212121),
//               letterSpacing: -0.3,
//             ),
//           ),
//           const SizedBox(height: 14),
//           GridView.count(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisCount: 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 1.5,
//             children: [
//               _ActionCard(
//                 icon: Icons.explore_outlined,
//                 label: 'Discover',
//                 color: const Color(0xff2196F3),
//                 onTap: () =>
//                     Navigator.pushNamed(context, AppRoutes.discoverScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.military_tech_outlined,
//                 label: 'Match',
//                 color: const Color(0xffFF9800),
//                 onTap: () {},
//               ),
//               _ActionCard(
//                 icon: Icons.bookmark_outline,
//                 label: 'Saved',
//                 color: const Color(0xff4CAF50),
//                 onTap: () => Navigator.pushNamed(
//                     context, AppRoutes.savedScholarshipScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.edit_document,
//                 label: 'Fill Info',
//                 color: const Color(0xff9C27B0),
//                 onTap: () =>
//                     Navigator.pushNamed(context, AppRoutes.personalInfoScreen),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Section Header ────────────────────────────────────────────────────────
//   Widget _buildSectionHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             'Latest Scholarships',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: Color(0xff212121),
//               letterSpacing: -0.3,
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             style: TextButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             ),
//             child: Row(
//               children: const [
//                 Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Color(0xff2196F3),
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(width: 4),
//                 Icon(Icons.arrow_forward_ios,
//                     size: 12, color: Color(0xff2196F3)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Scholarship Cards ─────────────────────────────────────────────────────
//   Widget _buildScholarshipCards() {
//     return Column(
//       children: [
//         _ScholarshipCard(
//           title: 'Full Scholarship to MIT',
//           university: 'MIT',
//           location: 'United States',
//           type: 'Full Scholarship',
//           deadline: 'Mar 30, 2026',
//           imageUrl: 'assets/images/mit.png', // Placeholder
//         ),
//         const SizedBox(height: 12),
//         _ScholarshipCard(
//           title: 'Engineering Excellence Award',
//           university: 'Stanford',
//           location: 'USA',
//           type: 'Partial',
//           deadline: 'Apr 15, 2026',
//           imageUrl: 'assets/images/stanford.png',
//         ),
//       ],
//     );
//   }

//   // ── Bottom Navigation ─────────────────────────────────────────────────────
//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 12,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: (index) => setState(() => _selectedIndex = index),
//           backgroundColor: Colors.white,
//           selectedItemColor: const Color(0xff2196F3),
//           unselectedItemColor: const Color(0xff9E9E9E),
//           selectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 12,
//           ),
//           unselectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 11,
//           ),
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           elevation: 0,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined, size: 26),
//               activeIcon: Icon(Icons.home_rounded, size: 26),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.chat_bubble_outline, size: 24),
//               activeIcon: Icon(Icons.chat_bubble, size: 24),
//               label: 'Chat',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.menu_rounded, size: 26),
//               label: 'Menu',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// // REUSABLE WIDGETS
// // ══════════════════════════════════════════════════════════════════════════════

// // ── Action Card ───────────────────────────────────────────────────────────────

// class _ActionCard extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onTap;

//   const _ActionCard({
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: const Color(0xffF0F0F0)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.12),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, size: 28, color: color),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xff424242),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ── Banner Section ────────────────────────────────────────────────────────────

// class _BannerSection extends StatefulWidget {
//   const _BannerSection();

//   @override
//   State<_BannerSection> createState() => _BannerSectionState();
// }

// class _BannerSectionState extends State<_BannerSection> {
//   final List<Map<String, String>> _slides = [
//     {
//       'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRU0QzCrFe54Ne8qUBrLcJDwvW4PpMTvKPQQ&s',
//       'label': '🎓 Apply for Scholarships',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=900&q=90',
//       'label': '🏆 Achieve Your Dreams',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=900&q=90',
//       'label': '📚 Start Learning Today',
//     },
//   ];

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         children: [
//           // ── Carousel ─────────────────────────────────────────────────────────
//           Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 160,
//                   viewportFraction: 1.0,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlayCurve: Curves.easeInOut,
//                   autoPlayAnimationDuration: const Duration(milliseconds: 500),
//                   onPageChanged: (index, reason) {
//                     setState(() => _currentIndex = index);
//                   },
//                 ),
//                 items: _slides.map((slide) {
//                   return Builder(
//                     builder: (context) {
//                       return Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.symmetric(horizontal: 4),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF335C81),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         clipBehavior: Clip.hardEdge,
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: [
//                             // Background image
//                             Image.network(
//                               slide['image']!,
//                               fit: BoxFit.cover,
//                               loadingBuilder: (context, child, progress) {
//                                 if (progress == null) return child;
//                                 return const Center(
//                                   child: CircularProgressIndicator(
//                                     color: Colors.white54,
//                                     strokeWidth: 2,
//                                   ),
//                                 );
//                               },
//                               errorBuilder: (_, __, ___) => const Center(
//                                 child: Icon(Icons.image_not_supported,
//                                     color: Colors.white54, size: 40),
//                               ),
//                             ),
//                             // Dark gradient overlay
//                             Container(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.transparent,
//                                     Colors.black.withOpacity(0.65),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // Label text
//                             Positioned(
//                               bottom: 28,
//                               left: 16,
//                               right: 16,
//                               child: Text(
//                                 slide['label']!,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                   shadows: [
//                                     Shadow(
//                                       color: Colors.black45,
//                                       blurRadius: 6,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),

//               // ── Dots Indicator ────────────────────────────────────────────────
//               Positioned(
//                 bottom: 10,
//                 child: AnimatedSmoothIndicator(
//                   activeIndex: _currentIndex,
//                   count: _slides.length,
//                   effect: const ExpandingDotsEffect(
//                     dotWidth: 8,
//                     dotHeight: 8,
//                     expansionFactor: 2.5,
//                     spacing: 5,
//                     dotColor: Colors.white38,
//                     activeDotColor: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Scholarship Card ──────────────────────────────────────────────────────────

// class _ScholarshipCard extends StatelessWidget {
//   final String title;
//   final String university;
//   final String location;
//   final String type;
//   final String deadline;
//   final String imageUrl;

//   const _ScholarshipCard({
//     required this.title,
//     required this.university,
//     required this.location,
//     required this.type,
//     required this.deadline,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: const Color(0xffF0F0F0)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image
//               Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: const Color(0xffF5F5F5),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Center(
//                   child: Icon(Icons.school_rounded,
//                       size: 32, color: Color(0xff2196F3)),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               // Content
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xff212121),
//                         height: 1.3,
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on_outlined,
//                             size: 13, color: Color(0xff9E9E9E)),
//                         const SizedBox(width: 4),
//                         Text(
//                           '$university, $location',
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: Color(0xff757575),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: const Color(0xffE3F2FD),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Text(
//                             type,
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xff1976D2),
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.access_time,
//                             size: 12, color: Color(0xffFF9800)),
//                         const SizedBox(width: 4),
//                         Text(
//                           deadline,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xffFF9800),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scholarship_app/routes/app_routes.dart';
// import 'package:scholarship_app/screens/fill_information/personal_info_screen.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Homescreens extends StatelessWidget {
//   const Homescreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Scholarship App',
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         scaffoldBackgroundColor: const Color(0xFFF8FAFB),
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAFB),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ── Header ────────────────────────────────────────────────────
//             _buildHeader(),

//             // ── Body ──────────────────────────────────────────────────────
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 16),

//                     // Profile Card
//                     _buildProfileCard(),

//                     const SizedBox(height: 20),

//                     // Search Bar
//                     _buildSearchBar(),

//                     const SizedBox(height: 24),

//                     // Banner Slider
//                     const _BannerSection(),

//                     const SizedBox(height: 24),

//                     // Quick Actions
//                     _buildQuickActions(),

//                     const SizedBox(height: 24),

//                     // Latest Scholarships Header
//                     _buildSectionHeader(),

//                     const SizedBox(height: 16),

//                     // Scholarship Cards
//                     _buildScholarshipCards(),

//                     const SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   // ── Header ────────────────────────────────────────────────────────────────
//   Widget _buildHeader() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xff2196F3), Color(0xff1976D2)],
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(Icons.school_rounded,
//                     size: 24, color: Colors.white),
//               ),
//               const SizedBox(width: 12),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Scholarship',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xff212121),
//                       letterSpacing: -0.5,
//                     ),
//                   ),
//                   Text(
//                     'Find Your Future',
//                     style: TextStyle(
//                       fontSize: 11,
//                       color: Color(0xff9E9E9E),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 onPressed: () =>
//                     Navigator.pushNamed(context, AppRoutes.notificationScreen),
//                 icon: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF5F5F5),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(
//                     Icons.notifications_outlined,
//                     color: Color(0xff424242),
//                     size: 22,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                     color: Color(0xffF44336),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Profile Card ──────────────────────────────────────────────────────────
//   Widget _buildProfileCard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: GestureDetector(
//         onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xff2196F3), Color(0xff1976D2)],
//             ),
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xff2196F3).withOpacity(0.3),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 56,
//                 height: 56,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.white, width: 3),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.15),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                   image: const DecorationImage(
//                     image: NetworkImage("https://i.pravatar.cc/150?img=11"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'សួស្តី, Khunrithy 👋',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                         letterSpacing: -0.3,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.25),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: const Text(
//                             'Student',
//                             style: TextStyle(
//                               fontSize: 11,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         Text(
//                           'View Profile',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.white.withOpacity(0.9),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.white,
//                           size: 11,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ── Search Bar ────────────────────────────────────────────────────────────
//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               child: Container(
//                 height: 52,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(color: const Color(0xffE2E8F0)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.03),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: const Row(
//                   children: [
//                     Icon(Icons.search, color: Color(0xff9E9E9E), size: 22),
//                     SizedBox(width: 12),
//                     Text(
//                       'Search scholarships...',
//                       style: TextStyle(
//                         color: Color(0xffBDBDBD),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Container(
//             width: 52,
//             height: 52,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [Color(0xff2196F3), Color(0xff1976D2)],
//               ),
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color(0xff2196F3).withOpacity(0.3),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: IconButton(
//               onPressed: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               icon: const Icon(
//                 Icons.tune_rounded,
//                 color: Colors.white,
//                 size: 22,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Quick Actions ─────────────────────────────────────────────────────────
//   Widget _buildQuickActions() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Quick Actions',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: Color(0xff212121),
//               letterSpacing: -0.3,
//             ),
//           ),
//           const SizedBox(height: 14),
//           GridView.count(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisCount: 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 1.5,
//             children: [
//               _ActionCard(
//                 icon: Icons.explore_outlined,
//                 label: 'Discover',
//                 color: const Color(0xff2196F3),
//                 onTap: () =>
//                     Navigator.pushNamed(context, AppRoutes.discoverScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.military_tech_outlined,
//                 label: 'Match',
//                 color: const Color(0xffFF9800),
//                 onTap: () {},
//               ),
//               _ActionCard(
//                 icon: Icons.bookmark_outline,
//                 label: 'Saved',
//                 color: const Color(0xff4CAF50),
//                 onTap: () => Navigator.pushNamed(
//                     context, AppRoutes.savedScholarshipScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.edit_document,
//                 label: 'Fill Info',
//                 color: const Color(0xff9C27B0),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const PersonalInfoScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Section Header ────────────────────────────────────────────────────────
//   Widget _buildSectionHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             'Latest Scholarships',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: Color(0xff212121),
//               letterSpacing: -0.3,
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             style: TextButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             ),
//             child: Row(
//               children: const [
//                 Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Color(0xff2196F3),
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(width: 4),
//                 Icon(Icons.arrow_forward_ios,
//                     size: 12, color: Color(0xff2196F3)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Scholarship Cards ─────────────────────────────────────────────────────
//   Widget _buildScholarshipCards() {
//     return Column(
//       children: [
//         _ScholarshipCard(
//           title: 'Full Scholarship to MIT',
//           university: 'MIT',
//           location: 'United States',
//           type: 'Full Scholarship',
//           deadline: 'Mar 30, 2026',
//           imageUrl: 'assets/images/mit.png', // Placeholder
//         ),
//         const SizedBox(height: 12),
//         _ScholarshipCard(
//           title: 'Engineering Excellence Award',
//           university: 'Stanford',
//           location: 'USA',
//           type: 'Partial',
//           deadline: 'Apr 15, 2026',
//           imageUrl: 'assets/images/stanford.png',
//         ),
//       ],
//     );
//   }

//   // ── Bottom Navigation ─────────────────────────────────────────────────────
//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 12,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: (index) => setState(() => _selectedIndex = index),
//           backgroundColor: Colors.white,
//           selectedItemColor: const Color(0xff2196F3),
//           unselectedItemColor: const Color(0xff9E9E9E),
//           selectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 12,
//           ),
//           unselectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 11,
//           ),
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           elevation: 0,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined, size: 26),
//               activeIcon: Icon(Icons.home_rounded, size: 26),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.chat_bubble_outline, size: 24),
//               activeIcon: Icon(Icons.chat_bubble, size: 24),
//               label: 'Chat',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.menu_rounded, size: 26),
//               label: 'Menu',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// // REUSABLE WIDGETS
// // ══════════════════════════════════════════════════════════════════════════════

// // ── Action Card ───────────────────────────────────────────────────────────────

// class _ActionCard extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onTap;

//   const _ActionCard({
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: const Color(0xffF0F0F0)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.12),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, size: 28, color: color),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xff424242),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ── Banner Section ────────────────────────────────────────────────────────────

// class _BannerSection extends StatefulWidget {
//   const _BannerSection();

//   @override
//   State<_BannerSection> createState() => _BannerSectionState();
// }

// class _BannerSectionState extends State<_BannerSection> {
//   final List<Map<String, String>> _slides = [
//     {
//       'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRU0QzCrFe54Ne8qUBrLcJDwvW4PpMTvKPQQ&s',
//       'label': '🎓 Apply for Scholarships',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=900&q=90',
//       'label': '🏆 Achieve Your Dreams',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=900&q=90',
//       'label': '📚 Start Learning Today',
//     },
//   ];

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         children: [
//           // ── Carousel ─────────────────────────────────────────────────────────
//           Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 160,
//                   viewportFraction: 1.0,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlayCurve: Curves.easeInOut,
//                   autoPlayAnimationDuration: const Duration(milliseconds: 500),
//                   onPageChanged: (index, reason) {
//                     setState(() => _currentIndex = index);
//                   },
//                 ),
//                 items: _slides.map((slide) {
//                   return Builder(
//                     builder: (context) {
//                       return Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.symmetric(horizontal: 4),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF335C81),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         clipBehavior: Clip.hardEdge,
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: [
//                             // Background image
//                             Image.network(
//                               slide['image']!,
//                               fit: BoxFit.cover,
//                               loadingBuilder: (context, child, progress) {
//                                 if (progress == null) return child;
//                                 return const Center(
//                                   child: CircularProgressIndicator(
//                                     color: Colors.white54,
//                                     strokeWidth: 2,
//                                   ),
//                                 );
//                               },
//                               errorBuilder: (_, __, ___) => const Center(
//                                 child: Icon(Icons.image_not_supported,
//                                     color: Colors.white54, size: 40),
//                               ),
//                             ),
//                             // Dark gradient overlay
//                             Container(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.transparent,
//                                     Colors.black.withOpacity(0.65),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // Label text
//                             Positioned(
//                               bottom: 28,
//                               left: 16,
//                               right: 16,
//                               child: Text(
//                                 slide['label']!,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                   shadows: [
//                                     Shadow(
//                                       color: Colors.black45,
//                                       blurRadius: 6,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),

//               // ── Dots Indicator ────────────────────────────────────────────────
//               Positioned(
//                 bottom: 10,
//                 child: AnimatedSmoothIndicator(
//                   activeIndex: _currentIndex,
//                   count: _slides.length,
//                   effect: const ExpandingDotsEffect(
//                     dotWidth: 8,
//                     dotHeight: 8,
//                     expansionFactor: 2.5,
//                     spacing: 5,
//                     dotColor: Colors.white38,
//                     activeDotColor: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Scholarship Card ──────────────────────────────────────────────────────────

// class _ScholarshipCard extends StatelessWidget {
//   final String title;
//   final String university;
//   final String location;
//   final String type;
//   final String deadline;
//   final String imageUrl;

//   const _ScholarshipCard({
//     required this.title,
//     required this.university,
//     required this.location,
//     required this.type,
//     required this.deadline,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: const Color(0xffF0F0F0)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image
//               Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: const Color(0xffF5F5F5),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Center(
//                   child: Icon(Icons.school_rounded,
//                       size: 32, color: Color(0xff2196F3)),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               // Content
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xff212121),
//                         height: 1.3,
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on_outlined,
//                             size: 13, color: Color(0xff9E9E9E)),
//                         const SizedBox(width: 4),
//                         Text(
//                           '$university, $location',
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: Color(0xff757575),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: const Color(0xffE3F2FD),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Text(
//                             type,
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xff1976D2),
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.access_time,
//                             size: 12, color: Color(0xffFF9800)),
//                         const SizedBox(width: 4),
//                         Text(
//                           deadline,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xffFF9800),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scholarship_app/constants/app_colors.dart';
// import 'package:scholarship_app/routes/app_routes.dart';
// import 'package:scholarship_app/screens/fill_information/personal_info_screen.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Homescreens extends StatelessWidget {
//   const Homescreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Scholarship App',
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         scaffoldBackgroundColor: AppColors.lightGrey,
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.lightGrey,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ── Header ────────────────────────────────────────────────────
//             _buildHeader(),

//             // ── Body ──────────────────────────────────────────────────────
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 16),

//                     // Profile Card
//                     _buildProfileCard(),

//                     const SizedBox(height: 20),

//                     // Search Bar
//                     _buildSearchBar(),

//                     const SizedBox(height: 24),

//                     // Banner Slider
//                     const _BannerSection(),

//                     const SizedBox(height: 24),

//                     // Quick Actions
//                     _buildQuickActions(),

//                     const SizedBox(height: 24),

//                     // Latest Scholarships Header
//                     _buildSectionHeader(),

//                     const SizedBox(height: 16),

//                     // Scholarship Cards
//                     _buildScholarshipCards(),

//                     const SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   // ── Header ────────────────────────────────────────────────────────────────
//   Widget _buildHeader() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [AppColors.primary, AppColors.primaryDark],
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(Icons.school_rounded,
//                     size: 24, color: AppColors.white),
//               ),
//               const SizedBox(width: 12),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Scholarship',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.textDark,
//                       letterSpacing: -0.5,
//                     ),
//                   ),
//                   Text(
//                     'Find Your Future',
//                     style: TextStyle(
//                       fontSize: 11,
//                       color: AppColors.grey,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 onPressed: () =>
//                     Navigator.pushNamed(context, AppRoutes.notificationScreen),
//                 icon: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: AppColors.lightGrey,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(
//                     Icons.notifications_outlined,
//                     color: AppColors.textDark,
//                     size: 22,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                     color: AppColors.red,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Profile Card ──────────────────────────────────────────────────────────
//   Widget _buildProfileCard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: GestureDetector(
//         onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [AppColors.primary, AppColors.primaryDark],
//             ),
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.primary.withOpacity(0.3),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 56,
//                 height: 56,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: AppColors.white, width: 3),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.15),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                   image: const DecorationImage(
//                     image: NetworkImage("https://i.pravatar.cc/150?img=11"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'សួស្តី, Khunrithy 👋',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.white,
//                         letterSpacing: -0.3,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: AppColors.white.withOpacity(0.25),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: const Text(
//                             'Student',
//                             style: TextStyle(
//                               fontSize: 11,
//                               color: AppColors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         Text(
//                           'View Profile',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: AppColors.white.withOpacity(0.9),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const Icon(
//                           Icons.arrow_forward_ios,
//                           color: AppColors.white,
//                           size: 11,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ── Search Bar ────────────────────────────────────────────────────────────
//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               child: Container(
//                 height: 52,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(color: AppColors.divider),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.03),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: const Row(
//                   children: [
//                     Icon(Icons.search, color: AppColors.grey, size: 22),
//                     SizedBox(width: 12),
//                     Text(
//                       'Search scholarships...',
//                       style: TextStyle(
//                         color: AppColors.divider,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Container(
//             width: 52,
//             height: 52,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [AppColors.primary, AppColors.primaryDark],
//               ),
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColors.primary.withOpacity(0.3),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: IconButton(
//               onPressed: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               icon: const Icon(
//                 Icons.tune_rounded,
//                 color: AppColors.white,
//                 size: 22,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Quick Actions ─────────────────────────────────────────────────────────
//   Widget _buildQuickActions() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Quick Actions',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: AppColors.textDark,
//               letterSpacing: -0.3,
//             ),
//           ),
//           const SizedBox(height: 14),
//           GridView.count(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisCount: 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 1.5,
//             children: [
//               _ActionCard(
//                 icon: Icons.explore_outlined,
//                 label: 'Discover',
//                 color: AppColors.primary,
//                 onTap: () =>
//                     Navigator.pushNamed(context, AppRoutes.discoverScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.military_tech_outlined,
//                 label: 'Match',
//                 color: const Color(0xffFF9800),
//                 onTap: () {},
//               ),
//               _ActionCard(
//                 icon: Icons.bookmark_outline,
//                 label: 'Saved',
//                 color: AppColors.green,
//                 onTap: () => Navigator.pushNamed(
//                     context, AppRoutes.savedScholarshipScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.edit_document,
//                 label: 'Fill Info',
//                 color: const Color(0xff9C27B0),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const PersonalInfoScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Section Header ────────────────────────────────────────────────────────
//   Widget _buildSectionHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             'Latest Scholarships',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: AppColors.textDark,
//               letterSpacing: -0.3,
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             style: TextButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             ),
//             child: Row(
//               children: const [
//                 Text(
//                   'See All',
//                   style: TextStyle(
//                     color: AppColors.primary,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(width: 4),
//                 Icon(Icons.arrow_forward_ios,
//                     size: 12, color: AppColors.primary),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Scholarship Cards ─────────────────────────────────────────────────────
//   Widget _buildScholarshipCards() {
//     return Column(
//       children: [
//         _ScholarshipCard(
//           title: 'Full Scholarship to MIT',
//           university: 'MIT',
//           location: 'United States',
//           type: 'Full Scholarship',
//           deadline: 'Mar 30, 2026',
//           imageUrl: 'assets/images/mit.png', // Placeholder
//         ),
//         const SizedBox(height: 12),
//         _ScholarshipCard(
//           title: 'Engineering Excellence Award',
//           university: 'Stanford',
//           location: 'USA',
//           type: 'Partial',
//           deadline: 'Apr 15, 2026',
//           imageUrl: 'assets/images/stanford.png',
//         ),
//       ],
//     );
//   }

//   // ── Bottom Navigation ─────────────────────────────────────────────────────
//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 12,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: (index) => setState(() => _selectedIndex = index),
//           backgroundColor: AppColors.white,
//           selectedItemColor: AppColors.primary,
//           unselectedItemColor: AppColors.grey,
//           selectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 12,
//           ),
//           unselectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 11,
//           ),
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           elevation: 0,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined, size: 26),
//               activeIcon: Icon(Icons.home_rounded, size: 26),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.chat_bubble_outline, size: 24),
//               activeIcon: Icon(Icons.chat_bubble, size: 24),
//               label: 'Chat',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.menu_rounded, size: 26),
//               label: 'Menu',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// // REUSABLE WIDGETS
// // ══════════════════════════════════════════════════════════════════════════════

// // ── Action Card ───────────────────────────────────────────────────────────────

// class _ActionCard extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onTap;

//   const _ActionCard({
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: AppColors.lightGrey),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.12),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, size: 28, color: color),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.textDark,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ── Banner Section ────────────────────────────────────────────────────────────

// class _BannerSection extends StatefulWidget {
//   const _BannerSection();

//   @override
//   State<_BannerSection> createState() => _BannerSectionState();
// }

// class _BannerSectionState extends State<_BannerSection> {
//   final List<Map<String, String>> _slides = [
//     {
//       'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRU0QzCrFe54Ne8qUBrLcJDwvW4PpMTvKPQQ&s',
//       'label': '🎓 Apply for Scholarships',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=900&q=90',
//       'label': '🏆 Achieve Your Dreams',
//     },
//     {
//       'image': 'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=900&q=90',
//       'label': '📚 Start Learning Today',
//     },
//   ];

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         children: [
//           // ── Carousel ─────────────────────────────────────────────────────────
//           Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 160,
//                   viewportFraction: 1.0,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlayCurve: Curves.easeInOut,
//                   autoPlayAnimationDuration: const Duration(milliseconds: 500),
//                   onPageChanged: (index, reason) {
//                     setState(() => _currentIndex = index);
//                   },
//                 ),
//                 items: _slides.map((slide) {
//                   return Builder(
//                     builder: (context) {
//                       return Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.symmetric(horizontal: 4),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF335C81),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         clipBehavior: Clip.hardEdge,
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: [
//                             // Background image
//                             Image.network(
//                               slide['image']!,
//                               fit: BoxFit.cover,
//                               loadingBuilder: (context, child, progress) {
//                                 if (progress == null) return child;
//                                 return const Center(
//                                   child: CircularProgressIndicator(
//                                     color: Colors.white54,
//                                     strokeWidth: 2,
//                                   ),
//                                 );
//                               },
//                               errorBuilder: (_, __, ___) => const Center(
//                                 child: Icon(Icons.image_not_supported,
//                                     color: Colors.white54, size: 40),
//                               ),
//                             ),
//                             // Dark gradient overlay
//                             Container(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.transparent,
//                                     Colors.black.withOpacity(0.65),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // Label text
//                             Positioned(
//                               bottom: 28,
//                               left: 16,
//                               right: 16,
//                               child: Text(
//                                 slide['label']!,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                   shadows: [
//                                     Shadow(
//                                       color: Colors.black45,
//                                       blurRadius: 6,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),

//               // ── Dots Indicator ────────────────────────────────────────────────
//               Positioned(
//                 bottom: 10,
//                 child: AnimatedSmoothIndicator(
//                   activeIndex: _currentIndex,
//                   count: _slides.length,
//                   effect: const ExpandingDotsEffect(
//                     dotWidth: 8,
//                     dotHeight: 8,
//                     expansionFactor: 2.5,
//                     spacing: 5,
//                     dotColor: Colors.white38,
//                     activeDotColor: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Scholarship Card ──────────────────────────────────────────────────────────

// class _ScholarshipCard extends StatelessWidget {
//   final String title;
//   final String university;
//   final String location;
//   final String type;
//   final String deadline;
//   final String imageUrl;

//   const _ScholarshipCard({
//     required this.title,
//     required this.university,
//     required this.location,
//     required this.type,
//     required this.deadline,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: AppColors.lightGrey),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image
//               Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: AppColors.lightGrey,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Center(
//                   child: Icon(Icons.school_rounded,
//                       size: 32, color: AppColors.primary),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               // Content
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.textDark,
//                         height: 1.3,
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on_outlined,
//                             size: 13, color: AppColors.grey),
//                         const SizedBox(width: 4),
//                         Text(
//                           '$university, $location',
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: AppColors.textLight,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: const Color(0xffE3F2FD),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Text(
//                             type,
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.primaryDark,
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.access_time,
//                             size: 12, color: Color(0xffFF9800)),
//                         const SizedBox(width: 4),
//                         Text(
//                           deadline,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xffFF9800),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scholarship_app/constants/app_colors.dart';
// import 'package:scholarship_app/routes/app_routes.dart';
// import 'package:scholarship_app/screens/fill_information/personal_info_screen.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Homescreens extends StatelessWidget {
//   const Homescreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Scholarship App',
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         scaffoldBackgroundColor: AppColors.lightGrey,
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.lightGrey,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ── Header ────────────────────────────────────────────────────
//             _buildHeader(),

//             // ── Body ──────────────────────────────────────────────────────
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 16),

//                     // Profile Card
//                     _buildProfileCard(),

//                     const SizedBox(height: 20),

//                     // Search Bar
//                     _buildSearchBar(),

//                     const SizedBox(height: 24),

//                     // Banner Slider
//                     const _BannerSection(),

//                     const SizedBox(height: 24),

//                     // ✅ Quick Actions (Updated with Consistent Color)
//                     _buildQuickActions(),

//                     const SizedBox(height: 24),

//                     // Latest Scholarships Header
//                     _buildSectionHeader(),

//                     const SizedBox(height: 16),

//                     // Scholarship Cards
//                     _buildScholarshipCards(),

//                     const SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   // ── Header ────────────────────────────────────────────────────────────────
//   Widget _buildHeader() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [AppColors.primary, AppColors.primaryDark],
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(Icons.school_rounded,
//                     size: 24, color: AppColors.white),
//               ),
//               const SizedBox(width: 12),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Scholarship',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.textDark,
//                       letterSpacing: -0.5,
//                     ),
//                   ),
//                   Text(
//                     'Find Your Future',
//                     style: TextStyle(
//                       fontSize: 11,
//                       color: AppColors.grey,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 onPressed: () =>
//                     Navigator.pushNamed(context, AppRoutes.notificationScreen),
//                 icon: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: AppColors.lightGrey,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(
//                     Icons.notifications_outlined,
//                     color: AppColors.textDark,
//                     size: 22,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                     color: AppColors.red,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Profile Card ──────────────────────────────────────────────────────────
//   Widget _buildProfileCard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: GestureDetector(
//         onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [AppColors.primary, AppColors.primaryDark],
//             ),
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.primary.withOpacity(0.3),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 56,
//                 height: 56,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: AppColors.white, width: 3),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.15),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                   image: const DecorationImage(
//                     image: NetworkImage("https://i.pravatar.cc/150?img=11"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'សួស្តី, Khunrithy 👋',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.white,
//                         letterSpacing: -0.3,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: AppColors.white.withOpacity(0.25),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: const Text(
//                             'Student',
//                             style: TextStyle(
//                               fontSize: 11,
//                               color: AppColors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         Text(
//                           'View Profile',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: AppColors.white.withOpacity(0.9),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const Icon(
//                           Icons.arrow_forward_ios,
//                           color: AppColors.white,
//                           size: 11,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ── Search Bar ────────────────────────────────────────────────────────────
//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               child: Container(
//                 height: 52,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(color: AppColors.divider),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.03),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: const Row(
//                   children: [
//                     Icon(Icons.search, color: AppColors.grey, size: 22),
//                     SizedBox(width: 12),
//                     Text(
//                       'Search scholarships...',
//                       style: TextStyle(
//                         color: AppColors.divider,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Container(
//             width: 52,
//             height: 52,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [AppColors.primary, AppColors.primaryDark],
//               ),
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColors.primary.withOpacity(0.3),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: IconButton(
//               onPressed: () =>
//                   Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               icon: const Icon(
//                 Icons.tune_rounded,
//                 color: AppColors.white,
//                 size: 22,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Quick Actions ─────────────────────────────────────────────────────────
//   Widget _buildQuickActions() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Quick Actions',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: AppColors.textDark,
//               letterSpacing: -0.3,
//             ),
//           ),
//           const SizedBox(height: 14),
//           GridView.count(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisCount: 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 1.5,
//             children: [
//               _ActionCard(
//                 icon: Icons.explore_outlined,
//                 label: 'Discover',
//                 onTap: () =>
//                     Navigator.pushNamed(context, AppRoutes.discoverScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.military_tech_outlined,
//                 label: 'Match',
//                 onTap: () {},
//               ),
//               _ActionCard(
//                 icon: Icons.bookmark_outline,
//                 label: 'Saved',
//                 onTap: () => Navigator.pushNamed(
//                     context, AppRoutes.savedScholarshipScreen),
//               ),
//               _ActionCard(
//                 icon: Icons.edit_document,
//                 label: 'Fill Info',
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const PersonalInfoScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Section Header ────────────────────────────────────────────────────────
//   Widget _buildSectionHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             'Latest Scholarships',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: AppColors.textDark,
//               letterSpacing: -0.3,
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             style: TextButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             ),
//             child: Row(
//               children: const [
//                 Text(
//                   'See All',
//                   style: TextStyle(
//                     color: AppColors.primary,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(width: 4),
//                 Icon(Icons.arrow_forward_ios,
//                     size: 12, color: AppColors.primary),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Scholarship Cards ─────────────────────────────────────────────────────
//   Widget _buildScholarshipCards() {
//     return Column(
//       children: [
//         _ScholarshipCard(
//           title: 'Full Scholarship to MIT',
//           university: 'MIT',
//           location: 'United States',
//           type: 'Full Scholarship',
//           deadline: 'Mar 30, 2026',
//           imageUrl: 'assets/images/mit.png', // Placeholder
//         ),
//         const SizedBox(height: 12),
//         _ScholarshipCard(
//           title: 'Engineering Excellence Award',
//           university: 'Stanford',
//           location: 'USA',
//           type: 'Partial',
//           deadline: 'Apr 15, 2026',
//           imageUrl: 'assets/images/stanford.png',
//         ),
//       ],
//     );
//   }

//   // ── Bottom Navigation ─────────────────────────────────────────────────────
//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 12,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: (index) => setState(() => _selectedIndex = index),
//           backgroundColor: AppColors.white,
//           selectedItemColor: AppColors.primary,
//           unselectedItemColor: AppColors.grey,
//           selectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 12,
//           ),
//           unselectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 11,
//           ),
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           elevation: 0,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined, size: 26),
//               activeIcon: Icon(Icons.home_rounded, size: 26),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.chat_bubble_outline, size: 24),
//               activeIcon: Icon(Icons.chat_bubble, size: 24),
//               label: 'Chat',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.menu_rounded, size: 26),
//               label: 'Menu',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// // REUSABLE WIDGETS
// // ══════════════════════════════════════════════════════════════════════════════

// // ── Action Card (MODIFIED: Consistent Primary Theme) ──────────────────────────

// class _ActionCard extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onTap;

//   const _ActionCard({
//     required this.icon,
//     required this.label,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: AppColors.lightGrey),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 // ប្រើពណ៌ Primary ដូចគ្នាទាំងអស់ដើម្បីឱ្យមើលទៅ Pro
//                 color: AppColors.primary.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child:
//                   Icon(icon, size: 28, color: AppColors.primary // ប្រើពណ៌តែមួយ
//                       ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.textDark,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ── Banner Section ────────────────────────────────────────────────────────────

// class _BannerSection extends StatefulWidget {
//   const _BannerSection();

//   @override
//   State<_BannerSection> createState() => _BannerSectionState();
// }

// class _BannerSectionState extends State<_BannerSection> {
//   final List<Map<String, String>> _slides = [
//     {
//       'image':
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRU0QzCrFe54Ne8qUBrLcJDwvW4PpMTvKPQQ&s',
//       'label': '🎓 Apply for Scholarships',
//     },
//     {
//       'image':
//           'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=900&q=90',
//       'label': '🏆 Achieve Your Dreams',
//     },
//     {
//       'image':
//           'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=900&q=90',
//       'label': '📚 Start Learning Today',
//     },
//   ];

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         children: [
//           Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 130,
//                   viewportFraction: 1.0,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlayCurve: Curves.easeInOut,
//                   autoPlayAnimationDuration: const Duration(milliseconds: 500),
//                   onPageChanged: (index, reason) {
//                     setState(() => _currentIndex = index);
//                   },
//                 ),
//                 items: _slides.map((slide) {
//                   return Builder(
//                     builder: (context) {
//                       return Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.symmetric(horizontal: 4),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF335C81),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         clipBehavior: Clip.hardEdge,
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: [
//                             Image.network(
//                               slide['image']!,
//                               fit: BoxFit.cover,
//                               loadingBuilder: (context, child, progress) {
//                                 if (progress == null) return child;
//                                 return const Center(
//                                   child: CircularProgressIndicator(
//                                     color: Colors.white54,
//                                     strokeWidth: 2,
//                                   ),
//                                 );
//                               },
//                               errorBuilder: (_, __, ___) => const Center(
//                                 child: Icon(Icons.image_not_supported,
//                                     color: Colors.white54, size: 40),
//                               ),
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.transparent,
//                                     Colors.black.withOpacity(0.65),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 28,
//                               left: 16,
//                               right: 16,
//                               child: Text(
//                                 slide['label']!,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                   shadows: [
//                                     Shadow(
//                                       color: Colors.black45,
//                                       blurRadius: 6,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//               Positioned(
//                 bottom: 10,
//                 child: AnimatedSmoothIndicator(
//                   activeIndex: _currentIndex,
//                   count: _slides.length,
//                   effect: const ExpandingDotsEffect(
//                     dotWidth: 8,
//                     dotHeight: 8,
//                     expansionFactor: 2.5,
//                     spacing: 5,
//                     dotColor: Colors.white38,
//                     activeDotColor: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Scholarship Card ──────────────────────────────────────────────────────────

// class _ScholarshipCard extends StatelessWidget {
//   final String title;
//   final String university;
//   final String location;
//   final String type;
//   final String deadline;
//   final String imageUrl;

//   const _ScholarshipCard({
//     required this.title,
//     required this.university,
//     required this.location,
//     required this.type,
//     required this.deadline,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: AppColors.lightGrey),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: AppColors.lightGrey,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Center(
//                   child: Icon(Icons.school_rounded,
//                       size: 32, color: AppColors.primary),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.textDark,
//                         height: 1.3,
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on_outlined,
//                             size: 13, color: AppColors.grey),
//                         const SizedBox(width: 4),
//                         Text(
//                           '$university, $location',
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: AppColors.textLight,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: const Color(0xffE3F2FD),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Text(
//                             type,
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.primaryDark,
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.access_time,
//                             size: 12, color: Color(0xffFF9800)),
//                         const SizedBox(width: 4),
//                         Text(
//                           deadline,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xffFF9800),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scholarship_app/constants/app_colors.dart';
// import 'package:scholarship_app/routes/app_routes.dart';
// import 'package:scholarship_app/screens/fill_information/personal_info_screen.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// // ── Dark Theme Colors (ACLEDA-inspired but Modern) ────────────────────────────
// class _DarkColors {
//   static const bg         = Color(0xFF0A0F1E); // Deep navy
//   static const surface    = Color(0xFF111827); // Card surface
//   static const card       = Color(0xFF1A2235); // Slightly lighter card
//   static const cardBorder = Color(0xFF2A3650); // Subtle border
//   static const gold       = Color(0xFFFDB827); // Primary gold accent
//   static const goldLight  = Color(0xFFFFD166); // Light gold
//   static const goldDark   = Color(0xFFE09B10); // Dark gold
//   static const textPrimary   = Color(0xFFEEF2FF); // Near white
//   static const textSecondary = Color(0xFF8B98B8); // Muted blue-grey
//   static const textMuted     = Color(0xFF4A5568); // Very muted
//   static const blue       = Color(0xFF3B82F6); // Accent blue
//   static const green      = Color(0xFF10B981); // Online / success
// }

// class Homescreens extends StatelessWidget {
//   const Homescreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarBrightness: Brightness.dark,
//       statusBarIconBrightness: Brightness.light,
//     ));
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Scholarship App',
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         scaffoldBackgroundColor: _DarkColors.bg,
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _DarkColors.bg,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeroSection(),
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//                     _buildSearchBar(),
//                     const SizedBox(height: 24),
//                     const _BannerSection(),
//                     const SizedBox(height: 28),
//                     _buildQuickActionsLabel(),
//                     const SizedBox(height: 14),
//                     _buildQuickActions(),
//                     const SizedBox(height: 28),
//                     _buildSectionHeader(),
//                     const SizedBox(height: 14),
//                     _buildScholarshipCards(),
//                     const SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   // ══════════════════════════════════════════════════════════════════════════
//   // HERO SECTION
//   // ══════════════════════════════════════════════════════════════════════════
//   Widget _buildHeroSection() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 14, 20, 22),
//       decoration: BoxDecoration(
//         color: _DarkColors.surface,
//         border: const Border(
//           bottom: BorderSide(color: _DarkColors.cardBorder, width: 1),
//         ),
//       ),
//       child: Column(
//         children: [
//           // ── Row 1: Logo + Notification ──────────────────────────────────
//           Row(
//             children: [
//               // App icon gold
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [_DarkColors.gold, _DarkColors.goldDark],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: _DarkColors.gold.withOpacity(0.35),
//                       blurRadius: 10,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: const Icon(Icons.school_rounded, color: _DarkColors.bg, size: 22),
//               ),
//               const SizedBox(width: 10),

//               // App name
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Scholarship',
//                       style: TextStyle(
//                         fontSize: 17,
//                         fontWeight: FontWeight.w700,
//                         color: _DarkColors.textPrimary,
//                         letterSpacing: -0.4,
//                         height: 1.1,
//                       ),
//                     ),
//                     Text(
//                       'Find Your Future',
//                       style: TextStyle(
//                         fontSize: 10,
//                         color: _DarkColors.textSecondary,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Notification
//               GestureDetector(
//                 onTap: () => Navigator.pushNamed(context, AppRoutes.notificationScreen),
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Container(
//                       width: 42,
//                       height: 42,
//                       decoration: BoxDecoration(
//                         color: _DarkColors.card,
//                         borderRadius: BorderRadius.circular(13),
//                         border: Border.all(color: _DarkColors.cardBorder, width: 1),
//                       ),
//                       child: const Icon(Icons.notifications_outlined,
//                           color: _DarkColors.textPrimary, size: 20),
//                     ),
//                     Positioned(
//                       top: -2,
//                       right: -2,
//                       child: Container(
//                         width: 10,
//                         height: 10,
//                         decoration: BoxDecoration(
//                           color: AppColors.red,
//                           shape: BoxShape.circle,
//                           border: Border.all(color: _DarkColors.surface, width: 1.5),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 20),

//           // ── Row 2: Profile ───────────────────────────────────────────────
//           GestureDetector(
//             onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
//             child: Row(
//               children: [
//                 // Avatar + online dot
//                 Stack(
//                   children: [
//                     Container(
//                       width: 52,
//                       height: 52,
//                       padding: const EdgeInsets.all(2.5),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: const LinearGradient(
//                           colors: [_DarkColors.gold, _DarkColors.goldDark],
//                         ),
//                       ),
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             image: NetworkImage("https://i.pravatar.cc/150?img=11"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 1,
//                       right: 1,
//                       child: Container(
//                         width: 12,
//                         height: 12,
//                         decoration: BoxDecoration(
//                           color: _DarkColors.green,
//                           shape: BoxShape.circle,
//                           border: Border.all(color: _DarkColors.surface, width: 2),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(width: 14),

//                 // Greeting + Name
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Good Morning',
//                         style: TextStyle(
//                           fontSize: 11,
//                           color: _DarkColors.textSecondary,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       const SizedBox(height: 1),
//                       const Text(
//                         'Hello, Khunrithy 👋',
//                         style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w700,
//                           color: _DarkColors.textPrimary,
//                           letterSpacing: -0.4,
//                           height: 1.2,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                             decoration: BoxDecoration(
//                               color: _DarkColors.gold.withOpacity(0.15),
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                   color: _DarkColors.gold.withOpacity(0.3), width: 1),
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   width: 5,
//                                   height: 5,
//                                   decoration: const BoxDecoration(
//                                     color: _DarkColors.green,
//                                     shape: BoxShape.circle,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 4),
//                                 const Text(
//                                   'Student',
//                                   style: TextStyle(
//                                     fontSize: 10,
//                                     color: _DarkColors.goldLight,
//                                     fontWeight: FontWeight.w600,
//                                     letterSpacing: 0.2,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Profile button
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
//                   decoration: BoxDecoration(
//                     color: _DarkColors.card,
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(color: _DarkColors.cardBorder, width: 1),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Text(
//                         'Profile',
//                         style: TextStyle(
//                           fontSize: 11,
//                           fontWeight: FontWeight.w600,
//                           color: _DarkColors.gold,
//                           letterSpacing: -0.1,
//                         ),
//                       ),
//                       SizedBox(width: 4),
//                       Icon(Icons.arrow_forward_ios_rounded,
//                           size: 9, color: _DarkColors.gold),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Search Bar ────────────────────────────────────────────────────────────
//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () => Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//               child: Container(
//                 height: 50,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: _DarkColors.card,
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(color: _DarkColors.cardBorder),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(Icons.search, color: _DarkColors.textSecondary, size: 20),
//                     const SizedBox(width: 10),
//                     Text(
//                       'Search scholarships...',
//                       style: TextStyle(
//                         color: _DarkColors.textMuted,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           GestureDetector(
//             onTap: () => Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
//             child: Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [_DarkColors.gold, _DarkColors.goldDark],
//                 ),
//                 borderRadius: BorderRadius.circular(14),
//                 boxShadow: [
//                   BoxShadow(
//                     color: _DarkColors.gold.withOpacity(0.3),
//                     blurRadius: 8,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: const Icon(Icons.tune_rounded, color: _DarkColors.bg, size: 22),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Quick Actions Label ───────────────────────────────────────────────────
//   Widget _buildQuickActionsLabel() {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Text(
//         'Quick Actions',
//         style: TextStyle(
//           fontSize: 17,
//           fontWeight: FontWeight.w700,
//           color: _DarkColors.textPrimary,
//           letterSpacing: -0.3,
//         ),
//       ),
//     );
//   }

//   // ── Quick Actions Grid ────────────────────────────────────────────────────
//   Widget _buildQuickActions() {
//     final actions = [
//       {'icon': Icons.explore_outlined, 'label': 'Discover', 'route': AppRoutes.discoverScreen},
//       {'icon': Icons.military_tech_outlined, 'label': 'Match', 'route': ''},
//       {'icon': Icons.bookmark_outline, 'label': 'Saved', 'route': AppRoutes.savedScholarshipScreen},
//       {'icon': Icons.edit_document, 'label': 'Fill Info', 'route': 'fill'},
//     ];

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: GridView.count(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         crossAxisCount: 2,
//         crossAxisSpacing: 12,
//         mainAxisSpacing: 12,
//         childAspectRatio: 1.55,
//         children: actions.map((action) {
//           return GestureDetector(
//             onTap: () {
//               final route = action['route'] as String;
//               if (route == 'fill') {
//                 Navigator.push(context, MaterialPageRoute(
//                   builder: (_) => const PersonalInfoScreen()));
//               } else if (route.isNotEmpty) {
//                 Navigator.pushNamed(context, route);
//               }
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: _DarkColors.card,
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: _DarkColors.cardBorder, width: 1),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 8,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   // Gold top-left corner accent
//                   Positioned(
//                     top: 0,
//                     left: 0,
//                     child: Container(
//                       width: 3,
//                       height: 28,
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [_DarkColors.gold, Colors.transparent],
//                         ),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(16),
//                           bottomLeft: Radius.circular(4),
//                         ),
//                       ),
//                     ),
//                   ),

//                   Padding(
//                     padding: const EdgeInsets.all(14),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 38,
//                           height: 38,
//                           decoration: BoxDecoration(
//                             color: _DarkColors.gold.withOpacity(0.12),
//                             borderRadius: BorderRadius.circular(11),
//                             border: Border.all(
//                               color: _DarkColors.gold.withOpacity(0.2),
//                               width: 1,
//                             ),
//                           ),
//                           child: Icon(
//                             action['icon'] as IconData,
//                             size: 20,
//                             color: _DarkColors.gold,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           action['label'] as String,
//                           style: const TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                             color: _DarkColors.textPrimary,
//                             letterSpacing: -0.2,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   // ── Section Header ────────────────────────────────────────────────────────
//   Widget _buildSectionHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             'Latest Scholarships',
//             style: TextStyle(
//               fontSize: 17,
//               fontWeight: FontWeight.w700,
//               color: _DarkColors.textPrimary,
//               letterSpacing: -0.3,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//               decoration: BoxDecoration(
//                 color: _DarkColors.gold.withOpacity(0.12),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(
//                     color: _DarkColors.gold.withOpacity(0.25), width: 1),
//               ),
//               child: const Text(
//                 'See All',
//                 style: TextStyle(
//                   color: _DarkColors.gold,
//                   fontSize: 11,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Scholarship Cards ─────────────────────────────────────────────────────
//   Widget _buildScholarshipCards() {
//     return Column(
//       children: [
//         _ScholarshipCard(
//           title: 'Full Scholarship to MIT',
//           university: 'MIT',
//           location: 'United States',
//           type: 'Full Scholarship',
//           deadline: 'Mar 30, 2026',
//         ),
//         const SizedBox(height: 12),
//         _ScholarshipCard(
//           title: 'Engineering Excellence Award',
//           university: 'Stanford',
//           location: 'USA',
//           type: 'Partial',
//           deadline: 'Apr 15, 2026',
//         ),
//       ],
//     );
//   }

//   // ── Bottom Navigation ─────────────────────────────────────────────────────
//   Widget _buildBottomNavBar() {
//     final items = [
//       {'icon': Icons.home_outlined, 'activeIcon': Icons.home_rounded, 'label': 'Home'},
//       {'icon': Icons.chat_bubble_outline, 'activeIcon': Icons.chat_bubble, 'label': 'Chat'},
//       {'icon': Icons.menu_rounded, 'activeIcon': Icons.menu_rounded, 'label': 'Menu'},
//     ];

//     return Container(
//       decoration: const BoxDecoration(
//         color: _DarkColors.surface,
//         border: Border(top: BorderSide(color: _DarkColors.cardBorder, width: 1)),
//       ),
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: List.generate(items.length, (i) {
//               final selected = _selectedIndex == i;
//               return GestureDetector(
//                 onTap: () => setState(() => _selectedIndex = i),
//                 behavior: HitTestBehavior.opaque,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         selected
//                             ? items[i]['activeIcon'] as IconData
//                             : items[i]['icon'] as IconData,
//                         size: 26,
//                         color: selected ? _DarkColors.gold : _DarkColors.textSecondary,
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         items[i]['label'] as String,
//                         style: TextStyle(
//                           fontSize: 11,
//                           fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
//                           color: selected ? _DarkColors.gold : _DarkColors.textSecondary,
//                         ),
//                       ),
//                       const SizedBox(height: 2),
//                       // Gold indicator dot
//                       AnimatedContainer(
//                         duration: const Duration(milliseconds: 200),
//                         width: selected ? 18 : 0,
//                         height: 3,
//                         decoration: BoxDecoration(
//                           color: _DarkColors.gold,
//                           borderRadius: BorderRadius.circular(2),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// // BANNER SECTION
// // ══════════════════════════════════════════════════════════════════════════════

// class _BannerSection extends StatefulWidget {
//   const _BannerSection();

//   @override
//   State<_BannerSection> createState() => _BannerSectionState();
// }

// class _BannerSectionState extends State<_BannerSection> {
//   final List<Map<String, String>> _slides = [
//     {'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRU0QzCrFe54Ne8qUBrLcJDwvW4PpMTvKPQQ&s', 'label': '🎓 Apply for Scholarships'},
//     {'image': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=900&q=90', 'label': '🏆 Achieve Your Dreams'},
//     {'image': 'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=900&q=90', 'label': '📚 Start Learning Today'},
//   ];
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 135,
//               viewportFraction: 1.0,
//               autoPlay: true,
//               autoPlayInterval: const Duration(seconds: 3),
//               autoPlayCurve: Curves.easeInOut,
//               autoPlayAnimationDuration: const Duration(milliseconds: 500),
//               onPageChanged: (index, _) => setState(() => _currentIndex = index),
//             ),
//             items: _slides.map((slide) {
//               return Builder(builder: (context) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(18),
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       Image.network(
//                         slide['image']!,
//                         fit: BoxFit.cover,
//                         loadingBuilder: (context, child, progress) {
//                           if (progress == null) return child;
//                           return Container(
//                             color: _DarkColors.card,
//                             child: const Center(
//                               child: CircularProgressIndicator(
//                                 color: _DarkColors.gold,
//                                 strokeWidth: 2,
//                               ),
//                             ),
//                           );
//                         },
//                         errorBuilder: (_, __, ___) => Container(
//                           color: _DarkColors.card,
//                           child: const Center(
//                             child: Icon(Icons.image_not_supported,
//                                 color: _DarkColors.textMuted, size: 36),
//                           ),
//                         ),
//                       ),
//                       // Gradient overlay
//                       Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             colors: [
//                               Colors.transparent,
//                               Colors.black.withOpacity(0.75),
//                             ],
//                           ),
//                         ),
//                       ),
//                       // Gold left bar
//                       Positioned(
//                         left: 0, top: 0, bottom: 0,
//                         child: Container(
//                           width: 4,
//                           decoration: const BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [_DarkColors.gold, _DarkColors.goldDark],
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Label
//                       Positioned(
//                         bottom: 26,
//                         left: 16,
//                         right: 16,
//                         child: Text(
//                           slide['label']!,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w700,
//                             shadows: [Shadow(color: Colors.black54, blurRadius: 6)],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               });
//             }).toList(),
//           ),
//           // Dots
//           Positioned(
//             bottom: 9,
//             child: AnimatedSmoothIndicator(
//               activeIndex: _currentIndex,
//               count: _slides.length,
//               effect: ExpandingDotsEffect(
//                 dotWidth: 6,
//                 dotHeight: 6,
//                 expansionFactor: 2.5,
//                 spacing: 4,
//                 dotColor: Colors.white24,
//                 activeDotColor: _DarkColors.gold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// // SCHOLARSHIP CARD
// // ══════════════════════════════════════════════════════════════════════════════

// class _ScholarshipCard extends StatelessWidget {
//   final String title;
//   final String university;
//   final String location;
//   final String type;
//   final String deadline;

//   const _ScholarshipCard({
//     required this.title,
//     required this.university,
//     required this.location,
//     required this.type,
//     required this.deadline,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           color: _DarkColors.card,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: _DarkColors.cardBorder, width: 1),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 10,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Icon box with gold border
//               Container(
//                 width: 64,
//                 height: 64,
//                 decoration: BoxDecoration(
//                   color: _DarkColors.gold.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(
//                       color: _DarkColors.gold.withOpacity(0.25), width: 1),
//                 ),
//                 child: const Center(
//                   child: Icon(Icons.school_rounded,
//                       size: 30, color: _DarkColors.gold),
//                 ),
//               ),
//               const SizedBox(width: 14),

//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: _DarkColors.textPrimary,
//                         height: 1.3,
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       children: [
//                         Icon(Icons.location_on_outlined,
//                             size: 12, color: _DarkColors.textSecondary),
//                         const SizedBox(width: 3),
//                         Text(
//                           '$university, $location',
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: _DarkColors.textSecondary,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         // Type badge
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: _DarkColors.gold.withOpacity(0.12),
//                             borderRadius: BorderRadius.circular(6),
//                             border: Border.all(
//                                 color: _DarkColors.gold.withOpacity(0.25), width: 1),
//                           ),
//                           child: Text(
//                             type,
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w600,
//                               color: _DarkColors.goldLight,
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.access_time,
//                             size: 11, color: _DarkColors.textSecondary),
//                         const SizedBox(width: 3),
//                         Text(
//                           deadline,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w500,
//                             color: _DarkColors.textSecondary,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_app/constants/app_colors.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
import 'package:scholarship_app/routes/app_routes.dart';
import 'package:scholarship_app/screens/fill_information/personal_info_screen.dart';

class Homescreens extends StatelessWidget {
  const Homescreens({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: t.translate('appTitle'),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColors.lightGrey,
        useMaterial3: true,
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
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerHighest,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeroSection(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildSearchBar(),
                    const SizedBox(height: 24),
                    const _BannerSection(),
                    const SizedBox(height: 24),
                    _buildQuickActions(),
                    const SizedBox(height: 24),
                    _buildSectionHeader(),
                    const SizedBox(height: 16),
                    _buildScholarshipCards(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final t = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF2C2C2C), const Color(0xFF1E1E1E)]
              : [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -35,
            right: -25,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.07),
              ),
            ),
          ),
          Positioned(
            bottom: -15,
            right: 55,
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: -20,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.04),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Icon + Name + Notification
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.28),
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.translate('homeScholarshipBrand'),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                              letterSpacing: -0.4,
                              height: 1.1,
                            ),
                          ),
                          Text(
                            t.translate('homeFindYourFuture'),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.65),
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.notificationScreen),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: const Icon(
                              Icons.notifications_outlined,
                              color: AppColors.white,
                              size: 20,
                            ),
                          ),
                          Positioned(
                            top: -3,
                            right: -3,
                            child: Container(
                              width: 11,
                              height: 11,
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primaryDark,
                                  width: 1.8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Gradient divider
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(0.22),
                        Colors.white.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Profile Row
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.profileScreen),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Avatar with ring + online dot
                      Stack(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://i.pravatar.cc/150?img=11"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              width: 13,
                              height: 13,
                              decoration: BoxDecoration(
                                color: const Color(0xFF69F0AE),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primaryDark,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 14),

                      // Greeting + Name + Student badge
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.translate('homeGoodMorning'),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.7),
                                letterSpacing: 0.1,
                              ),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              t.translate('homeUserName'),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                                letterSpacing: -0.5,
                                height: 1.15,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.16),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.22),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF69F0AE),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    t.translate('homeStudentBadge'),
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.9),
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // White Profile pill button
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.14),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              t.translate('homeProfileButton'),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                                letterSpacing: -0.2,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 10,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.searchFilterScreen),
              child: Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: colorScheme.outline),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search,
                        color: colorScheme.onSurfaceVariant, size: 22),
                    const SizedBox(width: 12),
                    Text(
                      t.translate('homeSearchHint'),
                      style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Builder(
            builder: (context) {
              final isDark = Theme.of(context).brightness == Brightness.dark;
              return Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [const Color(0xFF3A3A3A), const Color(0xFF2C2C2C)]
                        : [AppColors.primary, AppColors.primaryDark],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? Colors.black.withOpacity(0.3)
                          : AppColors.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () => Navigator.pushNamed(
                      context, AppRoutes.searchFilterScreen),
                  icon: Icon(Icons.tune_rounded,
                      color: isDark ? colorScheme.onSurface : AppColors.white,
                      size: 22),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.translate('homeQuickActionsTitle'),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 14),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: [
              _ActionCard(
                icon: Icons.explore_outlined,
                label: t.translate('homeActionDiscover'),
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.discoverScreen),
              ),
              _ActionCard(
                  icon: Icons.military_tech_outlined,
                  label: t.translate('homeActionMatch'),
                  onTap: () {}),
              _ActionCard(
                icon: Icons.bookmark_outline,
                label: t.translate('homeActionSaved'),
                onTap: () => Navigator.pushNamed(
                    context, AppRoutes.savedScholarshipScreen),
              ),
              _ActionCard(
                icon: Icons.edit_document,
                label: t.translate('homeActionFillInfo'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PersonalInfoScreen()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            t.translate('homeLatestScholarships'),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
              letterSpacing: -0.3,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
            child: Row(
              children: [
                Text(t.translate('homeSeeAll'),
                    style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                const SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios,
                    size: 12, color: colorScheme.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipCards() {
    final t = AppLocalizations.of(context);
    return Column(
      children: [
        _ScholarshipCard(
          title: t.translate('homeScholarship1Title'),
          university: t.translate('homeScholarship1University'),
          location: t.translate('homeScholarship1Location'),
          type: t.translate('homeScholarship1Type'),
          deadline: t.translate('homeScholarship1Deadline'),
          imageUrl: 'assets/images/mit.png',
        ),
        const SizedBox(height: 12),
        _ScholarshipCard(
          title: t.translate('homeScholarship2Title'),
          university: t.translate('homeScholarship2University'),
          location: t.translate('homeScholarship2Location'),
          type: t.translate('homeScholarship2Type'),
          deadline: t.translate('homeScholarship2Deadline'),
          imageUrl: 'assets/images/stanford.png',
        ),
      ],
    );
  }
}

// ── Action Card ───────────────────────────────────────────────────────────────

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionCard(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: colorScheme.outlineVariant),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 28, color: colorScheme.primary),
            ),
            const SizedBox(height: 10),
            Text(label,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface)),
          ],
        ),
      ),
    );
  }
}

// ── Banner Section ────────────────────────────────────────────────────────────

class _BannerSection extends StatefulWidget {
  const _BannerSection();

  @override
  State<_BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<_BannerSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final List<Map<String, String>> slides = [
      {
        'image':
            'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=1200&q=90',
        'title': t.translate('homeBannerTitle1'),
        'subtitle': t.translate('homeBannerSubtitle1')
      },
      {
        'image':
            'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=1200&q=90',
        'title': t.translate('homeBannerTitle2'),
        'subtitle': t.translate('homeBannerSubtitle2')
      },
      {
        'image':
            'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=1200&q=90',
        'title': t.translate('homeBannerTitle3'),
        'subtitle': t.translate('homeBannerSubtitle3')
      },
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 140,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayCurve: Curves.easeInOutCubic,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) =>
                      setState(() => _currentIndex = index),
                ),
                items: slides.map((slide) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.primary.withOpacity(0.8),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Background Image
                            Image.network(
                              slide['image']!,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white.withOpacity(0.7),
                                    strokeWidth: 2.5,
                                  ),
                                );
                              },
                              errorBuilder: (_, __, ___) => Container(
                                color: AppColors.primary.withOpacity(0.2),
                                child: const Center(
                                  child: Icon(
                                    Icons.school_rounded,
                                    color: Colors.white54,
                                    size: 60,
                                  ),
                                ),
                              ),
                            ),
                            // Gradient Overlay
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                            ),
                            // Content
                            Positioned(
                              left: 20,
                              right: 20,
                              bottom: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    slide['title']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.5,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black38,
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    slide['subtitle']!,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.95),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                      shadows: const [
                                        Shadow(
                                          color: Colors.black26,
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 14),
          // Modern Dot Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(slides.length, (index) {
              final isActive = index == _currentIndex;
              final colorScheme = Theme.of(context).colorScheme;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: isActive ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isActive
                      ? colorScheme.primary
                      : colorScheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// ── Scholarship Card ──────────────────────────────────────────────────────────

class _ScholarshipCard extends StatelessWidget {
  final String title;
  final String university;
  final String location;
  final String type;
  final String deadline;
  final String imageUrl;

  const _ScholarshipCard({
    required this.title,
    required this.university,
    required this.location,
    required this.type,
    required this.deadline,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.outlineVariant),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 2))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Icon(Icons.school_rounded,
                        size: 32, color: colorScheme.primary)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                            height: 1.3)),
                    const SizedBox(height: 6),
                    Row(children: [
                      Icon(Icons.location_on_outlined,
                          size: 13, color: colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text('$university, $location',
                          style: TextStyle(
                              fontSize: 11,
                              color: colorScheme.onSurfaceVariant)),
                    ]),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              color: colorScheme.primary.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(type,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.primary)),
                        ),
                        const Spacer(),
                        const Icon(Icons.access_time,
                            size: 12, color: Color(0xffFF9800)),
                        const SizedBox(width: 4),
                        Text(deadline,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFF9800))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
