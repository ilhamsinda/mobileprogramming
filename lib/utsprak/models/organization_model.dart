/// Model data untuk Organisasi Mahasiswa.
/// Dirancang agar mudah dikembangkan untuk integrasi JSON/API di masa depan.
class Organization {
  final String id;
  final String name;
  final String category;
  final String description;
  final String memberCount;
  final String founded;

  const Organization({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.memberCount,
    required this.founded,
  });

  /// Factory constructor untuk membuat Organization dari Map (JSON-ready).
  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      memberCount: json['memberCount'] as String,
      founded: json['founded'] as String,
    );
  }

  /// Mengubah Organization ke Map (JSON-ready).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'memberCount': memberCount,
      'founded': founded,
    };
  }
}
