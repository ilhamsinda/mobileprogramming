import 'package:flutter/material.dart';
import '../model/movie.dart';

/// Layar detail film — menampilkan informasi lengkap dan fitur favorit
class DetailScreen extends StatefulWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  bool _isFavorite = false;
  late AnimationController _heartController;
  late Animation<double> _heartAnimation;

  @override
  void initState() {
    super.initState();
    _heartController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heartAnimation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(parent: _heartController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  /// Mengubah status favorit dan memicu animasi
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    _heartController.forward().then((_) => _heartController.reverse());
  }

  /// Parse warna hex dari string (misalnya '#1a237e')
  Color _parseColor(String hexColor) {
    final hex = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final Color themeColor = _parseColor(widget.movie.backdropColor);
    final Color lightTheme = themeColor.withValues(alpha: 0.15);

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1A),
      body: CustomScrollView(
        slivers: [
          // ─── SliverAppBar dengan poster besar ───────────────────────
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: const Color(0xFF0F0F1A),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              // Tombol Favorit di AppBar
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: ScaleTransition(
                  scale: _heartAnimation,
                  child: IconButton(
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? Colors.redAccent : Colors.white,
                      size: 28,
                    ),
                    onPressed: _toggleFavorite,
                    tooltip: _isFavorite
                        ? 'Hapus dari Favorit'
                        : 'Tambah ke Favorit',
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      themeColor,
                      themeColor.withValues(alpha: 0.7),
                      const Color(0xFF0F0F1A),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    // Poster / Ikon Film
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: themeColor.withValues(alpha: 0.5),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          widget.movie.posterIcon,
                          style: const TextStyle(fontSize: 64),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Judul Film
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        widget.movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ─── Konten Detail ───────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge Genre dan Tahun
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildBadge(
                        Icons.movie_filter_outlined,
                        widget.movie.genre,
                        themeColor,
                      ),
                      const SizedBox(width: 10),
                      _buildBadge(
                        Icons.calendar_today_outlined,
                        widget.movie.year.toString(),
                        themeColor,
                      ),
                      const SizedBox(width: 10),
                      _buildBadge(
                        Icons.star_rounded,
                        widget.movie.rating.toString(),
                        const Color(0xFFF9A825),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Tombol Favorit Besar
                  GestureDetector(
                    onTap: _toggleFavorite,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        gradient: _isFavorite
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFFe53935),
                                  Color(0xFFb71c1c),
                                ],
                              )
                            : LinearGradient(
                                colors: [
                                  lightTheme,
                                  lightTheme,
                                ],
                              ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _isFavorite
                              ? Colors.transparent
                              : Colors.white.withValues(alpha: 0.15),
                        ),
                        boxShadow: _isFavorite
                            ? [
                                BoxShadow(
                                  color:
                                      Colors.redAccent.withValues(alpha: 0.4),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ]
                            : [],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ScaleTransition(
                            scale: _heartAnimation,
                            child: Icon(
                              _isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_rounded,
                              color: _isFavorite
                                  ? Colors.white
                                  : Colors.white54,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _isFavorite
                                ? '✓  Ditambahkan ke Favorit'
                                : 'Tambahkan ke Favorit',
                            style: TextStyle(
                              color: _isFavorite
                                  ? Colors.white
                                  : Colors.white54,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Judul Sinopsis
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 22,
                        decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Sinopsis',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Teks Sinopsis
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Text(
                      widget.movie.synopsis,
                      style: const TextStyle(
                        color: Color(0xFFBDBDBD),
                        fontSize: 15,
                        height: 1.7,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Info Card
                  _buildInfoCard(themeColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget badge untuk genre, tahun, dan rating
  Widget _buildBadge(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Kartu informasi tambahan film
  Widget _buildInfoCard(Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Informasi Film',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Judul', widget.movie.title),
          _buildInfoRow('Genre', widget.movie.genre),
          _buildInfoRow('Tahun Rilis', widget.movie.year.toString()),
          _buildInfoRow('Rating', '⭐ ${widget.movie.rating}/10'),
          _buildInfoRow(
            'Status Favorit',
            _isFavorite ? '❤️  Favorit' : '🤍  Bukan Favorit',
          ),
        ],
      ),
    );
  }

  /// Baris informasi dengan label dan nilai
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 13,
              ),
            ),
          ),
          const Text(
            ': ',
            style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
