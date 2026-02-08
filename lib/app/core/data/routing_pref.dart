
import 'pref.dart';

class RoutingPrefs {
  RoutingPrefs._();

  static final prefs = SharedPrefs.instance;

  static void markOnBoardingAsSeen() => prefs.setBool('onBoarding', true);

  static bool get isOnBoardingSeen => prefs.getBool('onBoarding') ?? false;

  // static PageRouteInfo get initialRoute => isOnBoardingSeen
  //     ? UserPrefs.isUserLoggedIn
  //         ? const MainRoute()
  //         : LoginRoute()
  //     : const OnboardingRoute();
}
