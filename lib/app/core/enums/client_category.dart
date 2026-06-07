import 'package:bookly_x/generated/translations.g.dart';

enum ClientCategory {
  spa,
  clinic,
  barber;

  String get apiKey {
    switch (this) {
      case ClientCategory.spa:
        return 'SPA';
      case ClientCategory.clinic:
        return 'CLINIC';
      case ClientCategory.barber:
        return 'BARBER';
    }
  }

  String get displayName {
    switch (this) {
      case ClientCategory.spa:
        return tr.spas;
      case ClientCategory.clinic:
        return tr.clinics;
      case ClientCategory.barber:
        return tr.barbers;
    }
  }

  String get imageUrl {
    switch (this) {
      case ClientCategory.spa:
        return 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=200&h=100&fit=crop';
      case ClientCategory.clinic:
        return 'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=200&h=100&fit=crop';
      case ClientCategory.barber:
        return 'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?w=200&h=100&fit=crop';
    }
  }

  static ClientCategory fromString(String value) {
    switch (value.toUpperCase()) {
      case 'SPA':
        return ClientCategory.spa;
      case 'CLINIC':
        return ClientCategory.clinic;
      case 'BARBER':
        return ClientCategory.barber;
      default:
        throw ArgumentError('Invalid client category: $value');
    }
  }
}
