import '../enums/booking_status.dart';

class BookingModel {
  final int id;
  final Client client;
  final BookingStatus status;
  final ServiceModel service;
  final DateTime scheduledAt;
  final String? notes;
  final bool hasAttachments;

  BookingModel({
    required this.id,
    required this.client, 
    required this.status,
    required this.service,
    required this.scheduledAt,
    this.notes,
    this.hasAttachments = false,
  });

  BookingModel copyWith({
    int? id,
    Client? client,
    BookingStatus? status,
    ServiceModel? service,
    String? notes,
    bool? hasAttachments,
  }) {
    return BookingModel(
      id: id ?? this.id,
      client: client ?? this.client,
      status: status ?? this.status,
      service: service ?? this.service,
      scheduledAt: scheduledAt,
      notes: notes ?? this.notes,
      hasAttachments: hasAttachments ?? this.hasAttachments,
    );
  }

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as int,
      client: Client.fromJson(json['client']['user']),
      status:
          BookingStatus.fromString((json['status'] as String?) ?? 'pending'),
      service: ServiceModel.fromJson(json['service']),
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      notes: json['notes'] as String?,
      hasAttachments: json['has_attachments'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client': client.toJson(),
      'status': status.name,
      'service': service.toJson(),
      'scheduled_at': scheduledAt.toIso8601String(),
      'notes': notes,
      'has_attachments': hasAttachments,
    };
  }
}

class Client {
  final int id;
  final String name;
  final String phone;
  final String? avatarUrl;

  Client({
    required this.id,
    required this.name,
    required this.phone,
    this.avatarUrl,
  });

  Client copyWith({
    String? name,
    String? phone,
    String? avatarUrl,
  }) {
    return Client(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      avatarUrl: json['avatar_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'avatar_url': avatarUrl,
    };
  }
}

class ServiceModel {
  final int id;
  final String name;
  final int price;
  final int durationMinutes;
  final String description;
  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationMinutes,
  });
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
        id: json['id'] as int,
        name: json['name'],
        description: json['description'],
        price: json['price'],
        durationMinutes: json['duration_minutes']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'duration_minutes': durationMinutes,
    };
  }
}
