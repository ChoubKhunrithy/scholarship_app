import 'package:flutter/material.dart';
import 'package:scholarship_app/constants/app_colors.dart';

class ManageUsersScreen extends StatefulWidget {
  const ManageUsersScreen({super.key});

  @override
  State<ManageUsersScreen> createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 8),
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0, //use for scrolled under effect
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Manage Users',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_rounded,
              // Icons.add_outlined,
              color: AppColors.primary,
              size: 30,
            ),
            onPressed: () {
              // Handle add new user action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and Filter Bar
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search user...',
                        hintStyle: const TextStyle(
                          color: AppColors.hintText,
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.hintText,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.zero,
                        isDense: true,
                        // alignLabelWithHint: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // Show filter options
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Icon(
                          Icons.tune,
                          color: AppColors.textDark,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Statistics Cards
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(value: '10', label: 'Total Users'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    value: '5',
                    label: 'Active',
                    valueColor: AppColors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    value: '2',
                    label: 'Inactive',
                    valueColor: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // User List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 12),
                _buildUserCard(
                  initials: 'HP',
                  name: 'Houn Panha',
                  email: 'hounpanha@gmail.com',
                  joinDate: '10-01-2025',
                  isActive: true,
                  initialsColor: AppColors.primary,
                ),
                const SizedBox(height: 12),
                _buildUserCard(
                  initials: 'RN',
                  name: 'Rorn Nary',
                  email: 'rornnary@gmail.com',
                  joinDate: '10-01-2025',
                  isActive: false,
                  initialsColor: AppColors.primary,
                ),
                const SizedBox(height: 12),
                _buildUserCard(
                  initials: 'CK',
                  name: 'Choub Khunrithy',
                  email: 'choubkhunrithy@gmail.com',
                  joinDate: '10-01-2025',
                  isActive: true,
                  initialsColor: AppColors.primary,
                ),
                const SizedBox(height: 12),
                _buildUserCard(
                  initials: 'AB',
                  name: 'An Bunkhim',
                  email: 'bunkhim@gmail.com',
                  joinDate: '10-01-2025',
                  isActive: true,
                  initialsColor: AppColors.primary,
                ),
                const SizedBox(height: 12),
                _buildUserCard(
                  initials: 'RR',
                  name: 'Rith Reaksmeykanan',
                  email: 'reaksmeykanan@gmail.com',
                  joinDate: '10-01-2025',
                  isActive: true,
                  initialsColor: AppColors.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String value,
    required String label,
    Color? valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: valueColor ?? AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.textDark),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard({
    required String initials,
    required String name,
    required String email,
    required String joinDate,
    required bool? isActive,
    required Color initialsColor,
  }) {
    return Container(
      // height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, //
            children: [
              // Avatar with initials
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [initialsColor.withOpacity(0.7), initialsColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // User info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
              // Status badge
              if (isActive != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.green.withOpacity(0.1)
                        : AppColors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    isActive ? 'Active' : 'Inactive',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isActive ? AppColors.green : AppColors.grey,
                    ),
                  ),
                ),
            ],
          ),
          // const SizedBox(height: 12),
          // Join date and edit button
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: 60), // Align with avatar
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Text(
                      'Joined: ',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    Text(
                      joinDate,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigate to user detail/edit screen
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.edit_outlined,
                      color: AppColors.textDark, size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
