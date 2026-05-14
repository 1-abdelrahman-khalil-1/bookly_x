class AppoitmentModel {
  final int id;
  final String clientName;
  final String serviceName;
  final DateTime scheduledAt;
  final int duration;
  final String status;

  AppoitmentModel({
    required this.id,
    required this.clientName,
    required this.serviceName,
    required this.scheduledAt,
    required this.duration,
    required this.status,
  });

  factory AppoitmentModel.fromJson(Map<String, dynamic> json) =>
      AppoitmentModel(
        id: json['id'] as int,
        clientName: json['client_name'] as String,
        serviceName: json['service_name'] as String,
        scheduledAt: DateTime.parse(json['scheduled_at'] as String),
        duration: json['duration'] as int,
        status: json['status'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'client_name': clientName,
        'service_name': serviceName,
        'scheduled_at': scheduledAt.toIso8601String(),
        'duration': duration,
        'status': status,
      };
}
