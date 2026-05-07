import 'package:bookly_x_client/app/features/client/home/data/models/category_model.dart';

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
      };
}
