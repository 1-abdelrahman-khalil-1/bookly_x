import 'dart:async';
import 'dart:developer';

import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/app/core/widgets/app_restarter.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:event_bus/event_bus.dart';

class UnAuthorizedService {
  static final EventBus event = EventBus();
  static StreamSubscription<int>? _unauthorizedSubscription;
  static void init() {
    log("un Authorized Service Initialized", name: 'UnAuthorizedService');
    if (_unauthorizedSubscription != null) {
      return;
    }
    _unauthorizedSubscription = event.on<int>().listen((_) async {
      if (!UserPrefs.isUserLoggedIn) {
        return;
      }
      await UserPrefs.logout();
      setErrorMessage(tr.sorryYourSessionExpiredPleaseLoginAgain);
      AppRestarter.restart();
    });
  }
}
