// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
import 'package:scholarship_app/routes/app_routes.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String selectedCategory = 'All';
  int notificationCount = 3; // Number of unread notifications

  List<String> _getCategories(AppLocalizations t) => [
        t.translate('discoverCategoryAll'),
        t.translate('discoverCategoryTechnology'),
        t.translate('discoverCategoryScience'),
        t.translate('discoverCategoryBusiness'),
        t.translate('discoverCategoryArt'),
      ];

  final List<Scholarship> scholarships = [
    Scholarship(
      university: 'Royal University of Phnom Penh',
      educationLevel: 'educationLevelBachelor',
      type: '100%',
      numberOfPlaces: 20,
      studyAt: 'locationPhnomPenh',
      receiptDate: '28-Nov-2025',
      deadline: '14-Apr-2026',
      imageUrl: 'https://i.ibb.co/qN7ZJxK/rupp-logo.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'National University of Management',
      educationLevel: 'educationLevelBachelor',
      type: '100%',
      numberOfPlaces: 10,
      studyAt: 'locationPhnomPenh',
      receiptDate: '28-Nov-2025',
      deadline: '18-Jun-2026',
      imageUrl: 'https://i.ibb.co/9HBm8Yc/num-logo.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'Institute of Technology of Cambodia',
      educationLevel: 'educationLevelBachelor',
      type: '100%',
      numberOfPlaces: 15,
      studyAt: 'locationPhnomPenh',
      receiptDate: '01-Dec-2025',
      deadline: '20-May-2026',
      imageUrl: 'https://i.ibb.co/hY2L3Px/itc-logo.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'Norton University',
      educationLevel: 'educationLevelMaster',
      type: '50%',
      numberOfPlaces: 8,
      studyAt: 'locationPhnomPenh',
      receiptDate: '15-Jan-2026',
      deadline: '30-Apr-2026',
      imageUrl: 'https://i.ibb.co/kBz5YWj/norton-logo.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'Paragon International University',
      educationLevel: 'educationLevelBachelor',
      type: '75%',
      numberOfPlaces: 12,
      studyAt: 'locationPhnomPenh',
      receiptDate: '20-Dec-2025',
      deadline: '10-May-2026',
      imageUrl: 'https://i.ibb.co/Fm7RJTx/paragon-logo.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'Build Bright University',
      educationLevel: 'educationLevelBachelor',
      type: '100%',
      numberOfPlaces: 25,
      studyAt: 'locationSiemReap',
      receiptDate: '05-Jan-2026',
      deadline: '25-May-2026',
      imageUrl: 'https://i.ibb.co/Qr2YqTc/bbu-logo.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'University of Cambodia',
      educationLevel: 'educationLevelMaster',
      type: '100%',
      numberOfPlaces: 5,
      studyAt: 'locationPhnomPenh',
      receiptDate: '10-Dec-2025',
      deadline: '15-Apr-2026',
      imageUrl: 'https://i.ibb.co/3y8JCKm/uc-logo.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'Cambodia University of Specialties',
      educationLevel: 'educationLevelBachelor',
      type: '60%',
      numberOfPlaces: 18,
      studyAt: 'locationPhnomPenh',
      receiptDate: '25-Nov-2025',
      deadline: '05-Jun-2026',
      imageUrl: 'https://i.ibb.co/K7gwPjy/cus-logo.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'Zaman University',
      educationLevel: 'educationLevelBachelor',
      type: '80%',
      numberOfPlaces: 20,
      studyAt: 'locationPhnomPenh',
      receiptDate: '12-Jan-2026',
      deadline: '28-May-2026',
      imageUrl: 'https://i.ibb.co/7NSrYvp/zaman-logo.png',
      isFavorite: false,
    ),
    Scholarship(
      university: 'Western University',
      educationLevel: 'educationLevelMaster',
      type: '100%',
      numberOfPlaces: 7,
      studyAt: 'locationBattambang',
      receiptDate: '18-Dec-2025',
      deadline: '22-Apr-2026',
      imageUrl: 'https://i.ibb.co/WpJmN5k/western-logo.png',
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerHighest,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: colorScheme.surface,
          surfaceTintColor: colorScheme.surface,
          elevation: 0,
          titleSpacing: 20,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.onSurface.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          title: Row(
            children: [
              // Logo/Icon
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.school_outlined,
                  color: colorScheme.onPrimary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              // Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      t.translate('discoverTitle'),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      t.translate('discoverSubtitle'),
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            // Notification Icon with Badge
            Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: colorScheme.onSurface,
                      size: 22,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.notificationScreen);
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
                if (notificationCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colorScheme.error,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colorScheme.surface,
                          width: 2,
                        ),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Center(
                        child: Text(
                          notificationCount > 9 ? '9+' : '$notificationCount',
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.onSurface.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorScheme.outlineVariant,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        style: TextStyle(color: colorScheme.onSurface),
                        decoration: InputDecoration(
                          hintText: t.translate('discoverSearchHint'),
                          hintStyle: TextStyle(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: colorScheme.primary,
                            size: 22,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary,
                          colorScheme.primary.withOpacity(0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.tune,
                        color: colorScheme.onPrimary,
                        size: 22,
                      ),
                      onPressed: () {
                        // Open filter dialog
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Categories
            Container(
              color: colorScheme.surface,
              padding: const EdgeInsets.only(top: 16, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          t.translate('discoverCategoriesTitle'),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          t.translate('discoverCategoriesSeeAll'),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: _getCategories(t).map((category) {
                        final isSelected = category == selectedCategory;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                gradient: isSelected
                                    ? LinearGradient(
                                        colors: [
                                          colorScheme.primary,
                                          colorScheme.primary.withOpacity(0.8),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                    : null,
                                color: isSelected
                                    ? null
                                    : colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: isSelected
                                      ? colorScheme.primary
                                      : colorScheme.outlineVariant,
                                  width: isSelected ? 2 : 1,
                                ),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: colorScheme.primary
                                              .withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Text(
                                category,
                                style: TextStyle(
                                  color: isSelected
                                      ? colorScheme.onPrimary
                                      : colorScheme.onSurface,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Scholarships List Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Row(
                children: [
                  Text(
                    t.translate('discoverAvailableTitle'),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${scholarships.length} ${t.translate('discoverFoundCount')}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Scholarships List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
          ],
        ),
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
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () =>
          Navigator.pushNamed(context, AppRoutes.scholarshipDetailScreen),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSurface.withOpacity(0.05),
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
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              scholarship.imageUrl,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                    strokeWidth: 2,
                                    color: colorScheme.primary,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: colorScheme.primary.withOpacity(0.1),
                                  child: Icon(
                                    Icons.school,
                                    color: colorScheme.primary,
                                    size: 24,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            scholarship.university,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
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
                          ? colorScheme.error
                          : colorScheme.outline,
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
                label: AppLocalizations.of(context)
                    .translate('discoverEducationLevel'),
                value: AppLocalizations.of(context)
                    .translate(scholarship.educationLevel),
              ),
              const SizedBox(height: 12),

              // Type
              _buildInfoRow(
                context,
                icon: Icons.info_outline,
                label: AppLocalizations.of(context).translate('discoverType'),
                value: scholarship.type,
              ),
              const SizedBox(height: 12),

              // Number of Places
              _buildInfoRow(
                context,
                icon: Icons.check_circle_outline,
                label: AppLocalizations.of(context)
                    .translate('discoverNumberOfPlaces'),
                value: scholarship.numberOfPlaces.toString(),
              ),
              const SizedBox(height: 12),

              // Study At
              _buildInfoRow(
                context,
                icon: Icons.location_on_outlined,
                label:
                    AppLocalizations.of(context).translate('discoverStudyAt'),
                value:
                    AppLocalizations.of(context).translate(scholarship.studyAt),
              ),
              const SizedBox(height: 12),

              // Receipt Date
              _buildInfoRow(
                context,
                icon: Icons.calendar_today_outlined,
                label: AppLocalizations.of(context)
                    .translate('discoverReceiptDate'),
                value: scholarship.receiptDate,
              ),
              const SizedBox(height: 12),

              // Deadline
              _buildInfoRow(
                context,
                icon: Icons.access_time_outlined,
                label:
                    AppLocalizations.of(context).translate('discoverDeadline'),
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
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, size: 20, color: colorScheme.primary),
        const SizedBox(width: 12),
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(fontSize: 13, color: colorScheme.onSurfaceVariant),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
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
  final String imageUrl;
  bool isFavorite;

  Scholarship({
    required this.university,
    required this.educationLevel,
    required this.type,
    required this.numberOfPlaces,
    required this.studyAt,
    required this.receiptDate,
    required this.deadline,
    required this.imageUrl,
    required this.isFavorite,
  });
}
