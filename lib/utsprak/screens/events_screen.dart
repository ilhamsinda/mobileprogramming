import 'package:flutter/material.dart';
import '../data/events_data.dart';
import '../models/event_model.dart';
import '../theme/app_theme.dart';
import '../widgets/event_card.dart';
import 'event_detail_screen.dart';

/// Halaman daftar semua acara dengan fitur pencarian dan filter kategori.
class EventsScreen extends StatefulWidget {
  /// Kategori awal untuk pre-filter (opsional, dipanggil dari HomeScreen).
  final String? initialCategory;

  const EventsScreen({super.key, this.initialCategory});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'Semua';

  // Daftar kategori unik dari data dummy + 'Semua'
  late final List<String> _categories;

  @override
  void initState() {
    super.initState();
    // Bangun daftar kategori unik
    final uniqueCategories = dummyEvents
        .map((e) => e.category)
        .toSet()
        .toList()
      ..sort();
    _categories = ['Semua', ...uniqueCategories];

    // Terapkan filter awal jika ada
    if (widget.initialCategory != null &&
        _categories.contains(widget.initialCategory)) {
      _selectedCategory = widget.initialCategory!;
    }

    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Filter acara berdasarkan query pencarian dan kategori yang dipilih.
  List<Event> get _filteredEvents {
    return dummyEvents.where((event) {
      final matchesSearch = _searchQuery.isEmpty ||
          event.title.toLowerCase().contains(_searchQuery) ||
          event.location.toLowerCase().contains(_searchQuery) ||
          event.organizer.toLowerCase().contains(_searchQuery);

      final matchesCategory =
          _selectedCategory == 'Semua' || event.category == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredEvents;

    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Daftar Kegiatan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Search bar ────────────────────────────────────────────────────
          Container(
            color: AppTheme.primaryColor,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: 'Cari nama acara, lokasi, atau penyelenggara...',
                hintStyle: const TextStyle(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppTheme.textSecondary,
                ),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded,
                            color: AppTheme.textSecondary),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),

          // ── Filter kategori ────────────────────────────────────────────────
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  final isSelected = cat == _selectedCategory;
                  final color = cat == 'Semua'
                      ? AppTheme.primaryColor
                      : AppTheme.getCategoryColor(cat);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = cat;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected ? color : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? color
                              : AppTheme.dividerColor,
                        ),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // ── Jumlah hasil ───────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
            child: Row(
              children: [
                Text(
                  '${filtered.length} kegiatan ditemukan',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (_searchQuery.isNotEmpty || _selectedCategory != 'Semua') ...[
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _searchController.clear();
                      setState(() {
                        _selectedCategory = 'Semua';
                      });
                    },
                    child: const Text(
                      'Reset Filter',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // ── Daftar acara ───────────────────────────────────────────────────
          Expanded(
            child: filtered.isEmpty
                ? _EmptyState(
                    message: _searchQuery.isNotEmpty
                        ? 'Tidak ada acara yang cocok\ndengan pencarian "$_searchQuery"'
                        : 'Tidak ada acara\ndi kategori "$_selectedCategory"',
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final event = filtered[index];
                      return EventCard(
                        event: event,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EventDetailScreen(event: event),
                            ),
                          );
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

/// Widget state kosong ketika tidak ada hasil.
class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 72,
              color: AppTheme.primaryColor.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(
                fontSize: 15,
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
