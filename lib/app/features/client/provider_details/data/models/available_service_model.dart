class AvailableServiceModel {
  final String id;
  final String name;
  final String imageUrl;

  const AvailableServiceModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory AvailableServiceModel.fromJson(Map<String, dynamic> json) =>
      AvailableServiceModel(
        id: json['id']?.toString() ?? '',
        name: json['name'] as String? ?? '',
        imageUrl: json['imageUrl'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
      };
}
