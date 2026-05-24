import '../enums/reviewer_role_enum.dart';

class StaffReviewModel {
  final int id;
  final double rating;
  final String comment;
  final DateTime? createdAt;
  final ReviewerModel reviewer;
  final StaffReviewServiceModel service;
  final int? appointmentId;

  const StaffReviewModel({
    required this.id,
    required this.rating,
    required this.comment,
    this.createdAt,
    required this.reviewer,
    required this.service,
    this.appointmentId,
  });

  factory StaffReviewModel.fromJson(Map<String, dynamic> json) {
    return StaffReviewModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      comment: json['comment'] ?? '',
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
      reviewer: ReviewerModel.fromJson(json['reviewer']),
      service: StaffReviewServiceModel.fromJson(json['service']),
      appointmentId: (json['appointment_id'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'rating': rating,
        'comment': comment,
        'created_at': createdAt?.toIso8601String(),
        'client': reviewer.toJson(),
        'service': service.toJson(),
        'appointment_id': appointmentId,
      };
}

class ReviewerModel {
  final int id;
  final String name;
  final ReviewerRole role;

  const ReviewerModel({
    required this.id,
    required this.name,
    required this.role,
  });

  factory ReviewerModel.fromJson(Map<String, dynamic> json) {
    return ReviewerModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
      role: ReviewerRole.fromString(json['role']?.toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'role': role.name,
      };
}

class StaffReviewServiceModel {
  final int id;
  final String name;
  const StaffReviewServiceModel({
    required this.id,
    required this.name,
  });

  factory StaffReviewServiceModel.fromJson(Map<String, dynamic> json) {
    return StaffReviewServiceModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
