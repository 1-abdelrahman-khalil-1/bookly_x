import 'package:bookly_x/app/features/client/home/data/models/category_model.dart';

class ProviderModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final String rating;
  final String earned;
  final String rate;
  final bool verified;
  final CategoryModel category;
  final double? latitude;
  final double? longitude;

  const ProviderModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
    required this.earned,
    required this.rate,
    required this.verified,
    required this.category,
    this.latitude,
    this.longitude,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
        id: json['id']?.toString() ?? '',
        name: json['name'] as String? ?? '',
        image: json['image'] as String? ?? '',
        description: json['description'] as String? ?? '',
        rating: json['rating']?.toString() ?? '0',
        earned: json['earned'] as String? ?? '',
        rate: json['rate'] as String? ?? '',
        verified: json['verified'] as bool? ?? false,
        category: CategoryModel.fromJson(
            json['category'] as Map<String, dynamic>? ?? {}),
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'rating': rating,
        'earned': earned,
        'rate': rate,
        'verified': verified,
        'category': category.toJson(),
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
      };
}
