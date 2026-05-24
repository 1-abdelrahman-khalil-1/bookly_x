// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:bookly_x_client/app/core/models/booking_model.dart' as _i36;
import 'package:bookly_x_client/app/features/client/booking_service/data/models/booking_service_model.dart'
    as _i34;
import 'package:bookly_x_client/app/features/client/booking_service/presentation/screens/client_booking_service_host_screen.dart'
    as _i4;
import 'package:bookly_x_client/app/features/client/booking_service/presentation/screens/client_booking_success_screen.dart'
    as _i5;
import 'package:bookly_x_client/app/features/client/booking_service/presentation/screens/client_payment_success_screen.dart'
    as _i11;
import 'package:bookly_x_client/app/features/client/booking_service/presentation/screens/client_secure_payment_screen.dart'
    as _i13;
import 'package:bookly_x_client/app/features/client/booking_service/presentation/screens/client_staff_info_screen.dart'
    as _i14;
import 'package:bookly_x_client/app/features/client/bookings/data/models/booking_data.dart'
    as _i33;
import 'package:bookly_x_client/app/features/client/bookings/presentation/screens/client_booking_details_screen.dart'
    as _i3;
import 'package:bookly_x_client/app/features/client/explore/presentation/screens/explore_screen.dart'
    as _i15;
import 'package:bookly_x_client/app/features/client/home/data/models/provider_model.dart'
    as _i37;
import 'package:bookly_x_client/app/features/client/home/presentation/screens/view_all_providers_screen.dart'
    as _i30;
import 'package:bookly_x_client/app/features/client/main_screen/presentation/screens/client_main_screen.dart'
    as _i7;
import 'package:bookly_x_client/app/features/client/main_screen/presentation/screens/client_map_view_screen.dart'
    as _i9;
import 'package:bookly_x_client/app/features/client/offers/presentation/screens/offers_screen.dart'
    as _i18;
import 'package:bookly_x_client/app/features/client/offers/presentation/screens/view_all_offers_screen.dart'
    as _i29;
import 'package:bookly_x_client/app/features/client/provider_details/presentation/screens/provider_details_screen.dart'
    as _i21;
import 'package:bookly_x_client/app/features/client/setting/presentation/screens/client_edit_profile_screen.dart'
    as _i6;
import 'package:bookly_x_client/app/features/client/setting/presentation/screens/client_manage_preferences_screen.dart'
    as _i8;
import 'package:bookly_x_client/app/features/client/setting/presentation/screens/client_notification_preferences_screen.dart'
    as _i10;
import 'package:bookly_x_client/app/features/client/setting/presentation/screens/client_privacy_security_screen.dart'
    as _i12;
import 'package:bookly_x_client/app/features/client/setting/presentation/screens/setting_screen.dart'
    as _i23;
import 'package:bookly_x_client/app/features/common/reset_password/presentation/screens/reset_password_screen.dart'
    as _i22;
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/screens/auth_screen.dart'
    as _i1;
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/screens/otp_verification_screen.dart'
    as _i20;
import 'package:bookly_x_client/app/features/common/screens/choose_role/presentation/screens/choose_role_screen.dart'
    as _i2;
import 'package:bookly_x_client/app/features/common/screens/forget_password/presentation/screens/forget_password_screen.dart'
    as _i16;
import 'package:bookly_x_client/app/features/common/screens/notifications/presentation/screens/notifications_screen.dart'
    as _i17;
import 'package:bookly_x_client/app/features/common/screens/onBoarding_screen/onboarding_screen.dart'
    as _i19;
import 'package:bookly_x_client/app/features/common/screens/splash_screen/splash_screen.dart'
    as _i24;
import 'package:bookly_x_client/app/features/staff/bookings/presentation/screens/staff_booking_details_screen.dart'
    as _i25;
import 'package:bookly_x_client/app/features/staff/main_screen/presentation/screens/staff_main_screen.dart'
    as _i26;
import 'package:bookly_x_client/app/features/staff/profile/presentation/screens/staff_profile_screen.dart'
    as _i27;
import 'package:bookly_x_client/app/features/staff/profile/presentation/screens/staff_reviews_screen.dart'
    as _i28;
import 'package:collection/collection.dart' as _i38;
import 'package:flutter/foundation.dart' as _i35;
import 'package:flutter/material.dart' as _i32;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i31.PageRouteInfo<void> {
  const AuthRoute({List<_i31.PageRouteInfo>? children})
      : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ChooseRoleScreen]
