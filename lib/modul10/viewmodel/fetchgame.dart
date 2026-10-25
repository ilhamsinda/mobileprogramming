import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/game.dart';

/// Mengambil daftar game dari API FreeToGame
Future<List<Game>> fetchGames() async {
  final response = await http.get(
    Uri.parse('https://www.freetogame.com/api/games'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Game.fromJson(json)).toList();
  } else {
    throw Exception('Gagal mengambil data game');
  }
}

/// Mengambil detail game berdasarkan ID dari API FreeToGame
Future<Map<String, dynamic>> fetchDataFromAPI(int idGame) async {
  final response = await http.get(
    Uri.parse('https://www.freetogame.com/api/game?id=$idGame'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Gagal mengambil detail game dengan id $idGame');
  }
}
