import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';

extension StringExtensions on String {
  String get replaceArabicNumbers {
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    String newText = this;
    for (int i = 0; i < arabic.length; i++) {
      newText = newText.replaceAll(arabic[i], english[i]);
    }
    return newText;
  }

  String get encrypted {
    final content = const Utf8Encoder().convert(this);
    final encrypted = sha256.convert(content).toString();
    log('$this => $encrypted');
    return encrypted;
  }
}
