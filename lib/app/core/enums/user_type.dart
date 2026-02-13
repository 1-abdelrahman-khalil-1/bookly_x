import 'package:bookly_x_client/generated/translations.g.dart';

enum UserType {
  client,
  staff;

  String get displayName {
    switch (this) {
      case UserType.client:
        return tr.client;
      case UserType.staff:
        return tr.staff;
    }
  }
 static UserType fromString(String name) {
    switch (name) {
      case 'client':
        return UserType.client;
      case 'staff':
        return UserType.staff;
      default:
        throw ArgumentError('Invalid user type: $name');
    }
  }
  bool get isClient => this == UserType.client;
  bool get isStaff => this == UserType.staff;
}
