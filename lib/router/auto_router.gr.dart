// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:bookly_x_client/app/features/client/main_screen/presentation/screens/client_main_screen.dart'
    as _i3;
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/screens/auth_screen.dart'
    as _i1;
import 'package:bookly_x_client/app/features/common/screens/choose_role/presentation/screens/choose_role_screen.dart'
    as _i2;
import 'package:bookly_x_client/app/features/common/screens/onBoarding_screen/onboarding_screen.dart'
    as _i4;
import 'package:bookly_x_client/app/features/common/screens/splash_screen/splash_screen.dart'
    as _i5;
import 'package:bookly_x_client/app/features/staff/main_screen/presentation/screens/staff_main_screen.dart'
    as _i6;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
      : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ChooseRoleScreen]
class ChooseRoleRoute extends _i7.PageRouteInfo<void> {
  const ChooseRoleRoute({List<_i7.PageRouteInfo>? children})
      : super(ChooseRoleRoute.name, initialChildren: children);

  static const String name = 'ChooseRoleRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChooseRoleScreen();
    },
  );
}

/// generated route for
/// [_i3.ClientMainScreen]
class ClientMainRoute extends _i7.PageRouteInfo<void> {
  const ClientMainRoute({List<_i7.PageRouteInfo>? children})
      : super(ClientMainRoute.name, initialChildren: children);

  static const String name = 'ClientMainRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.ClientMainScreen();
    },
  );
}

/// generated route for
/// [_i4.OnboardingScreen]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute({List<_i7.PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}

/// generated route for
/// [_i6.StaffMainScreen]
class StaffMainRoute extends _i7.PageRouteInfo<void> {
  const StaffMainRoute({List<_i7.PageRouteInfo>? children})
      : super(StaffMainRoute.name, initialChildren: children);

  static const String name = 'StaffMainRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.StaffMainScreen();
    },
  );
}
