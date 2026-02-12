// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:scholarship_app/constants/app_colors.dart';
import 'package:scholarship_app/routes/app_routes.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String selectedCategory = 'All';
  final List<String> categories = [
    'All',
    'Technology',
    'Science',
    'Business',
    'Art',
  ];

  final List<Scholarship> scholarships = [
    Scholarship(
      university: 'Royal University of Phnom Penh',
      educationLevel: 'Bachelor Degree',
      type: '100%',
      numberOfPlaces: 20,
      studyAt: 'Phnom Penh',
      receiptDate: '28-Nov-2025',
      deadline: '14-Apr-2026',
      assetPath: 'assets/icons/RUPP.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'National University of Management',
      educationLevel: 'Bachelor Degree',
      type: '100%',
      numberOfPlaces: 10,
      studyAt: 'Phnom Penh',
      receiptDate: '28-Nov-2025',
      deadline: '18-Jun-2026',
      assetPath: 'assets/icons/NUM.png',
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        toolbarHeight: 76,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Scholarship Finder',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Find your dream scholarship',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white24,
            child: Icon(Icons.notifications_none, color: Colors.white),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white24,
            child: Icon(Icons.person_outline, color: Colors.white),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: EdgeInsets.fromLTRB(20, 8, 20, 35),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search scholarships',
                        hintStyle: TextStyle(
                          color: AppColors.hintText,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.primary,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.tune, color: AppColors.primary),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Categories
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  final isSelected = category == selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.divider,
                          ),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Scholarships List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: scholarships.length,
              itemBuilder: (context, index) {
                return ScholarshipCard(
                  scholarship: scholarships[index],
                  onFavoriteToggle: () {
                    setState(() {
                      scholarships[index].isFavorite =
                          !scholarships[index].isFavorite;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScholarshipCard extends StatelessWidget {
  final Scholarship scholarship;
  final VoidCallback onFavoriteToggle;

  const ScholarshipCard({
    super.key,
    required this.scholarship,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () =>
          Navigator.pushNamed(context, AppRoutes.scholarshipDetailScreen),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            // color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            scholarship.assetPath,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            scholarship.university,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Icon(
                      scholarship.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: scholarship.isFavorite
                          ? AppColors.red
                          : AppColors.grey,
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Education Level
              _buildInfoRow(
                context,
                icon: Icons.school_outlined,
                label: 'Education level',
                value: scholarship.educationLevel,
              ),
              const SizedBox(height: 12),

              // Type
              _buildInfoRow(
                context,
                icon: Icons.info_outline,
                label: 'Type',
                value: scholarship.type,
              ),
              const SizedBox(height: 12),

              // Number of Places
              _buildInfoRow(
                context,
                icon: Icons.check_circle_outline,
                label: 'Number of places',
                value: scholarship.numberOfPlaces.toString(),
              ),
              const SizedBox(height: 12),

              // Study At
              _buildInfoRow(
                context,
                icon: Icons.location_on_outlined,
                label: 'Study at',
                value: scholarship.studyAt,
              ),
              const SizedBox(height: 12),

              // Receipt Date
              _buildInfoRow(
                context,
                icon: Icons.calendar_today_outlined,
                label: 'Receipt date',
                value: scholarship.receiptDate,
              ),
              const SizedBox(height: 12),

              // Deadline
              _buildInfoRow(
                context,
                icon: Icons.access_time_outlined,
                label: 'Deadline',
                value: scholarship.deadline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: 12),
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(fontSize: 13, color: AppColors.textLight),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class Scholarship {
  final String university;
  final String educationLevel;
  final String type;
  final int numberOfPlaces;
  final String studyAt;
  final String receiptDate;
  final String deadline;
  final String assetPath;
  bool isFavorite;

  Scholarship({
    required this.university,
    required this.educationLevel,
    required this.type,
    required this.numberOfPlaces,
    required this.studyAt,
    required this.receiptDate,
    required this.deadline,
    required this.assetPath,
    required this.isFavorite,
  });
}
