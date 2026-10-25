import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List dataGame = [
    {
      'thumbnail': 'https://via.placeholder.com/150',
      'title': 'Contoh Game 1',
      'genre': 'Action',
      'release_date': '2024-01-01',
    },
    {
      'thumbnail': 'https://via.placeholder.com/150',
      'title': 'Contoh Game 2',
      'genre': 'RPG',
      'release_date': '2024-02-02',
    },
  ];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  Future<void> _ambilData() async {
    try {
      final response = await http
          .get(Uri.parse('https://www.freetogame.com/api/games'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (mounted) {
          setState(() {
            dataGame = data.take(20).toList();
          });
        }
      } else {
        throw Exception('Gagal load data dari FreeToGame API');
      }
    } on TimeoutException {
      debugPrint('Request API timeout, pakai data fallback');
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      debugPrint('Error: $e');
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Demo ListView.builder'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: dataGame.isEmpty ? 1 : dataGame.length,
        itemBuilder: (context, index) {
          if (dataGame.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final item = dataGame[index];
          return _listItem(
            item['thumbnail'] ?? 'https://via.placeholder.com/150',
            item['title'] ?? 'Tidak ada judul',
            item['genre'] ?? 'Tidak ada genre',
            item['release_date'] ?? 'Tidak ada tanggal',
          );
        },
      ),
    );
  }
}

Container _tombolBaca() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Text('Baca Info', style: TextStyle(color: Colors.white)),
  );
}

Container _listItem(String url, String judul, String genre, String rilis) {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            url,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 70,
                height: 70,
                color: Colors.grey[200],
                child: const Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(genre, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 2),
                      Text(rilis, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  _tombolBaca(),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
