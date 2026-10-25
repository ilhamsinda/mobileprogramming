/// Model data untuk Acara/Kegiatan mahasiswa.
/// Dirancang agar mudah dikembangkan untuk integrasi JSON/API di masa depan.
class Event {
  final String id;
  final String title;
  final String category;
  final String date;
  final String time;
  final String location;
  final String description;
  final String organizer;

  const Event({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.organizer,
  });

  /// Factory constructor untuk membuat Event dari Map (JSON-ready).
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      organizer: json['organizer'] as String,
    );
  }

  /// Mengubah Event ke Map (JSON-ready).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'date': date,
      'time': time,
      'location': location,
      'description': description,
      'organizer': organizer,
    };
  }
}
