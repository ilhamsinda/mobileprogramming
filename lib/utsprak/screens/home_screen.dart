import 'package:flutter/material.dart';
import '../data/events_data.dart';
import '../theme/app_theme.dart';
import '../widgets/event_card.dart';
import 'events_screen.dart';
import 'event_detail_screen.dart';
import 'organizations_screen.dart';

/// Halaman beranda KampusKita.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Kategori yang ditampilkan di bagian quick filter
  static const List<Map<String, dynamic>> _categories = [
    {'label': 'Seminar', 'icon': Icons.mic_rounded},
    {'label': 'Workshop', 'icon': Icons.build_rounded},
    {'label': 'Kompetisi', 'icon': Icons.emoji_events_rounded},
    {'label': 'Budaya', 'icon': Icons.theater_comedy_rounded},
    {'label': 'Olahraga', 'icon': Icons.sports_soccer_rounded},
    {'label': 'Karir', 'icon': Icons.work_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    // Ambil 3 acara pertama sebagai featured events
    final featuredEvents = dummyEvents.take(3).toList();

    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ── AppBar ──────────────────────────────────────────────────────
            SliverAppBar(
              expandedHeight: 180,
              pinned: true,
              backgroundColor: AppTheme.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.primaryDark,
                        AppTheme.primaryColor,
                        AppTheme.primaryLight,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Logo & nama app
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.school_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'KampusKita',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Sapaan pengguna
                        const Text(
                          'Halo, Mahasiswa! 👋',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Temukan kegiatan & organisasi kampusmu',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ── Body konten ─────────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Kartu statistik ringkas ──────────────────────────────
                    Row(
                      children: [
                        _StatCard(
                          icon: Icons.event_rounded,
                          label: 'Total Acara',
                          value: '${dummyEvents.length}',
                          color: AppTheme.primaryColor,
                        ),
                        const SizedBox(width: 12),
                        const _StatCard(
                          icon: Icons.groups_rounded,
                          label: 'Organisasi',
                          value: '6',
                          color: AppTheme.accentColor,
                        ),
                        const SizedBox(width: 12),
                        const _StatCard(
                          icon: Icons.calendar_month_rounded,
                          label: 'Bulan Ini',
                          value: '5',
                          color: Color(0xFF26A69A),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // ── Kategori cepat ────────────────────────────────────────
                    const _SectionHeader(title: 'Kategori Kegiatan'),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 90,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final cat = _categories[index];
                          final color =
                              AppTheme.getCategoryColor(cat['label'] as String);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EventsScreen(
                                    initialCategory:
                                        cat['label'] as String,
                                  ),
                                ),
                              );
                            },
                            child: _CategoryChip(
                              label: cat['label'] as String,
                              icon: cat['icon'] as IconData,
                              color: color,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 28),

                    // ── Akses cepat ───────────────────────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: _QuickAccessButton(
                            icon: Icons.event_note_rounded,
                            label: 'Semua Acara',
                            subtitle: '${dummyEvents.length} kegiatan',
                            color: AppTheme.primaryColor,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventsScreen(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _QuickAccessButton(
                            icon: Icons.account_balance_rounded,
                            label: 'Organisasi',
                            subtitle: '6 organisasi',
                            color: AppTheme.accentColor,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const OrganizationsScreen(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // ── Acara pilihan ─────────────────────────────────────────
                    Row(
                      children: [
                        const _SectionHeader(title: 'Acara Pilihan'),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EventsScreen(),
                            ),
                          ),
                          child: const Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Daftar EventCard featured
                    ...featuredEvents.map((event) => EventCard(
                          event: event,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    EventDetailScreen(event: event),
                              ),
                            );
                          },
                        )),

                    // Tombol lihat semua acara
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EventsScreen(),
                          ),
                        ),
                        icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                        label: const Text('Lihat Semua Acara'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.primaryColor,
                          side: const BorderSide(color: AppTheme.primaryColor),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Widget Pembantu HomeScreen ───────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: AppTheme.textPrimary,
        letterSpacing: 0.2,
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.15)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _QuickAccessButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuickAccessButton({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              color.withValues(alpha: 0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 26),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
