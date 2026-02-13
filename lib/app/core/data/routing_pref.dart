import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart'
    show
        ChooseRoleRoute,
        MainRoute,
        OnboardingRoute,
        ClientMainRoute,
        StaffMainRoute;

import 'pref.dart';

class RoutingPrefs {
  RoutingPrefs._();

  static final prefs = SharedPrefs.instance;

  static void markOnBoardingAsSeen() => prefs.setBool('onBoarding', true);

  static bool get isOnBoardingSeen => prefs.getBool('onBoarding') ?? false;

  static PageRouteInfo get initialRoute {
    if (isOnBoardingSeen) {
      if (UserPrefs.isUserLoggedIn) {
        return UserPrefs.getUserType().isClient
            ? const ClientMainRoute()
            : const StaffMainRoute();
      } else {
        return ChooseRoleRoute();
      }
    } else {
      return const OnboardingRoute();
    }
  }
}
