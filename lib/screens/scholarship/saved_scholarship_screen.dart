// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:scholarship_app/constants/app_colors.dart';

class SavedScholarshipScreen extends StatefulWidget {
  const SavedScholarshipScreen({super.key});

  @override
  State<SavedScholarshipScreen> createState() => _SavedScholarshipScreenState();
}

class _SavedScholarshipScreenState extends State<SavedScholarshipScreen> {
  //visibility 3 cards
  final List<bool> _isVisible = [true, true, true];

  //hide item by index
  void _removeItem(int index) {
    setState(() {
      _isVisible[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int savedCount = _isVisible.where((visible) => visible).length;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: Text(
          "Saved Scholarships",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$savedCount Scholarships Saved",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            _buildSavedCard(
              0,
              "ASEAN Engineering Scholarship",
              "NUS, Singapore",
              "partial",
              "2026-02-14",
            ),
            _buildSavedCard(
              1,
              "ASEAN Engineering Scholarship",
              "NUS, Singapore",
              "partial",
              "2026-02-14",
            ),
            _buildSavedCard(
              2,
              "ASEAN Engineering Scholarship",
              "NUS, Singapore",
              "partial",
              "2026-02-14",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedCard(
    int index,
    String title,
    String location,
    String note,
    String expDate,
  ) {
    if (!_isVisible[index]) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDark,

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _removeItem(index),
                  child: Icon(Icons.favorite, size: 24, color: AppColors.red),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(-4.0, 0), //move icon to left
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: AppColors.hintText,
                  ),
                ),
                const SizedBox(width: 0),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.hintText,

                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  note,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.hintText,

                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.date_range_rounded,
                      color: AppColors.primaryDark,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      expDate,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}