// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';

class SavedScholarshipScreen extends StatefulWidget {
  const SavedScholarshipScreen({super.key});

  @override
  State<SavedScholarshipScreen> createState() => _SavedScholarshipScreenState();
}

class _SavedScholarshipScreenState extends State<SavedScholarshipScreen> {
  final List<SavedScholarship> _scholarships = [
    SavedScholarship(
      id: 1,
      titleKey: 'savedMockTitle1',
      institutionKey: 'savedMockInst1',
      countryKey: 'savedMockCountry1',
      typeKey: 'savedMockType1',
      deadline: '2026-04-15',
      amount: '\$50,000/year',
      isVisible: true,
    ),
    SavedScholarship(
      id: 2,
      titleKey: 'savedMockTitle2',
      institutionKey: 'savedMockInst2',
      countryKey: 'savedMockCountry2',
      typeKey: 'savedMockType2',
      deadline: '2026-03-20',
      amount: '\$30,000/year',
      isVisible: true,
    ),
    SavedScholarship(
      id: 3,
      titleKey: 'savedMockTitle3',
      institutionKey: 'savedMockInst3',
      countryKey: 'savedMockCountry3',
      typeKey: 'savedMockType3',
      deadline: '2026-05-10',
      amount: '\$45,000/year',
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
        content: Text(AppLocalizations.of(context).translate('savedRemoved')),
        action: SnackBarAction(
          label: AppLocalizations.of(context).translate('savedUndo'),
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
        _scholarships.sort((a, b) => a.titleKey.compareTo(b.titleKey));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);
    final visibleScholarships =
        _scholarships.where((s) => s.isVisible).toList();
    final savedCount = visibleScholarships.length;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surface,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: colorScheme.onSurface, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          t.translate('savedTitle'),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.sort, color: colorScheme.onSurface),
            onSelected: _sortScholarships,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'deadline',
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 18),
                    SizedBox(width: 12),
                    Text(t.translate('savedSortByDeadline')),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'name',
                child: Row(
                  children: [
                    Icon(Icons.sort_by_alpha, size: 18),
                    SizedBox(width: 12),
                    Text(t.translate('savedSortByName')),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: savedCount == 0
          ? _buildEmptyState(colorScheme)
          : Column(
              children: [
                _buildHeader(savedCount, colorScheme),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: visibleScholarships.length,
                    itemBuilder: (context, index) {
                      return _buildScholarshipCard(
                          visibleScholarships[index], colorScheme, t);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildHeader(int count, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: colorScheme.surface,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.bookmark,
                  size: 16,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  "$count ${AppLocalizations.of(context).translate('savedCount')}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipCard(SavedScholarship scholarship,
      ColorScheme colorScheme, AppLocalizations t) {
    final daysUntilDeadline =
        DateTime.parse(scholarship.deadline).difference(DateTime.now()).inDays;
    final isUrgent = daysUntilDeadline <= 7;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withOpacity(0.04),
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
                            t.translate(scholarship.titleKey),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.school_outlined,
                                size: 16,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  t.translate(scholarship.institutionKey),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: colorScheme.onSurfaceVariant,
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
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                t.translate(scholarship.countryKey),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: colorScheme.onSurfaceVariant,
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
                        color: colorScheme.primary,
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
                      t.translate(scholarship.typeKey),
                      scholarship.typeKey == 'savedMockType1' ||
                              scholarship.typeKey == 'savedMockType3'
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFFF9800),
                      Icons.card_giftcard,
                    ),
                    _buildInfoChip(
                      scholarship.amount,
                      colorScheme.primary,
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
                        : colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.event_outlined,
                        size: 16,
                        color: isUrgent
                            ? const Color(0xFFD32F2F)
                            : colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${t.translate('savedDeadline')} ${_formatDate(scholarship.deadline, t)}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isUrgent
                              ? const Color(0xFFD32F2F)
                              : colorScheme.onSurface,
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
                            "$daysUntilDeadline${AppLocalizations.of(context).translate('savedDaysLeft')}",
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

  Widget _buildEmptyState(ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.bookmark_border,
              size: 60,
              color: colorScheme.outline,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context).translate('savedEmpty'),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              AppLocalizations.of(context).translate('savedEmptyMessage'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.explore),
            label: Text(
                AppLocalizations.of(context).translate('savedExploreButton')),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
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

  String _formatDate(String dateString, AppLocalizations t) {
    final date = DateTime.parse(dateString);
    final months = [
      t.translate('monthJan'),
      t.translate('monthFeb'),
      t.translate('monthMar'),
      t.translate('monthApr'),
      t.translate('monthMay'),
      t.translate('monthJun'),
      t.translate('monthJul'),
      t.translate('monthAug'),
      t.translate('monthSep'),
      t.translate('monthOct'),
      t.translate('monthNov'),
      t.translate('monthDec'),
    ];
    return "${months[date.month - 1]} ${date.day}, ${date.year}";
  }
}

class SavedScholarship {
  final int id;
  final String titleKey;
  final String institutionKey;
  final String countryKey;
  final String typeKey;
  final String deadline;
  final String amount;
  bool isVisible;

  SavedScholarship({
    required this.id,
    required this.titleKey,
    required this.institutionKey,
    required this.countryKey,
    required this.typeKey,
    required this.deadline,
    required this.amount,
    this.isVisible = true,
  });
}
