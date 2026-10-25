/// Model data untuk setiap film
class Movie {
  final int id;
  final String title;
  final String genre;
  final int year;
  final String synopsis;
  final String posterIcon; // emoji atau kode ikon untuk representasi poster
  final String backdropColor; // warna latar kartu film (hex string)
  final double rating;

  const Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.year,
    required this.synopsis,
    required this.posterIcon,
    required this.backdropColor,
    required this.rating,
  });
}
