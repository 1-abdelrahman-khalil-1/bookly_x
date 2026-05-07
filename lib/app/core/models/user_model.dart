import 'package:bookly_x_client/app/core/enums/user_type.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_model.dart';

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
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      role: _userTypeFromString(json['role']?.toString()),
      status: json['status']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? ''),
      emailVerified: json['emailVerified'] ?? false,
      phoneVerified: json['phoneVerified'] ?? false,
      staff: json['staff'] != null ? StaffModel.fromJson(json['staff']) : null,
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'emailVerified': emailVerified,
      'phoneVerified': phoneVerified,
      'staff': staff?.toJson(),
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
