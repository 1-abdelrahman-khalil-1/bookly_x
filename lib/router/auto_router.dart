import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/data/routing_pref.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/widgets.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            page: SplashRoute.page,
            // initial: true,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: OnboardingRoute.page,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: AuthRoute.page, transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: ClientMainRoute.page,
            initial: true,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: StaffMainRoute.page,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: ChooseRoleRoute.page,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: ForgetPasswordRoute.page,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: OtpVerificationRoute.page,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: ViewAllProvidersRoute.page,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: NotificationsRoute.page,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: ViewAllOffersRoute.page,
            transitionsBuilder: rightToLeftTransition),
        CustomRoute(
            page: ProviderDetailsRoute.page,
            transitionsBuilder: rightToLeftTransition),
      ];

  Widget rightToLeftTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final isRTL = LocaleSettings.currentLocale != AppLocale.ar;

    final begin = isRTL ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  bool isInitialRoute(PageRouteInfo route) {
    return route == RoutingPrefs.initialRoute;
  }
}
