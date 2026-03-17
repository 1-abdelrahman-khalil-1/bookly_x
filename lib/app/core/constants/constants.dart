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
      'https://media.istockphoto.com/id/1352185969/photo/shot-of-a-young-woman-cheering-while-using-a-laptop-to-study-at-home.webp?s=612x612&w=is&k=20&c=yCI6qUI9Q4162uRowbhKKX1iqIpuAtxns8NhKYVrCpw=';

  /// Default image URL for UI converter placeholders
  static const String defaultImageUrl =
      'https://media.istockphoto.com/id/1352185969/photo/shot-of-a-young-woman-cheering-while-using-a-laptop-to-study-at-home.webp?s=612x612&w=is&k=20&c=yCI6qUI9Q4162uRowbhKKX1iqIpuAtxns8NhKYVrCpw=';
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