class ChooseRoleRoute extends _i31.PageRouteInfo<void> {
  const ChooseRoleRoute({List<_i31.PageRouteInfo>? children})
      : super(ChooseRoleRoute.name, initialChildren: children);

  static const String name = 'ChooseRoleRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChooseRoleScreen();
    },
  );
}

/// generated route for
/// [_i3.ClientBookingDetailsScreen]
class ClientBookingDetailsRoute
    extends _i31.PageRouteInfo<ClientBookingDetailsRouteArgs> {
  ClientBookingDetailsRoute({
    _i32.Key? key,
    required _i33.BookingData booking,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ClientBookingDetailsRoute.name,
          args: ClientBookingDetailsRouteArgs(key: key, booking: booking),
          initialChildren: children,
        );

  static const String name = 'ClientBookingDetailsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientBookingDetailsRouteArgs>();
      return _i3.ClientBookingDetailsScreen(
        key: args.key,
        booking: args.booking,
      );
    },
  );
}

class ClientBookingDetailsRouteArgs {
  const ClientBookingDetailsRouteArgs({this.key, required this.booking});

  final _i32.Key? key;

  final _i33.BookingData booking;

  @override
  String toString() {
    return 'ClientBookingDetailsRouteArgs{key: $key, booking: $booking}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClientBookingDetailsRouteArgs) return false;
    return key == other.key && booking == other.booking;
  }

  @override
  int get hashCode => key.hashCode ^ booking.hashCode;
}

/// generated route for
/// [_i4.ClientBookingServiceHostScreen]
class ClientBookingServiceHostRoute extends _i31.PageRouteInfo<void> {
  const ClientBookingServiceHostRoute({List<_i31.PageRouteInfo>? children})
      : super(ClientBookingServiceHostRoute.name, initialChildren: children);

  static const String name = 'ClientBookingServiceHostRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i4.ClientBookingServiceHostScreen();
    },
  );
}

/// generated route for
/// [_i5.ClientBookingSuccessScreen]
class ClientBookingSuccessRoute
    extends _i31.PageRouteInfo<ClientBookingSuccessRouteArgs> {
  ClientBookingSuccessRoute({
    _i32.Key? key,
    required _i34.BookingFlowData flowData,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ClientBookingSuccessRoute.name,
          args: ClientBookingSuccessRouteArgs(key: key, flowData: flowData),
          initialChildren: children,
        );

  static const String name = 'ClientBookingSuccessRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientBookingSuccessRouteArgs>();
      return _i5.ClientBookingSuccessScreen(
        key: args.key,
        flowData: args.flowData,
      );
    },
  );
}

class ClientBookingSuccessRouteArgs {
  const ClientBookingSuccessRouteArgs({this.key, required this.flowData});

  final _i32.Key? key;

  final _i34.BookingFlowData flowData;

  @override
  String toString() {
    return 'ClientBookingSuccessRouteArgs{key: $key, flowData: $flowData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClientBookingSuccessRouteArgs) return false;
    return key == other.key && flowData == other.flowData;
  }

  @override
  int get hashCode => key.hashCode ^ flowData.hashCode;
}

/// generated route for
/// [_i6.ClientEditProfileScreen]
class ClientEditProfileRoute extends _i31.PageRouteInfo<void> {
  const ClientEditProfileRoute({List<_i31.PageRouteInfo>? children})
      : super(ClientEditProfileRoute.name, initialChildren: children);

  static const String name = 'ClientEditProfileRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i6.ClientEditProfileScreen();
    },
  );
}

/// generated route for
/// [_i7.ClientMainScreen]
class ClientMainRoute extends _i31.PageRouteInfo<void> {
  const ClientMainRoute({List<_i31.PageRouteInfo>? children})
      : super(ClientMainRoute.name, initialChildren: children);

  static const String name = 'ClientMainRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i7.ClientMainScreen();
    },
  );
}

/// generated route for
/// [_i8.ClientManagePreferencesScreen]
class ClientManagePreferencesRoute extends _i31.PageRouteInfo<void> {
  const ClientManagePreferencesRoute({List<_i31.PageRouteInfo>? children})
      : super(ClientManagePreferencesRoute.name, initialChildren: children);

  static const String name = 'ClientManagePreferencesRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i8.ClientManagePreferencesScreen();
    },
  );
}

