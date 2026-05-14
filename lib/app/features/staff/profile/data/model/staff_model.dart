import 'branch.dart';
import 'professional_profile.dart';
import 'staff_availability_model.dart';
import 'staff_certificate_model.dart';
import 'staff_review_model.dart';
import 'staff_role_enum.dart';
import 'staff_service_model.dart';

class StaffModel {
  final int id;
  final String? profileImageUrl;
  final StaffRole staffRole;
  final int age;
  final int commissionPercentage;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Branch? branch;
  final ProfessionalProfile? professionalProfile;
  final List<StaffCertificateModel> certificates;
  final List<StaffAvailabilityModel> availabilities;
  final List<StaffServiceModel> services;
  final List<StaffReviewModel> reviews;
  final double averageRating;
  final int reviewCount;

  const StaffModel({
    required this.id,
    this.profileImageUrl,
    required this.staffRole,
    required this.age,
    required this.commissionPercentage,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    required this.branch,
    required this.professionalProfile,
    required this.certificates,
    required this.availabilities,
    required this.services,
    required this.reviews,
    required this.averageRating,
    required this.reviewCount,
  });

  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      profileImageUrl: json['profile_image_url'] as String?,
      staffRole: StaffRole.fromString(json['staff_role']?.toString()),
      age: (json['age'] as num?)?.toInt() ?? 0,
      commissionPercentage:
          (json['commission_percentage'] as num?)?.toInt() ?? 0,
      isActive: json['is_active'] as bool? ?? false,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at']?.toString() ?? ''),
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
      professionalProfile: json['professional_profile'] == null
          ? null
          : ProfessionalProfile.fromJson(
              json['professional_profile'] as Map<String, dynamic>),
      certificates: (json['certificates'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(StaffCertificateModel.fromJson)
          .toList(),
      availabilities: (json['availabilities'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(StaffAvailabilityModel.fromJson)
          .toList(),
      services: (json['services'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(StaffServiceModel.fromJson)
          .toList(),
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(StaffReviewModel.fromJson)
          .toList(),
      averageRating: (json['average_rating'] as num?)?.toDouble() ?? 0,
      reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'profile_image_url': profileImageUrl,
        'staff_role': staffRole.name,
        'age': age,
        'commission_percentage': commissionPercentage,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'branch': branch?.toJson(),
        'professional_profile': professionalProfile?.toJson(),
        'certificates': certificates.map((e) => e.toJson()).toList(),
        'availabilities': availabilities.map((e) => e.toJson()).toList(),
        'services': services.map((e) => e.toJson()).toList(),
        'reviews': reviews.map((e) => e.toJson()).toList(),
        'average_rating': averageRating,
        'review_count': reviewCount,
      };
}
