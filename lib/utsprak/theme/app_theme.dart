import 'package:flutter/material.dart';

/// Tema utama aplikasi KampusKita.
/// Menggunakan Material Design 3 dengan warna utama ungu #6C4AB6.
class AppTheme {
  AppTheme._(); // Mencegah instansiasi

  // ── Palet Warna ────────────────────────────────────────────────────────────
  static const Color primaryColor = Color(0xFF6C4AB6);
  static const Color primaryLight = Color(0xFF9B79E0);
  static const Color primaryDark = Color(0xFF4A2E8E);
  static const Color accentColor = Color(0xFFFF7043);
  static const Color surfaceColor = Color(0xFFF5F3FF);
  static const Color cardColor = Colors.white;
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B6B8A);
  static const Color dividerColor = Color(0xFFE8E4F3);
  static const Color successColor = Color(0xFF4CAF50);

  // ── Kategori Warna ─────────────────────────────────────────────────────────
  static const Map<String, Color> categoryColors = {
    'Seminar': Color(0xFF5C6BC0),
    'Workshop': Color(0xFF26A69A),
    'Kompetisi': Color(0xFFEF5350),
    'Budaya': Color(0xFFAB47BC),
    'Olahraga': Color(0xFF42A5F5),
    'Karir': Color(0xFFFF7043),
    'Pengembangan Diri': Color(0xFF66BB6A),
    'Teknologi': Color(0xFF5C6BC0),
    'Eksekutif': Color(0xFF6C4AB6),
    'Himpunan': Color(0xFF26A69A),
    'Seni & Budaya': Color(0xFFAB47BC),
    'Riset & Inovasi': Color(0xFFFF7043),
  };

  static Color getCategoryColor(String category) {
    return categoryColors[category] ?? primaryColor;
  }

  // ── Ikon Kategori ──────────────────────────────────────────────────────────
  static const Map<String, IconData> categoryIcons = {
    'Seminar': Icons.mic_rounded,
    'Workshop': Icons.build_rounded,
    'Kompetisi': Icons.emoji_events_rounded,
    'Budaya': Icons.theater_comedy_rounded,
    'Olahraga': Icons.sports_soccer_rounded,
    'Karir': Icons.work_rounded,
    'Pengembangan Diri': Icons.psychology_rounded,
    'Teknologi': Icons.computer_rounded,
    'Eksekutif': Icons.account_balance_rounded,
    'Himpunan': Icons.groups_rounded,
    'Seni & Budaya': Icons.palette_rounded,
    'Riset & Inovasi': Icons.science_rounded,
  };

  static IconData getCategoryIcon(String category) {
    return categoryIcons[category] ?? Icons.event_rounded;
  }

  // ── ThemeData ──────────────────────────────────────────────────────────────
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        primary: primaryColor,
        surface: surfaceColor,
      ),
      scaffoldBackgroundColor: surfaceColor,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 2,
        shadowColor: primaryColor.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: dividerColor),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
    );
  }
}
