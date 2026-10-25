import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../model/detailgame.dart';
import '../viewmodel/fetchgame.dart';

class Detail extends StatelessWidget {
  final int gameTerpilih;

  const Detail({
    super.key,
    required this.gameTerpilih,
  });

  /// Mengambil dan mengurai data detail game dari API
  Future<DetailGame> fetchData() async {
    final jsonData = await fetchDataFromAPI(gameTerpilih);
    return DetailGame.fromJson(jsonData);
  }

  /// Membuat satu item screenshot game
  Widget _itemList(String url) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey.shade300,
              child: const Icon(Icons.image_not_supported),
            ),
          ),
        ),
      ),
    );
  }

  /// Membuat satu baris requirement (OS, Processor, dll)
  Widget _requirementRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          const Text(': ', style: TextStyle(fontSize: 13)),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<DetailGame>(
        future: fetchData(),
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Error
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Terjadi kesalahan: ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          // Tidak ada data
          if (!snapshot.hasData) {
            return const Center(child: Text('Data tidak tersedia'));
          }

          final game = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── HEADER: Thumbnail + Tombol Back ──
                SizedBox(
                  height: 300,
                  child: Stack(
                    children: [
                      // Thumbnail
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        child: Image.network(
                          game.thumbnail,
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                      // Tombol back
                      Positioned(
                        top: 40,
                        left: 16,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul & Genre
                      Text(
                        game.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Chip(
                            label: Text(
                              game.genre,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            backgroundColor: Colors.blue.shade700,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(width: 8),
                          Chip(
                            label: Text(
                              game.platform,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            backgroundColor: Colors.green.shade600,
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // ── DESKRIPSI ──
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      ReadMoreText(
                        game.description,
                        trimLines: 2,
                        colorClickableText: Colors.blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' more',
                        trimExpandedText: ' less',
                        style: const TextStyle(fontSize: 14, height: 1.5),
                      ),

                      const SizedBox(height: 16),

                      // ── SCREENSHOT ──
                      if (game.screenshots != null &&
                          game.screenshots!.isNotEmpty) ...[
                        const Text(
                          'Screenshot',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: game.screenshots!
                                .map((s) => _itemList(s.image))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // ── MINIMUM SYSTEM REQUIREMENTS ──
                      if (game.minimumSystemRequirements != null) ...[
                        const Text(
                          'Minimum System Requirements',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _requirementRow(
                                  'OS',
                                  game.minimumSystemRequirements!.os ?? '-',
                                ),
                                _requirementRow(
                                  'Processor',
                                  game.minimumSystemRequirements!.processor ??
                                      '-',
                                ),
                                _requirementRow(
                                  'Memory',
                                  game.minimumSystemRequirements!.memory ?? '-',
                                ),
                                _requirementRow(
                                  'Graphics',
                                  game.minimumSystemRequirements!.graphics ??
                                      '-',
                                ),
                                _requirementRow(
                                  'Storage',
                                  game.minimumSystemRequirements!.storage ?? '-',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Info tambahan
                      const Text(
                        'Informasi Game',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _requirementRow('Developer', game.developer),
                      _requirementRow('Publisher', game.publisher),
                      _requirementRow('Release', game.releaseDate),
                      _requirementRow('Status', game.status),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
