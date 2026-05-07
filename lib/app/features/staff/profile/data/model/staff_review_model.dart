import 'staff_reviewer_role_enum.dart';

class StaffReviewModel {
  final int id;
  final double rating;
  final String? comment;
  final StaffReviewerRole reviewerRole;
  final DateTime? createdAt;
  final StaffReviewClientModel? client;
  final StaffReviewServiceModel? service;
  final int? appointmentId;

  const StaffReviewModel({
    required this.id,
    required this.rating,
    this.comment,
    required this.reviewerRole,
    this.createdAt,
    this.client,
    this.service,
    this.appointmentId,
  });

  factory StaffReviewModel.fromJson(Map<String, dynamic> json) {
    return StaffReviewModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      comment: json['comment'] as String?,
      reviewerRole: StaffReviewerRole.fromString(
        json['reviewerRole']?.toString(),
      ),
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? ''),
      client: json['client'] is Map<String, dynamic>
          ? StaffReviewClientModel.fromJson(
              json['client'] as Map<String, dynamic>)
          : null,
      service: json['service'] is Map<String, dynamic>
          ? StaffReviewServiceModel.fromJson(
              json['service'] as Map<String, dynamic>,
            )
          : null,
      appointmentId: (json['appointmentId'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'rating': rating,
        'comment': comment,
        'reviewerRole': reviewerRole.name,
        'createdAt': createdAt?.toIso8601String(),
        'client': client?.toJson(),
        'service': service?.toJson(),
        'appointmentId': appointmentId,
      };
}

class StaffReviewClientModel {
  final String name;
  final String phone;

  const StaffReviewClientModel({
    required this.name,
    required this.phone,
  });

  factory StaffReviewClientModel.fromJson(Map<String, dynamic> json) {
    return StaffReviewClientModel(
      name: json['name']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
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
