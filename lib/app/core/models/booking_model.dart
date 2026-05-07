import '../enums/booking_status.dart';

class BookingModel {
  final String id;
  final String clientName;
  final String? clientPhone;
  final String? avatarUrl;
  final BookingStatus status;
  final String serviceName;
  final DateTime dateTime;
  final int durationMinutes;
  final double price;
  final String? notes;
  final bool hasAttachments;

  BookingModel({
    required this.id,
    required this.clientName,
    this.clientPhone,
    this.avatarUrl,
    required this.status,
    required this.serviceName,
    required this.dateTime,
    required this.durationMinutes,
    required this.price,
    this.notes,
    this.hasAttachments = false,
  });

  BookingModel copyWith({
    String? id,
    String? clientName,
    String? clientPhone,
    String? avatarUrl,
    BookingStatus? status,
    String? serviceName,
    DateTime? dateTime,
    int? durationMinutes,
    double? price,
    String? notes,
    bool? hasAttachments,
  }) {
    return BookingModel(
      id: id ?? this.id,
      clientName: clientName ?? this.clientName,
      clientPhone: clientPhone ?? this.clientPhone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      status: status ?? this.status,
      serviceName: serviceName ?? this.serviceName,
      dateTime: dateTime ?? this.dateTime,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      price: price ?? this.price,
      notes: notes ?? this.notes,
      hasAttachments: hasAttachments ?? this.hasAttachments,
    );
  }

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String,
      clientName: json['clientName'] as String,
      clientPhone: json['clientPhone'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      status:
          BookingStatusX.fromString((json['status'] as String?) ?? 'pending'),
      serviceName: json['serviceName'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      notes: json['notes'] as String?,
      hasAttachments: json['hasAttachments'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clientName': clientName,
      'clientPhone': clientPhone,
      'avatarUrl': avatarUrl,
      'status': status.name,
      'serviceName': serviceName,
      'dateTime': dateTime.toIso8601String(),
      'durationMinutes': durationMinutes,
      'price': price,
      'notes': notes,
      'hasAttachments': hasAttachments,
    };
  }
}
