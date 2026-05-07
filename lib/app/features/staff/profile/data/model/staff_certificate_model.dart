class StaffCertificateModel {
  final int id;
  final String title;
  final String issuer;
  final DateTime? issueDate;
  final DateTime? expiryDate;
  final String? fileUrl;
  final bool verified;
  final DateTime? createdAt;

  const StaffCertificateModel({
    required this.id,
    required this.title,
    required this.issuer,
    this.issueDate,
    this.expiryDate,
    this.fileUrl,
    required this.verified,
    this.createdAt,
  });

  factory StaffCertificateModel.fromJson(Map<String, dynamic> json) {
    return StaffCertificateModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title']?.toString() ?? '',
      issuer: json['issuer']?.toString() ?? '',
      issueDate: DateTime.tryParse(json['issueDate']?.toString() ?? ''),
      expiryDate: DateTime.tryParse(json['expiryDate']?.toString() ?? ''),
      fileUrl: json['fileUrl'] as String?,
      verified: json['verified'] as bool? ?? false,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'issuer': issuer,
        'issueDate': issueDate?.toIso8601String(),
        'expiryDate': expiryDate?.toIso8601String(),
        'fileUrl': fileUrl,
        'verified': verified,
        'createdAt': createdAt?.toIso8601String(),
      };
}
