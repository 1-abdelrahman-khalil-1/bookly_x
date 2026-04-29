class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String status;
  final bool emailVerified;
  final bool phoneVerified;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.emailVerified,
    required this.phoneVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
      emailVerified: json['emailVerified'],
      phoneVerified: json['phoneVerified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'status': status,
      'emailVerified': emailVerified,
      'phoneVerified': phoneVerified,
    };
  }
}
