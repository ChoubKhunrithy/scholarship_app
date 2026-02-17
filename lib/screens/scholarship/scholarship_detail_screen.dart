// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:scholarship_app/constants/app_colors.dart';

class ScholarshipDetailScreen extends StatefulWidget {
  const ScholarshipDetailScreen({super.key});

  @override
  State<ScholarshipDetailScreen> createState() => _ScholarshipDetailScreenState();
}

class _ScholarshipDetailScreenState extends State<ScholarshipDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Scholarship Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderImage(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Scholarship for Computer Science',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: AppColors.grey),
                        SizedBox(width: 6),
                        Text(
                          'RUPP, Cambodia',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textLight
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildDeadlineCard(context),
                    const SizedBox(height: 16),
                    _buildSectionTitle(context, 'About this scholarship'),
                    SizedBox(height: 6),
                    Text(
                      'This prestigious scholarship offers full tuition coverage, accommodation, '
                      'and a monthly stipend for outstanding students pursuing Computer Science at MIT. '
                      'The program includes mentorship opportunities and research funding.',
                      style: TextStyle(
                        height: 1.4,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildSectionTitle(context, 'Scholarship Benefits'),
                    SizedBox(height: 8),
                    _buildRequirementBullet('- Tuition'),
                    _buildRequirementBullet('- Monthly allowance'),
                    _buildRequirementBullet('- Research support'),
                    _buildRequirementBullet('- Printing costs'),
                    SizedBox(height: 16),
                    _buildSectionTitle(context, 'Eligibility Requirements'),
                    SizedBox(height: 8),
                    _buildRequirementBullet('- GPA of 3.5 or higher'),
                    _buildRequirementBullet('- TOEFL score: 100+ or IELTS: 7.0+'),
                    _buildRequirementBullet('- Strong background in Mathematics'),
                    _buildRequirementBullet('- Personal statement and recommendation letters'),
                    const SizedBox(height: 16),
                    _buildSectionTitle(context, 'Required Documents'),
                    SizedBox(height: 10),
                    _buildStepItem(
                      number: 1,
                      text: 'Create an account on MIT scholarship portal',
                    ),
                    const SizedBox(height: 8),
                    _buildStepItem(
                      number: 2,
                      text: 'Fill in personal information form',
                    ),
                    const SizedBox(height: 8),
                    _buildStepItem(
                      number: 3,
                      text: 'Upload required documents',
                    ),
                    const SizedBox(height: 8),
                    _buildStepItem(
                      number: 4,
                      text: 'Submit application before deadline',
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Apply',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return ClipRRect(
      // borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/images/detail_rupp.png',
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDeadlineCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.divider.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, size: 18, color: AppColors.red),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Application Deadline',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'March-15-2026',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            '60 day remaining',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildRequirementBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _buildStepItem({required int number, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$number',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }
}
