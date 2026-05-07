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
      licenseNumber: json['licenseNumber'] as String?,
      specialization: json['specialization'] as String?,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'bio': bio,
        'experience': experience,
        'licenseNumber': licenseNumber,
        'specialization': specialization,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
