import 'package:flutter/material.dart';

// ── Model ─────────────────────────────────────────────────────────────────────

class ScholarshipResult {
  final String title;
  final String university;
  final String location;
  final String type;
  final String deadline;

  const ScholarshipResult({
    required this.title,
    required this.university,
    required this.location,
    required this.type,
    required this.deadline,
  });
}

// ── Screen ────────────────────────────────────────────────────────────────────

class FilterResultScreen extends StatefulWidget {
  const FilterResultScreen({super.key});

  @override
  State<FilterResultScreen> createState() => _FilterResultScreenState();
}

class _FilterResultScreenState extends State<FilterResultScreen> {
  // Active filter chips
  List<String> _activeFilters = [
    'Computer Science',
    'United State',
    'Full Scholarships',
  ];

  // Mock scholarship data
  final List<ScholarshipResult> _allResults = const [
    ScholarshipResult(
      title: 'ASEAN Engineering Scholarship',
      university: 'MIT',
      location: 'United State',
      type: 'Full Scholarship',
      deadline: '2026-02-14',
    ),
    ScholarshipResult(
      title: 'ASEAN Engineering Scholarship',
      university: 'Stanford',
      location: 'USA',
      type: 'Full Scholarship',
      deadline: '2026-02-14',
    ),
  ];

  List<ScholarshipResult> get _filteredResults => _allResults;

  void _removeFilter(String filter) {
    setState(() => _activeFilters.remove(filter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── App Bar ───────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff212121),
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Search Result',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff212121),
                    ),
                  ),
                ],
              ),
            ),

            // ── Active Filter Chips ───────────────────────────────────────
            if (_activeFilters.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _activeFilters.map((filter) {
                    return _FilterChip(
                      label: filter,
                      onRemove: () => _removeFilter(filter),
                    );
                  }).toList(),
                ),
              ),

            const SizedBox(height: 16),

            // ── Divider + Count ───────────────────────────────────────────
            const Divider(height: 1, color: Color(0xffE0E0E0)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                'Found ${_filteredResults.length} Scholarship${_filteredResults.length != 1 ? 's' : ''}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff757575),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(height: 1, color: Color(0xffE0E0E0)),

            // ── Results List ──────────────────────────────────────────────
            Expanded(
              child: _filteredResults.isEmpty
                  ? _EmptyState()
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: _filteredResults.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 12),
                      itemBuilder: (_, i) =>
                          _ScholarshipCard(item: _filteredResults[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Filter Chip Widget ────────────────────────────────────────────────────────

class _FilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _FilterChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xff2196F3),
          width: 1.5,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xff2196F3),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close,
              size: 14,
              color: Color(0xff2196F3),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Scholarship Card ──────────────────────────────────────────────────────────

class _ScholarshipCard extends StatelessWidget {
  final ScholarshipResult item;

  const _ScholarshipCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xff212121),
            ),
          ),
          const SizedBox(height: 6),

          // University + Location
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Color(0xff9E9E9E),
              ),
              const SizedBox(width: 4),
              Text(
                '${item.university}, ${item.location}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff757575),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Type + Deadline
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Type badge
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xffE3F2FD),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  item.type,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff1976D2),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Deadline
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 14,
                    color: Color(0xffFF9800),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    item.deadline,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xffFF9800),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Empty State ───────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded,
              size: 72, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text(
            'No Results Found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff424242),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Try adjusting your filters\nor search with different keywords',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xff9E9E9E)),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xff2196F3)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(
                  horizontal: 28, vertical: 12),
            ),
            child: const Text(
              'New Search',
              style: TextStyle(
                color: Color(0xff2196F3),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
