// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:bookly_x_client/app/features/client/main_screen/presentation/screens/client_main_screen.dart'
    as _i3;
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/screens/auth_screen.dart'
    as _i1;
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/screens/otp_verification_screen.dart'
    as _i6;
import 'package:bookly_x_client/app/features/common/screens/choose_role/presentation/screens/choose_role_screen.dart'
    as _i2;
import 'package:bookly_x_client/app/features/common/screens/forget_password/presentation/screens/forget_password_screen.dart'
    as _i4;
import 'package:bookly_x_client/app/features/common/screens/onBoarding_screen/onboarding_screen.dart'
    as _i5;
import 'package:bookly_x_client/app/features/common/screens/splash_screen/splash_screen.dart'
    as _i7;
import 'package:bookly_x_client/app/features/staff/main_screen/presentation/screens/staff_main_screen.dart'
    as _i8;
import 'package:flutter/foundation.dart' as _i10;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
      : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ChooseRoleScreen]
class ChooseRoleRoute extends _i9.PageRouteInfo<void> {
  const ChooseRoleRoute({List<_i9.PageRouteInfo>? children})
      : super(ChooseRoleRoute.name, initialChildren: children);

  static const String name = 'ChooseRoleRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChooseRoleScreen();
    },
  );
}

/// generated route for
/// [_i3.ClientMainScreen]
class ClientMainRoute extends _i9.PageRouteInfo<void> {
  const ClientMainRoute({List<_i9.PageRouteInfo>? children})
      : super(ClientMainRoute.name, initialChildren: children);

  static const String name = 'ClientMainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.ClientMainScreen();
    },
  );
}

/// generated route for
/// [_i4.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i9.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i9.PageRouteInfo>? children})
      : super(ForgetPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgetPasswordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.ForgetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i6.OtpVerificationScreen]
class OtpVerificationRoute extends _i9.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    _i10.Key? key,
    required _i6.VerificationType verificationType,
    required String contactInfo,
    String? phoneNumber,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(
            key: key,
            verificationType: verificationType,
            contactInfo: contactInfo,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return _i6.OtpVerificationScreen(
        key: args.key,
        verificationType: args.verificationType,
        contactInfo: args.contactInfo,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    this.key,
    required this.verificationType,
    required this.contactInfo,
    this.phoneNumber,
  });

  final _i10.Key? key;

  final _i6.VerificationType verificationType;

  final String contactInfo;

  final String? phoneNumber;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{key: $key, verificationType: $verificationType, contactInfo: $contactInfo, phoneNumber: $phoneNumber}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpVerificationRouteArgs) return false;
    return key == other.key &&
        verificationType == other.verificationType &&
        contactInfo == other.contactInfo &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      verificationType.hashCode ^
      contactInfo.hashCode ^
      phoneNumber.hashCode;
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SplashScreen();
    },
  );
}

/// generated route for
/// [_i8.StaffMainScreen]
class StaffMainRoute extends _i9.PageRouteInfo<void> {
  const StaffMainRoute({List<_i9.PageRouteInfo>? children})
      : super(StaffMainRoute.name, initialChildren: children);

  static const String name = 'StaffMainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.StaffMainScreen();
    },
  );
}
