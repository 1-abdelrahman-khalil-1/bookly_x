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
      issueDate: DateTime.tryParse(json['issue_date']?.toString() ?? ''),
      expiryDate: DateTime.tryParse(json['expiry_date']?.toString() ?? ''),
      fileUrl: json['file_url'] as String?,
      verified: json['verified'] as bool? ?? false,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'issuer': issuer,
        'issue_date': issueDate?.toIso8601String(),
        'expiry_date': expiryDate?.toIso8601String(),
        'file_url': fileUrl,
        'verified': verified,
        'created_at': createdAt?.toIso8601String(),
      };
}