/// generated route for
/// [_i9.ClientMapViewScreen]
class ClientMapViewRoute extends _i31.PageRouteInfo<ClientMapViewRouteArgs> {
  ClientMapViewRoute({
    bool myLocationButtonEnabled = true,
    _i32.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ClientMapViewRoute.name,
          args: ClientMapViewRouteArgs(
            myLocationButtonEnabled: myLocationButtonEnabled,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ClientMapViewRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientMapViewRouteArgs>(
        orElse: () => const ClientMapViewRouteArgs(),
      );
      return _i9.ClientMapViewScreen(
        myLocationButtonEnabled: args.myLocationButtonEnabled,
        key: args.key,
      );
    },
  );
}

class ClientMapViewRouteArgs {
  const ClientMapViewRouteArgs({this.myLocationButtonEnabled = true, this.key});

  final bool myLocationButtonEnabled;

  final _i32.Key? key;

  @override
  String toString() {
    return 'ClientMapViewRouteArgs{myLocationButtonEnabled: $myLocationButtonEnabled, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClientMapViewRouteArgs) return false;
    return myLocationButtonEnabled == other.myLocationButtonEnabled &&
        key == other.key;
  }

  @override
  int get hashCode => myLocationButtonEnabled.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i10.ClientNotificationPreferencesScreen]
class ClientNotificationPreferencesRoute extends _i31.PageRouteInfo<void> {
  const ClientNotificationPreferencesRoute({List<_i31.PageRouteInfo>? children})
      : super(ClientNotificationPreferencesRoute.name,
            initialChildren: children);

  static const String name = 'ClientNotificationPreferencesRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i10.ClientNotificationPreferencesScreen();
    },
  );
}

/// generated route for
/// [_i11.ClientPaymentSuccessScreen]
class ClientPaymentSuccessRoute
    extends _i31.PageRouteInfo<ClientPaymentSuccessRouteArgs> {
  ClientPaymentSuccessRoute({
    _i32.Key? key,
    required _i34.BookingFlowData flowData,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ClientPaymentSuccessRoute.name,
          args: ClientPaymentSuccessRouteArgs(key: key, flowData: flowData),
          initialChildren: children,
        );

  static const String name = 'ClientPaymentSuccessRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientPaymentSuccessRouteArgs>();
      return _i11.ClientPaymentSuccessScreen(
        key: args.key,
        flowData: args.flowData,
      );
    },
  );
}

class ClientPaymentSuccessRouteArgs {
  const ClientPaymentSuccessRouteArgs({this.key, required this.flowData});

  final _i32.Key? key;

  final _i34.BookingFlowData flowData;

  @override
  String toString() {
    return 'ClientPaymentSuccessRouteArgs{key: $key, flowData: $flowData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClientPaymentSuccessRouteArgs) return false;
    return key == other.key && flowData == other.flowData;
  }

  @override
  int get hashCode => key.hashCode ^ flowData.hashCode;
}

/// generated route for
/// [_i12.ClientPrivacySecurityScreen]
class ClientPrivacySecurityRoute extends _i31.PageRouteInfo<void> {
  const ClientPrivacySecurityRoute({List<_i31.PageRouteInfo>? children})
      : super(ClientPrivacySecurityRoute.name, initialChildren: children);

  static const String name = 'ClientPrivacySecurityRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i12.ClientPrivacySecurityScreen();
    },
  );
}

/// generated route for
/// [_i13.ClientSecurePaymentScreen]
class ClientSecurePaymentRoute
    extends _i31.PageRouteInfo<ClientSecurePaymentRouteArgs> {
  ClientSecurePaymentRoute({
    _i32.Key? key,
    required _i34.BookingFlowData flowData,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ClientSecurePaymentRoute.name,
          args: ClientSecurePaymentRouteArgs(key: key, flowData: flowData),
          initialChildren: children,
        );

  static const String name = 'ClientSecurePaymentRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientSecurePaymentRouteArgs>();
      return _i13.ClientSecurePaymentScreen(
        key: args.key,
        flowData: args.flowData,
      );
    },
  );
}

class ClientSecurePaymentRouteArgs {
  const ClientSecurePaymentRouteArgs({this.key, required this.flowData});

  final _i32.Key? key;

  final _i34.BookingFlowData flowData;

  @override
  String toString() {
    return 'ClientSecurePaymentRouteArgs{key: $key, flowData: $flowData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClientSecurePaymentRouteArgs) return false;
    return key == other.key && flowData == other.flowData;
  }

