import 'package:bookly_x_client/app/features/client/provider_details/data/models/available_service_model.dart';
import 'package:bookly_x_client/app/features/client/provider_details/data/models/review_model.dart';

class ProviderDetailModel {
  final String id;
  final String name;
  final String serviceCategory;
  final String coverImageUrl;
  final List<String> galleryUrls;
  final String description;
  final double rating;
  final int reviewCount;
  final String sellerName;
  final String ownerName;
  final String sellerAvatarUrl;
  final bool isVerified;
  final double totalPrice;
  final String currency;
  final List<AvailableServiceModel> services;
  final List<ReviewModel> reviews;

  const ProviderDetailModel({
    required this.id,
    required this.name,
    required this.serviceCategory,
    required this.coverImageUrl,
    required this.galleryUrls,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.sellerName,
    required this.ownerName,
    required this.sellerAvatarUrl,
    required this.isVerified,
    required this.totalPrice,
    required this.currency,
    required this.services,
    required this.reviews,
  });

  factory ProviderDetailModel.fromJson(Map<String, dynamic> json) =>
      ProviderDetailModel(
        id: json['id']?.toString() ?? '',
        name: json['name'] as String? ?? '',
        serviceCategory: json['serviceCategory'] as String? ?? '',
        coverImageUrl: json['coverImageUrl'] as String? ?? '',
        galleryUrls: (json['galleryUrls'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        description: json['description'] as String? ?? '',
        rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
        reviewCount: json['reviewCount'] as int? ?? 0,
        sellerName: json['sellerName'] as String? ?? '',
        ownerName: json['ownerName'] as String? ?? '',
        sellerAvatarUrl: json['sellerAvatarUrl'] as String? ?? '',
        isVerified: json['isVerified'] as bool? ?? false,
        totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
        currency: json['currency'] as String? ?? '',
        services: (json['services'] as List<dynamic>?)
                ?.map((e) =>
                    AvailableServiceModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        reviews: (json['reviews'] as List<dynamic>?)
                ?.map(
                    (e) => ReviewModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'serviceCategory': serviceCategory,
        'coverImageUrl': coverImageUrl,
        'galleryUrls': galleryUrls,
        'description': description,
        'rating': rating,
        'reviewCount': reviewCount,
        'sellerName': sellerName,
        'ownerName': ownerName,
        'sellerAvatarUrl': sellerAvatarUrl,
        'isVerified': isVerified,
        'totalPrice': totalPrice,
        'currency': currency,
        'services': services.map((e) => e.toJson()).toList(),
        'reviews': reviews.map((e) => e.toJson()).toList(),
      };
}
