class ProfessionalProfile {
  final int id;
  final String? bio;
  final int? experience;
  final String? licenseNumber;
  final String? specialization;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProfessionalProfile({
    required this.id,
    this.bio,
    this.experience,
    this.licenseNumber,
    this.specialization,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfessionalProfile.fromJson(Map<String, dynamic> json) {
    return ProfessionalProfile(
      id: (json['id'] as num?)?.toInt() ?? 0,
      bio: json['bio'] as String?,
      experience: (json['experience'] as num?)?.toInt(),
      licenseNumber: json['license_number'] as String?,
      specialization: json['specialization'] as String?,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at']?.toString() ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'bio': bio,
        'experience': experience,
        'license_number': licenseNumber,
        'specialization': specialization,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
