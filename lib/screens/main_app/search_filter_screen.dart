// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<String> _getRecentSearches(AppLocalizations t) => [
        t.translate('searchRecentCS'),
        t.translate('searchRecentEngineering'),
        t.translate('searchRecentBusiness'),
      ];

  List<String> _getPopularSearches(AppLocalizations t) => [
        t.translate('searchPopularSTEM'),
        t.translate('searchPopularMedical'),
        t.translate('searchPopularFullScholarship'),
        t.translate('searchPopularUSA'),
      ];

  void _onRecentTap(String query) {
    _searchController.text = query;
    _focusNode.requestFocus();
  }

  void _onPopularTap(String query) {
    _searchController.text = query;
    _focusNode.requestFocus();
  }

  void _openFilter() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _FilterSheet(),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Column(
        children: [
          // ── Blue Header ──────────────────────────────────────────────────
          Container(
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back + Title
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: colorScheme.onPrimary,
                            size: 20,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          t.translate('searchTitle'),
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Search Bar
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 46,
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: _searchController,
                              focusNode: _focusNode,
                              autofocus: true,
                              style: TextStyle(color: colorScheme.onSurface),
                              decoration: InputDecoration(
                                hintText: t.translate('searchHint'),
                                hintStyle: TextStyle(
                                  color: colorScheme.outline,
                                  fontSize: 13,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: colorScheme.onSurfaceVariant,
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 13),
                              ),
                              onSubmitted: (val) {
                                if (val.isNotEmpty) {
                                  Navigator.pop(context, val);
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Filter Button
                        GestureDetector(
                          onTap: _openFilter,
                          child: Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: colorScheme.onPrimary.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      colorScheme.onPrimary.withOpacity(0.5)),
                            ),
                            child: Icon(
                              Icons.tune_rounded,
                              color: colorScheme.onPrimary,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Body ─────────────────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // ── Recent Searches ───────────────────────────────────────
                  Text(
                    t.translate('searchRecentTitle'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),

                  ...List.generate(_getRecentSearches(t).length, (i) {
                    final recentSearches = _getRecentSearches(t);
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => _onRecentTap(recentSearches[i]),
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: colorScheme.onSurfaceVariant,
                                  size: 18,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    recentSearches[i],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: colorScheme.outline,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (i < recentSearches.length - 1)
                          Divider(height: 1, color: colorScheme.outlineVariant),
                      ],
                    );
                  }),

                  const SizedBox(height: 24),

                  // ── Popular Searches ──────────────────────────────────────
                  Text(
                    t.translate('searchPopularTitle'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _getPopularSearches(t).map((tag) {
                      return GestureDetector(
                        onTap: () => _onPopularTap(tag),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: colorScheme.primary.withOpacity(0.4),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Filter Bottom Sheet ───────────────────────────────────────────────────────

class _FilterSheet extends StatefulWidget {
  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  String? _selectedCountry;
  String? _selectedType;

  List<String> _getCountries(AppLocalizations t) => [
        t.translate('filterCountryUnitedStates'),
        t.translate('filterCountryUnitedKingdom'),
        t.translate('filterCountryJapan'),
        t.translate('filterCountryAustralia'),
        t.translate('filterCountrySingapore'),
      ];
  List<String> _getTypes(AppLocalizations t) => [
        t.translate('filterTypeFullScholarship'),
        t.translate('filterTypePartialScholarship'),
        t.translate('filterTypeTuitionOnly'),
      ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outline,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text(t.translate('searchFilterTitle'),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface)),
          const SizedBox(height: 20),

          // Country
          Text(t.translate('searchCountryLabel'),
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurfaceVariant)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _getCountries(t).map((c) {
              final selected = _selectedCountry == c;
              return GestureDetector(
                onTap: () =>
                    setState(() => _selectedCountry = selected ? null : c),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected ? colorScheme.primary : colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color:
                          selected ? colorScheme.primary : colorScheme.outline,
                    ),
                  ),
                  child: Text(c,
                      style: TextStyle(
                        fontSize: 13,
                        color: selected
                            ? colorScheme.onPrimary
                            : colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Type
          Text(t.translate('searchScholarshipTypeLabel'),
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurfaceVariant)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _getTypes(t).map((typ) {
              final selected = _selectedType == typ;
              return GestureDetector(
                onTap: () =>
                    setState(() => _selectedType = selected ? null : typ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected ? colorScheme.primary : colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color:
                          selected ? colorScheme.primary : colorScheme.outline,
                    ),
                  ),
                  child: Text(typ,
                      style: TextStyle(
                        fontSize: 13,
                        color: selected
                            ? colorScheme.onPrimary
                            : colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 28),

          // Apply Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'country': _selectedCountry,
                  'type': _selectedType,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text(t.translate('searchApplyFiltersButton'),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onPrimary,
                  )),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 8),
        ],
      ),
    );
  }
}
