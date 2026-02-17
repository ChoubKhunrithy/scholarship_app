import 'package:flutter/material.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List<String> _recentSearches = [
    'Computer Science',
    'Engineering',
    'Business',
  ];

  final List<String> _popularSearches = [
    'STEM',
    'Medical',
    'Full Scholarship',
    'USA',
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ── Blue Header ──────────────────────────────────────────────────
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff2196F3),
              borderRadius: BorderRadius.only(
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
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          'Scholarship Finder',
                          style: TextStyle(
                            color: Colors.white,
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: _searchController,
                              focusNode: _focusNode,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: 'Search by major, country, University',
                                hintStyle: const TextStyle(
                                  color: Color(0xffBDBDBD),
                                  fontSize: 13,
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Color(0xff9E9E9E),
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 13),
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
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            child: const Icon(
                              Icons.tune_rounded,
                              color: Colors.white,
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
                  const Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff212121),
                    ),
                  ),
                  const SizedBox(height: 8),

                  ...List.generate(_recentSearches.length, (i) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => _onRecentTap(_recentSearches[i]),
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: Color(0xff9E9E9E),
                                  size: 18,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    _recentSearches[i],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff424242),
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xffBDBDBD),
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (i < _recentSearches.length - 1)
                          const Divider(height: 1, color: Color(0xffF5F5F5)),
                      ],
                    );
                  }),

                  const SizedBox(height: 24),

                  // ── Popular Searches ──────────────────────────────────────
                  const Text(
                    'Popular Searches',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff212121),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _popularSearches.map((tag) {
                      return GestureDetector(
                        onTap: () => _onPopularTap(tag),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xffE3F2FD),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xff90CAF9),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1976D2),
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

  final List<String> _countries = [
    'United States', 'United Kingdom', 'Japan', 'Australia', 'Singapore'
  ];
  final List<String> _types = [
    'Full Scholarship', 'Partial Scholarship', 'Tuition Only'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40, height: 4,
              decoration: BoxDecoration(
                color: const Color(0xffE0E0E0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text('Filter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 20),

          // Country
          const Text('Country',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,
                  color: Color(0xff757575))),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: _countries.map((c) {
              final selected = _selectedCountry == c;
              return GestureDetector(
                onTap: () => setState(() =>
                    _selectedCountry = selected ? null : c),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xff2196F3) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selected ? const Color(0xff2196F3) : const Color(0xffE0E0E0),
                    ),
                  ),
                  child: Text(c,
                      style: TextStyle(
                        fontSize: 13,
                        color: selected ? Colors.white : const Color(0xff424242),
                        fontWeight: FontWeight.w500,
                      )),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Type
          const Text('Scholarship Type',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,
                  color: Color(0xff757575))),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: _types.map((t) {
              final selected = _selectedType == t;
              return GestureDetector(
                onTap: () => setState(() =>
                    _selectedType = selected ? null : t),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xff2196F3) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selected ? const Color(0xff2196F3) : const Color(0xffE0E0E0),
                    ),
                  ),
                  child: Text(t,
                      style: TextStyle(
                        fontSize: 13,
                        color: selected ? Colors.white : const Color(0xff424242),
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
                backgroundColor: const Color(0xff2196F3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Text('Apply Filters',
                  style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white,
                  )),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 8),
        ],
      ),
    );
  }
}
