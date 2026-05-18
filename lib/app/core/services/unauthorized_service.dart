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
  static bool _isRestarting = false;

  static void init() {
    log("un Authorized Service Initialized", name: 'UnAuthorizedService');
    if (_unauthorizedSubscription != null) {
      return;
    }
    _unauthorizedSubscription = event.on<int>().listen((_) async {
      if (_isRestarting) return;
      _isRestarting = true;

      try {
        await UserPrefs.logout();
        setErrorMessage(tr.sorryYourSessionExpiredPleaseLoginAgain);
        AppRestarter.restart();
      } finally {
        // Reset flag after a delay to allow restart to take effect
        Future.delayed(const Duration(seconds: 2), () => _isRestarting = false);
      }
    });
  }
}
