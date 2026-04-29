import 'dart:async';

import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/bookly_x_client_app.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class UnAuthorizedService {
  static final EventBus event = EventBus();
  static StreamSubscription<int>? _unauthorizedSubscription;

  static void init() {
    if (_unauthorizedSubscription != null) {
      return;
    }
    _unauthorizedSubscription = event.on<int>().listen((_) async {
      if (!UserPrefs.isUserLoggedIn) {
        return;
      }
      await UserPrefs.logout();
      final BuildContext? context = appRouter.navigatorKey.currentContext;
      if (context == null || !context.mounted) {
        return;
      }
      setErrorMessage(tr.sorryYourSessionExpiredPleaseLoginAgain);

      context.pushAndPopAll(const ChooseRoleRoute());
    });
  }
}
