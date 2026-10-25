import 'package:flutter/material.dart';
import '../model/game.dart';
import '../viewmodel/fetchgame.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Game>> gameList;

  @override
  void initState() {
    super.initState();
    loadGames();
  }

  /// Memuat data game dari API
  void loadGames() {
    gameList = fetchGames();
  }

  /// Membuat tampilan Search Bar
  TextField _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Cari game',
        prefixIcon: Icon(
          Icons.search_outlined,
          color: Colors.blue.shade700,
        ),
        filled: true,
        fillColor: Colors.blue.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
      ),
    );
  }

  /// Membuat tampilan satu item game dalam Card
  Card _listItem(String urlCover, String judul, String genre) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            urlCover,
            width: 80,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 80,
              height: 60,
              color: Colors.grey.shade300,
              child: const Icon(Icons.image_not_supported),
            ),
          ),
        ),
        title: Text(
          judul,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          genre,
          style: TextStyle(color: Colors.blue.shade700, fontSize: 12),
        ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text(
          'Flutter Game Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            children: [
              // Header biru
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: _searchBar(),
              ),
              const SizedBox(height: 8),
              // Daftar game
              Expanded(
                child: FutureBuilder<List<Game>>(
                  future: gameList,
                  builder: (context, snapshot) {
                    // Loading
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    // Error
                    if (snapshot.hasError) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Error: ${snapshot.error}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    }
                    // Tidak ada data
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('Tidak ada data game.'),
                      );
                    }
                    // Data tersedia
                    final games = snapshot.data!;
                    final displayCount =
                        games.length > 25 ? 25 : games.length;
                    return ListView.builder(
                      itemCount: displayCount,
                      itemBuilder: (context, index) {
                        final game = games[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: game.id,
                            );
                          },
                          child: _listItem(
                            game.thumbnail,
                            game.title,
                            game.genre,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
