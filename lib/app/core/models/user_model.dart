import 'package:bookly_x/app/core/enums/user_type.dart';
import 'package:bookly_x/app/features/client/setting/data/models/client_model.dart';
import 'package:bookly_x/app/features/staff/profile/data/model/staff_model.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final UserType role;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool emailVerified;
  final bool phoneVerified;
  final StaffModel? staff;
  final ClientModel? client;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.status,
    this.createdAt,
    this.updatedAt,
    required this.emailVerified,
    required this.phoneVerified,
    this.staff,
    this.client,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      role: _userTypeFromString(json['role']?.toString()),
      status: json['status']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at']?.toString() ?? ''),
      emailVerified: json['email_verified'] ?? false,
      phoneVerified: json['phone_verified'] ?? false,
      staff: json['staff'] != null ? StaffModel.fromJson(json['staff']) : null,
      client: json['client'] != null ? ClientModel.fromJson(json['client']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role.name,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'email_verified': emailVerified,
      'phone_verified': phoneVerified,
      'staff': staff?.toJson(),
      'client': client?.toJson(),
    };
  }

  static UserType _userTypeFromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'staff':
        return UserType.staff;
      case 'client':
      default:
        return UserType.client;
    }
  }
}
