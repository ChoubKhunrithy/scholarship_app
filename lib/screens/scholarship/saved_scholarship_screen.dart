// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:scholarship_app/constants/app_colors.dart';

class SavedScholarshipScreen extends StatefulWidget {
  const SavedScholarshipScreen({super.key});

  @override
  State<SavedScholarshipScreen> createState() => _SavedScholarshipScreenState();
}

class _SavedScholarshipScreenState extends State<SavedScholarshipScreen> {
  final List<SavedScholarship> _scholarships = [
    SavedScholarship(
      id: 1,
      title: "ASEAN Engineering Scholarship",
      institution: "NUS, Singapore",
      country: "Singapore",
      type: "Full Scholarship",
      deadline: "2026-04-15",
      amount: "\$50,000/year",
      isVisible: true,
    ),
    SavedScholarship(
      id: 2,
      title: "Commonwealth Scholarship",
      institution: "University of Oxford",
      country: "United Kingdom",
      type: "Partial Funding",
      deadline: "2026-03-20",
      amount: "\$30,000/year",
      isVisible: true,
    ),
    SavedScholarship(
      id: 3,
      title: "Asia Pacific Leadership Program",
      institution: "University of Tokyo",
      country: "Japan",
      type: "Full Scholarship",
      deadline: "2026-05-10",
      amount: "\$45,000/year",
      isVisible: true,
    ),
  ];

  void _removeItem(int id) {
    setState(() {
      final scholarship = _scholarships.firstWhere((s) => s.id == id);
      scholarship.isVisible = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Scholarship removed from saved'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              final scholarship = _scholarships.firstWhere((s) => s.id == id);
              scholarship.isVisible = true;
            });
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _sortScholarships(String sortType) {
    setState(() {
      if (sortType == 'deadline') {
        _scholarships.sort((a, b) => a.deadline.compareTo(b.deadline));
      } else if (sortType == 'name') {
        _scholarships.sort((a, b) => a.title.compareTo(b.title));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final visibleScholarships =
        _scholarships.where((s) => s.isVisible).toList();
    final savedCount = visibleScholarships.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Saved Scholarships",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort, color: Colors.black87),
            onSelected: _sortScholarships,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'deadline',
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 18),
                    SizedBox(width: 12),
                    Text('Sort by Deadline'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'name',
                child: Row(
                  children: [
                    Icon(Icons.sort_by_alpha, size: 18),
                    SizedBox(width: 12),
                    Text('Sort by Name'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: savedCount == 0
          ? _buildEmptyState()
          : Column(
              children: [
                _buildHeader(savedCount),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: visibleScholarships.length,
                    itemBuilder: (context, index) {
                      return _buildScholarshipCard(visibleScholarships[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildHeader(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.bookmark,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  "$count Saved",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipCard(SavedScholarship scholarship) {
    final daysUntilDeadline =
        DateTime.parse(scholarship.deadline).difference(DateTime.now()).inDays;
    final isUrgent = daysUntilDeadline <= 7;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Navigate to scholarship details
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            scholarship.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.school_outlined,
                                size: 16,
                                color: Colors.black54,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  scholarship.institution,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 16,
                                color: Colors.black54,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                scholarship.country,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      onPressed: () => _removeItem(scholarship.id),
                      icon: Icon(
                        Icons.bookmark,
                        color: AppColors.primary,
                        size: 26,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInfoChip(
                      scholarship.type,
                      scholarship.type == "Full Scholarship"
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFFF9800),
                      Icons.card_giftcard,
                    ),
                    _buildInfoChip(
                      scholarship.amount,
                      AppColors.primary,
                      Icons.attach_money,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isUrgent
                        ? const Color(0xFFFFEBEE)
                        : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.event_outlined,
                        size: 16,
                        color:
                            isUrgent ? const Color(0xFFD32F2F) : Colors.black54,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Deadline: ${_formatDate(scholarship.deadline)}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isUrgent
                              ? const Color(0xFFD32F2F)
                              : Colors.black87,
                        ),
                      ),
                      if (isUrgent) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD32F2F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${daysUntilDeadline}d left",
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.bookmark_border,
              size: 60,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "No Saved Scholarships",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Start saving scholarships to keep track of opportunities you're interested in",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.explore),
            label: const Text("Explore Scholarships"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return "${months[date.month - 1]} ${date.day}, ${date.year}";
  }
}

class SavedScholarship {
  final int id;
  final String title;
  final String institution;
  final String country;
  final String type;
  final String deadline;
  final String amount;
  bool isVisible;

  SavedScholarship({
    required this.id,
    required this.title,
    required this.institution,
    required this.country,
    required this.type,
    required this.deadline,
    required this.amount,
    this.isVisible = true,
  });
}
