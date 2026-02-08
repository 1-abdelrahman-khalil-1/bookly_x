import 'package:bookly_x_client/app/core/themes/app_theme.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final appRouter = AppRouter();

class BooklyXClientApp extends StatelessWidget {
  const BooklyXClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = TranslationProvider.of(context).flutterLocale;

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Bookly X Client',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      locale: locale,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
