class LocationModel {
  final double lat;
  final double lng;

  const LocationModel({
    required this.lat,
    required this.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}

class DiscoveryBranchModel {
  final int id;
  final String name;
  final double rating;
  final int totalReviews;
  final String? profileImage;
  final List<String> topServiceCategories;
  final LocationModel location;
  final double distance;

  const DiscoveryBranchModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.totalReviews,
    this.profileImage,
    required this.topServiceCategories,
    required this.location,
    required this.distance,
  });

  factory DiscoveryBranchModel.fromJson(Map<String, dynamic> json) {
    return DiscoveryBranchModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      totalReviews: (json['total_reviews'] as num?)?.toInt() ?? 0,
      profileImage: json['profile_image'] as String?,
      topServiceCategories: (json['top_service_categories'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      location: LocationModel.fromJson(
          json['location'] as Map<String, dynamic>? ?? {}),
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() => name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rating': rating,
        'total_reviews': totalReviews,
        'profile_image': profileImage,
        'top_service_categories': topServiceCategories,
        'location': location.toJson(),
        'distance': distance,
      };
}
