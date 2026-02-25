// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:bookly_x_client/app/features/client/home/data/models/provider_model.dart'
    as _i17;
import 'package:bookly_x_client/app/features/client/home/presentation/screens/view_all_providers_screen.dart'
    as _i13;
import 'package:bookly_x_client/app/features/client/main_screen/presentation/screens/client_main_screen.dart'
    as _i3;
import 'package:bookly_x_client/app/features/client/offers/presentation/screens/offers_screen.dart'
    as _i6;
import 'package:bookly_x_client/app/features/client/offers/presentation/screens/view_all_offers_screen.dart'
    as _i12;
import 'package:bookly_x_client/app/features/client/provider_details/presentation/screens/provider_details_screen.dart'
    as _i9;
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/screens/auth_screen.dart'
    as _i1;
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/screens/otp_verification_screen.dart'
    as _i8;
import 'package:bookly_x_client/app/features/common/screens/choose_role/presentation/screens/choose_role_screen.dart'
    as _i2;
import 'package:bookly_x_client/app/features/common/screens/forget_password/presentation/screens/forget_password_screen.dart'
    as _i4;
import 'package:bookly_x_client/app/features/common/screens/notifications/presentation/screens/notifications_screen.dart'
    as _i5;
import 'package:bookly_x_client/app/features/common/screens/onBoarding_screen/onboarding_screen.dart'
    as _i7;
import 'package:bookly_x_client/app/features/common/screens/splash_screen/splash_screen.dart'
    as _i10;
import 'package:bookly_x_client/app/features/staff/main_screen/presentation/screens/staff_main_screen.dart'
    as _i11;
import 'package:collection/collection.dart' as _i18;
import 'package:flutter/foundation.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i14.PageRouteInfo<void> {
  const AuthRoute({List<_i14.PageRouteInfo>? children})
      : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ChooseRoleScreen]
class ChooseRoleRoute extends _i14.PageRouteInfo<void> {
  const ChooseRoleRoute({List<_i14.PageRouteInfo>? children})
      : super(ChooseRoleRoute.name, initialChildren: children);

  static const String name = 'ChooseRoleRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChooseRoleScreen();
    },
  );
}

/// generated route for
/// [_i3.ClientMainScreen]
class ClientMainRoute extends _i14.PageRouteInfo<void> {
  const ClientMainRoute({List<_i14.PageRouteInfo>? children})
      : super(ClientMainRoute.name, initialChildren: children);

  static const String name = 'ClientMainRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.ClientMainScreen();
    },
  );
}

/// generated route for
/// [_i4.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i14.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i14.PageRouteInfo>? children})
      : super(ForgetPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgetPasswordRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.ForgetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i5.NotificationsScreen]
class NotificationsRoute extends _i14.PageRouteInfo<void> {
  const NotificationsRoute({List<_i14.PageRouteInfo>? children})
      : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i6.OffersScreen]
class OffersRoute extends _i14.PageRouteInfo<void> {
  const OffersRoute({List<_i14.PageRouteInfo>? children})
      : super(OffersRoute.name, initialChildren: children);

  static const String name = 'OffersRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.OffersScreen();
    },
  );
}

/// generated route for
/// [_i7.OnboardingScreen]
class OnboardingRoute extends _i14.PageRouteInfo<void> {
  const OnboardingRoute({List<_i14.PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i8.OtpVerificationScreen]
class OtpVerificationRoute
    extends _i14.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    _i15.Key? key,
    required _i8.VerificationType verificationType,
    required String contactInfo,
    String? phoneNumber,
    List<_i14.PageRouteInfo>? children,
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

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return _i8.OtpVerificationScreen(
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

  final _i15.Key? key;

  final _i8.VerificationType verificationType;

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
/// [_i9.ProviderDetailsScreen]
class ProviderDetailsRoute
    extends _i14.PageRouteInfo<ProviderDetailsRouteArgs> {
  ProviderDetailsRoute({
    _i16.Key? key,
    required String providerId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ProviderDetailsRoute.name,
          args: ProviderDetailsRouteArgs(key: key, providerId: providerId),
          initialChildren: children,
        );

  static const String name = 'ProviderDetailsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProviderDetailsRouteArgs>();
      return _i9.ProviderDetailsScreen(
        key: args.key,
        providerId: args.providerId,
      );
    },
  );
}

class ProviderDetailsRouteArgs {
  const ProviderDetailsRouteArgs({this.key, required this.providerId});

  final _i16.Key? key;

  final String providerId;

  @override
  String toString() {
    return 'ProviderDetailsRouteArgs{key: $key, providerId: $providerId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProviderDetailsRouteArgs) return false;
    return key == other.key && providerId == other.providerId;
  }

  @override
  int get hashCode => key.hashCode ^ providerId.hashCode;
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.SplashScreen();
    },
  );
}

/// generated route for
/// [_i11.StaffMainScreen]
class StaffMainRoute extends _i14.PageRouteInfo<void> {
  const StaffMainRoute({List<_i14.PageRouteInfo>? children})
      : super(StaffMainRoute.name, initialChildren: children);

  static const String name = 'StaffMainRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.StaffMainScreen();
    },
  );
}

/// generated route for
/// [_i12.ViewAllOffersScreen]
class ViewAllOffersRoute extends _i14.PageRouteInfo<ViewAllOffersRouteArgs> {
  ViewAllOffersRoute({
    _i16.Key? key,
    required List<_i17.ProviderModel> providers,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ViewAllOffersRoute.name,
          args: ViewAllOffersRouteArgs(key: key, providers: providers),
          initialChildren: children,
        );

  static const String name = 'ViewAllOffersRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ViewAllOffersRouteArgs>();
      return _i12.ViewAllOffersScreen(key: args.key, providers: args.providers);
    },
  );
}

class ViewAllOffersRouteArgs {
  const ViewAllOffersRouteArgs({this.key, required this.providers});

  final _i16.Key? key;

  final List<_i17.ProviderModel> providers;

  @override
  String toString() {
    return 'ViewAllOffersRouteArgs{key: $key, providers: $providers}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ViewAllOffersRouteArgs) return false;
    return key == other.key &&
        const _i18.ListEquality().equals(providers, other.providers);
  }

  @override
  int get hashCode => key.hashCode ^ const _i18.ListEquality().hash(providers);
}

/// generated route for
/// [_i13.ViewAllProvidersScreen]
class ViewAllProvidersRoute
    extends _i14.PageRouteInfo<ViewAllProvidersRouteArgs> {
  ViewAllProvidersRoute({
    _i16.Key? key,
    required List<_i17.ProviderModel> providers,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ViewAllProvidersRoute.name,
          args: ViewAllProvidersRouteArgs(key: key, providers: providers),
          initialChildren: children,
        );

  static const String name = 'ViewAllProvidersRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ViewAllProvidersRouteArgs>();
      return _i13.ViewAllProvidersScreen(
        key: args.key,
        providers: args.providers,
      );
    },
  );
}

class ViewAllProvidersRouteArgs {
  const ViewAllProvidersRouteArgs({this.key, required this.providers});

  final _i16.Key? key;

  final List<_i17.ProviderModel> providers;

  @override
  String toString() {
    return 'ViewAllProvidersRouteArgs{key: $key, providers: $providers}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ViewAllProvidersRouteArgs) return false;
    return key == other.key &&
        const _i18.ListEquality().equals(providers, other.providers);
  }

  @override
  int get hashCode => key.hashCode ^ const _i18.ListEquality().hash(providers);
}