  @override
  int get hashCode => key.hashCode ^ flowData.hashCode;
}

/// generated route for
/// [_i14.ClientStaffInfoScreen]
class ClientStaffInfoRoute
    extends _i31.PageRouteInfo<ClientStaffInfoRouteArgs> {
  ClientStaffInfoRoute({
    _i32.Key? key,
    required _i34.StaffModel staff,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ClientStaffInfoRoute.name,
          args: ClientStaffInfoRouteArgs(key: key, staff: staff),
          initialChildren: children,
        );

  static const String name = 'ClientStaffInfoRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientStaffInfoRouteArgs>();
      return _i14.ClientStaffInfoScreen(key: args.key, staff: args.staff);
    },
  );
}

class ClientStaffInfoRouteArgs {
  const ClientStaffInfoRouteArgs({this.key, required this.staff});

  final _i32.Key? key;

  final _i34.StaffModel staff;

  @override
  String toString() {
    return 'ClientStaffInfoRouteArgs{key: $key, staff: $staff}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClientStaffInfoRouteArgs) return false;
    return key == other.key && staff == other.staff;
  }

  @override
  int get hashCode => key.hashCode ^ staff.hashCode;
}

/// generated route for
/// [_i15.ExploreScreen]
class ExploreRoute extends _i31.PageRouteInfo<void> {
  const ExploreRoute({List<_i31.PageRouteInfo>? children})
      : super(ExploreRoute.name, initialChildren: children);

  static const String name = 'ExploreRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i15.ExploreScreen();
    },
  );
}

/// generated route for
/// [_i16.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i31.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i31.PageRouteInfo>? children})
      : super(ForgetPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgetPasswordRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i16.ForgetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i17.NotificationsScreen]
class NotificationsRoute extends _i31.PageRouteInfo<void> {
  const NotificationsRoute({List<_i31.PageRouteInfo>? children})
      : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i17.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i18.OffersScreen]
class OffersRoute extends _i31.PageRouteInfo<void> {
  const OffersRoute({List<_i31.PageRouteInfo>? children})
      : super(OffersRoute.name, initialChildren: children);

  static const String name = 'OffersRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i18.OffersScreen();
    },
  );
}

/// generated route for
/// [_i19.OnboardingScreen]
class OnboardingRoute extends _i31.PageRouteInfo<void> {
  const OnboardingRoute({List<_i31.PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i19.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i20.OtpVerificationScreen]
class OtpVerificationRoute
    extends _i31.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    _i35.Key? key,
    required _i20.VerificationType verificationType,
    required String contactInfo,
    String? phoneNumber,
    List<_i31.PageRouteInfo>? children,
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

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return _i20.OtpVerificationScreen(
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

  final _i35.Key? key;

  final _i20.VerificationType verificationType;

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
/// [_i21.ProviderDetailsScreen]
class ProviderDetailsRoute
    extends _i31.PageRouteInfo<ProviderDetailsRouteArgs> {
  ProviderDetailsRoute({
    _i32.Key? key,
    required String providerId,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ProviderDetailsRoute.name,
          args: ProviderDetailsRouteArgs(key: key, providerId: providerId),
          initialChildren: children,
        );

  static const String name = 'ProviderDetailsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProviderDetailsRouteArgs>();
      return _i21.ProviderDetailsScreen(
        key: args.key,
        providerId: args.providerId,
      );
    },
  );
}

class ProviderDetailsRouteArgs {
  const ProviderDetailsRouteArgs({this.key, required this.providerId});

  final _i32.Key? key;

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
/// [_i22.ResetPasswordScreen]
class ResetPasswordRoute extends _i31.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i31.PageRouteInfo>? children})
      : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i22.ResetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i23.SettingScreen]
class SettingRoute extends _i31.PageRouteInfo<void> {
  const SettingRoute({List<_i31.PageRouteInfo>? children})
      : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i23.SettingScreen();
    },
  );
}

/// generated route for
/// [_i24.SplashScreen]
class SplashRoute extends _i31.PageRouteInfo<void> {
  const SplashRoute({List<_i31.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i24.SplashScreen();
    },
  );
}

