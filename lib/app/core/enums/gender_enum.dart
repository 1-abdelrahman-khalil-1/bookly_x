import 'package:bookly_x_client/generated/translations.g.dart';

enum Gender {
  male,
  female;

  String get name {
    switch (this) {
      case Gender.male:
        return tr.male;
      case Gender.female:
        return tr.female;
    }
  }

  String get apiKey {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
    }
  }

  static Gender fromString(String? gender) {
    switch (gender) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      default:
        return Gender.male;
    }
  }
}
