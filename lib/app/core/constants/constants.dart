import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

typedef Json = Map<String, dynamic>;
typedef ListOfJson = List<dynamic>;

class Constants {
  Constants._();

  static const double buttonHeight = 48.0;
  static const double defaultPadding = 5.0;
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double borderRadius = 4.0;
  static const double textFieldBorderRadius = 4.0;
  static const double borderWidth = 1;
  static const double spaceBetween = 24;

  static const String tempImage =
      'https://cdn.pixabay.com/photo/2017/02/23/13/05/avatar-2092113_1280.png';

  /// Default image URL for UI converter placeholders
  static const String defaultImageUrl =
      'https://static.vecteezy.com/system/resources/previews/037/747/463/non_2x/online-hotel-accommodation-booking-website-provide-modish-reservation-system-travel-technology-concept-photo.jpg';
  static const String sentryDSN = '';

  //todo add fonts

  static const String enFont = 'Almarai';
  // static const String apiKey = 'AIzaSyBMsTsrGZVlNpB3ufAcDP5cqJAY-UZKJt4';
  static const String mapsApiKey = 'AIzaSyC54HADVM_oLQwHPeY4AxDbxhFwRuOntUE';
  static const String arFont = 'Almarai';
  static const String defaultCountryCode = '20';
  static const int defaultLenNumber = 10;

  static BoxDecoration defaultBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    color: AppColors.white,
    boxShadow: [
      BoxShadow(color: AppColors.black.withValues(alpha: 0.1), blurRadius: 4),
    ],
  );

  static String get endPoint => 'hospital';
}
