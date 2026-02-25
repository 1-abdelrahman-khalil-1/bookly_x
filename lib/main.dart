import 'dart:async';
import 'dart:developer';

import 'package:bookly_x_client/app/core/data/lang_pref.dart';
import 'package:bookly_x_client/app/core/data/pref.dart';
import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/app/core/services/unauthorized_service.dart';
import 'package:bookly_x_client/bookly_x_client_app.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

final globalRefContainer = ProviderContainer();
final prefsProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

void main() async {
  await runZonedGuarded(
    () async {
      await boot();
      runApp(
        TranslationProvider(
          child: UncontrolledProviderScope(
            container: globalRefContainer,
            child: const BooklyXClientApp(),
          ),
        ),
      );
    },
    (e, s) async {
      log('Uncaught error');
      log(e.toString(), stackTrace: s);
    },
  );
}

Future<void> boot() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  UnAuthorizedService.init();
  log(UserPrefs.getUserToken(), name: 'Main - Token');
  await setInitialLang();
  await initializeDateFormatting(LocaleSettings.currentLocale.languageCode);
  if (kDebugMode) {
    ErrorWidget.builder = (err) {
      log(err.toString(), stackTrace: err.stack);
      return Material(
        child: SingleChildScrollView(child: Text(err.toString())),
      );
    };
    FlutterError.onError = (details) {
      log(details.exception.toString());
      log(details.stack.toString());
      FlutterError.dumpErrorToConsole(details);
    };
  }
}

Future<void> setInitialLang() async {
  try {
    final prefs = SharedPrefs.instance;
    final isArabicLang = prefs.getBool(isKeyArabic);
    LocaleSettings.setLocale(
      isArabicLang == null || isArabicLang ? AppLocale.ar : AppLocale.en,
    );
  } on Exception catch (e, s) {
    log(e.toString(), stackTrace: s);
  }
}
