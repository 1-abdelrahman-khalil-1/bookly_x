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
      profileImageUrl: json['profileImageUrl'] as String?,
      staffRole: StaffRole.fromString(json['staffRole']?.toString()),
      age: (json['age'] as num?)?.toInt() ?? 0,
      commissionPercentage:
          (json['commissionPercentage'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? false,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? ''),
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
      professionalProfile: json['professionalProfile'] == null
          ? null
          : ProfessionalProfile.fromJson(
              json['professionalProfile'] as Map<String, dynamic>),
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
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'profileImageUrl': profileImageUrl,
        'staffRole': staffRole.name,
        'age': age,
        'commissionPercentage': commissionPercentage,
        'isActive': isActive,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'branch': branch?.toJson(),
        'professionalProfile': professionalProfile?.toJson(),
        'certificates': certificates.map((e) => e.toJson()).toList(),
        'availabilities': availabilities.map((e) => e.toJson()).toList(),
        'services': services.map((e) => e.toJson()).toList(),
        'reviews': reviews.map((e) => e.toJson()).toList(),
        'averageRating': averageRating,
        'reviewCount': reviewCount,
      };
}
