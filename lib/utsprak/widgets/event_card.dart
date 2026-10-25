import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../theme/app_theme.dart';

/// Widget kartu acara yang dapat digunakan kembali (reusable).
/// Digunakan di EventsScreen dan HomeScreen (featured events).
class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  final bool isCompact;

  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final categoryColor = AppTheme.getCategoryColor(event.category);
    final categoryIcon = AppTheme.getCategoryIcon(event.category);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryColor.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header banner dengan warna kategori
            Container(
              height: isCompact ? 6 : 8,
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baris kategori chip dan ikon
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: categoryColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              categoryIcon,
                              size: 13,
                              color: categoryColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              event.category,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: categoryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: AppTheme.textSecondary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Judul acara
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),

                  // Info tanggal, waktu, lokasi
                  _InfoRow(
                    icon: Icons.calendar_today_rounded,
                    text: event.date,
                    color: categoryColor,
                  ),
                  const SizedBox(height: 5),
                  _InfoRow(
                    icon: Icons.access_time_rounded,
                    text: event.time,
                    color: categoryColor,
                  ),
                  const SizedBox(height: 5),
                  _InfoRow(
                    icon: Icons.location_on_rounded,
                    text: event.location,
                    color: categoryColor,
                    maxLines: 2,
                  ),

                  if (!isCompact) ...[
                    const SizedBox(height: 8),
                    _InfoRow(
                      icon: Icons.groups_rounded,
                      text: event.organizer,
                      color: categoryColor,
                      maxLines: 2,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget baris info kecil dengan ikon untuk EventCard.
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final int maxLines;

  const _InfoRow({
    required this.icon,
    required this.text,
    required this.color,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.4,
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
