import 'dart:developer';

import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/app/core/widgets/app_restarter.dart';
import 'package:bookly_x_client/bookly_x_client_app.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';

class SessionResetService {
  SessionResetService._();

  static Future<void> logoutAndReset() async {
    await UserPrefs.logout();
    await resetAppState();
  }

  static Future<void> resetAppState() async {
    try {
      await appRouter.replaceAll([const ChooseRoleRoute()]);
    } catch (e, s) {
      log(
        'Failed to reset navigation stack: $e',
        name: 'SessionResetService',
        stackTrace: s,
      );
    }

    AppRestarter.restart();
  }
}
