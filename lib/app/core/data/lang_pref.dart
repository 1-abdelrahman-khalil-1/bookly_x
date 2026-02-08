import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/translations.g.dart';
import 'pref.dart';

final langPrefsProvider = Provider((ref) {
  return LangPrefs();
});

bool get isArabic {
  return SharedPrefs.instance.getBool(isKeyArabic) ??
      (LocaleSettings.currentLocale.languageCode == AppLocale.ar.languageCode);
}

const isKeyArabic = 'lang';

class LangPrefs {
  final prefs = SharedPrefs.instance;

  String get lang => isArabic ? 'ar' : 'en';

  String get getFontFamily => isArabic ? 'Expo' : 'Poppins';

  bool get isArabic =>
      prefs.getBool(isKeyArabic) ??
      (LocaleSettings.currentLocale.languageCode == AppLocale.ar.languageCode);

  Future<void> setLangToArabic() async {
    LocaleSettings.setLocale(AppLocale.ar);
    await prefs.setBool(isKeyArabic, true);
  }

  Future<void> setLangToEnglish() async {
    LocaleSettings.setLocale(AppLocale.en);
    await prefs.setBool(isKeyArabic, false);
  }

  Locale get locale => isArabic ? const Locale('ar') : const Locale('en');
}
