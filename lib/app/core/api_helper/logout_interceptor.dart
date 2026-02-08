import 'dart:io';

import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';

import '../data/user_pref.dart';

final logoutEventBus = EventBus();

class DioInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data is! Map) {
      handler.next(response);
      return;
    }
    final isDisabledUser = response.statusCode == HttpStatus.unauthorized ||
        response.statusCode == HttpStatus.forbidden;
    if (isDisabledUser && UserPrefs.isUserLoggedIn) {
      await UserPrefs.logout();
      logoutEventBus.fire(true);
      // Navigate to login would go here
      // appRouter.pushAndPopAll(LoginRoute());
    }
    handler.next(response);
  }
}
