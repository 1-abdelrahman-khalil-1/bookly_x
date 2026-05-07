import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
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
      routerConfig: appRouter.config(
        navigatorObservers: () => [MyObserver()],
      ),
      title: 'Bookly X Client',
      theme: AppTheme.lightTheme.copyWith(
        scaffoldBackgroundColor: AppColors.whiteCatskillWhite,
      ),
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

class MyObserver extends AutoRouterObserver {
  void logStack() {
    final stack = appRouter.stack;
    log("\x1B[32m========= CURRENT STACK =========\x1B[0m", name: "AutoRouter");
    for (final route in stack) {
      log("  ${route.name}", name: "AutoRouter");
    }
    log("\x1B[32m=================================\x1B[0m", name: "AutoRouter");
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    log("Pushed: ${route.settings.name}", name: "AutoRouter Push");
    logStack();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log("Popped: ${route.settings.name}", name: "AutoRouter Pop");
    logStack();
  }
}
