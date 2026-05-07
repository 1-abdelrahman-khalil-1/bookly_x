class StaffServiceModel {
  final int id;
  final String name;
  final String? description;
  final double price;
  final int durationMinutes;
  final String? imageUrl;

  const StaffServiceModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.durationMinutes,
    this.imageUrl,
  });

  factory StaffServiceModel.fromJson(Map<String, dynamic> json) {
    return StaffServiceModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 0,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'durationMinutes': durationMinutes,
        'imageUrl': imageUrl,
      };
}