/// generated route for
/// [_i25.StaffBookingDetailsScreen]
class StaffBookingDetailsRoute
    extends _i31.PageRouteInfo<StaffBookingDetailsRouteArgs> {
  StaffBookingDetailsRoute({
    _i32.Key? key,
    required _i36.BookingModel booking,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          StaffBookingDetailsRoute.name,
          args: StaffBookingDetailsRouteArgs(key: key, booking: booking),
          initialChildren: children,
        );

  static const String name = 'StaffBookingDetailsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StaffBookingDetailsRouteArgs>();
      return _i25.StaffBookingDetailsScreen(
        key: args.key,
        booking: args.booking,
      );
    },
  );
}

class StaffBookingDetailsRouteArgs {
  const StaffBookingDetailsRouteArgs({this.key, required this.booking});

  final _i32.Key? key;

  final _i36.BookingModel booking;

  @override
  String toString() {
    return 'StaffBookingDetailsRouteArgs{key: $key, booking: $booking}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StaffBookingDetailsRouteArgs) return false;
    return key == other.key && booking == other.booking;
  }

  @override
  int get hashCode => key.hashCode ^ booking.hashCode;
}

/// generated route for
/// [_i26.StaffMainScreen]
class StaffMainRoute extends _i31.PageRouteInfo<void> {
  const StaffMainRoute({List<_i31.PageRouteInfo>? children})
      : super(StaffMainRoute.name, initialChildren: children);

  static const String name = 'StaffMainRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i26.StaffMainScreen();
    },
  );
}

/// generated route for
/// [_i27.StaffProfileScreen]
class StaffProfileRoute extends _i31.PageRouteInfo<void> {
  const StaffProfileRoute({List<_i31.PageRouteInfo>? children})
      : super(StaffProfileRoute.name, initialChildren: children);

  static const String name = 'StaffProfileRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i27.StaffProfileScreen();
    },
  );
}

/// generated route for
/// [_i28.StaffReviewsScreen]
class StaffReviewsRoute extends _i31.PageRouteInfo<void> {
  const StaffReviewsRoute({List<_i31.PageRouteInfo>? children})
      : super(StaffReviewsRoute.name, initialChildren: children);

  static const String name = 'StaffReviewsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i28.StaffReviewsScreen();
    },
  );
}

/// generated route for
/// [_i29.ViewAllOffersScreen]
class ViewAllOffersRoute extends _i31.PageRouteInfo<ViewAllOffersRouteArgs> {
  ViewAllOffersRoute({
    _i32.Key? key,
    required List<_i37.ProviderModel> providers,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ViewAllOffersRoute.name,
          args: ViewAllOffersRouteArgs(key: key, providers: providers),
          initialChildren: children,
        );

  static const String name = 'ViewAllOffersRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ViewAllOffersRouteArgs>();
      return _i29.ViewAllOffersScreen(key: args.key, providers: args.providers);
    },
  );
}

class ViewAllOffersRouteArgs {
  const ViewAllOffersRouteArgs({this.key, required this.providers});

  final _i32.Key? key;

  final List<_i37.ProviderModel> providers;

  @override
  String toString() {
    return 'ViewAllOffersRouteArgs{key: $key, providers: $providers}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ViewAllOffersRouteArgs) return false;
    return key == other.key &&
        const _i38.ListEquality<_i37.ProviderModel>().equals(
          providers,
          other.providers,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i38.ListEquality<_i37.ProviderModel>().hash(providers);
}

/// generated route for
/// [_i30.ViewAllProvidersScreen]
class ViewAllProvidersRoute
    extends _i31.PageRouteInfo<ViewAllProvidersRouteArgs> {
  ViewAllProvidersRoute({
    _i32.Key? key,
    required List<_i37.ProviderModel> providers,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ViewAllProvidersRoute.name,
          args: ViewAllProvidersRouteArgs(key: key, providers: providers),
          initialChildren: children,
        );

  static const String name = 'ViewAllProvidersRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ViewAllProvidersRouteArgs>();
      return _i30.ViewAllProvidersScreen(
        key: args.key,
        providers: args.providers,
      );
    },
  );
}

class ViewAllProvidersRouteArgs {
  const ViewAllProvidersRouteArgs({this.key, required this.providers});

  final _i32.Key? key;

  final List<_i37.ProviderModel> providers;

  @override
  String toString() {
    return 'ViewAllProvidersRouteArgs{key: $key, providers: $providers}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ViewAllProvidersRouteArgs) return false;
    return key == other.key &&
        const _i38.ListEquality<_i37.ProviderModel>().equals(
          providers,
          other.providers,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i38.ListEquality<_i37.ProviderModel>().hash(providers);
}
