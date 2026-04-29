import 'dart:io';

import 'package:dio/dio.dart';

import '../data/user_pref.dart';
import '../services/unauthorized_service.dart';
import 'endpoints.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;
  static Future<bool>? _refreshFuture;

  DioInterceptor(this.dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response == null) {
      return handler.next(err);
    }
    final response = err.response!;
    final isUnauthorized = response.statusCode == HttpStatus.unauthorized;
    final isForbidden = response.statusCode == HttpStatus.forbidden;

    // Protection against infinite loops
    if (err.requestOptions.extra['isRetry'] == true) {
      return handler.next(err);
    }

    if (isUnauthorized && UserPrefs.isUserLoggedIn) {
      // Avoid infinite loop if refresh token itself fails
      if (response.requestOptions.path.contains(Endpoints.refreshToken)) {
        await _handleLogout();
        return handler.next(err);
      }

      final success = await _refreshToken();
      if (success) {
        // Retry the request with the new token
        try {
          final retryResponse = await _retry(response.requestOptions);
          return handler.resolve(retryResponse);
        } catch (e) {
          return handler.next(err);
        }
      } else {
        await _handleLogout();
        return handler.next(err);
      }
    } else if (isForbidden && UserPrefs.isUserLoggedIn) {
      await _handleLogout();
      return handler.next(err);
    }

    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    if (_refreshFuture != null) {
      return _refreshFuture!;
    }

    _refreshFuture = _doRefresh();
    try {
      final result = await _refreshFuture!;
      return result;
    } finally {
      _refreshFuture = null;
    }
  }

  Future<bool> _doRefresh() async {
    try {
      final refreshToken = UserPrefs.getRefreshToken();
      if (refreshToken.isEmpty) return false;

      // Use a separate Dio instance to avoid interceptors
      final refreshDio = Dio(BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ));

      final response = await refreshDio.post(
        Endpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final resData = response.data;
        final newToken = resData['token'];
        final newRefreshToken = resData['refreshToken'];

        if (newToken != null) {
          await UserPrefs.setUserToken(newToken);
          if (newRefreshToken != null) {
            await UserPrefs.setRefreshToken(newRefreshToken);
          }
          return true;
        }
      }
    } catch (e) {
      // Log error if needed
    }
    return false;
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = requestOptions;
    if (options.headers.containsKey('Authorization')) {
      options.headers['Authorization'] = UserPrefs.getUserToken();
    }
    options.extra['isRetry'] = true;

    return dio.fetch(options);
  }

  Future<void> _handleLogout() async {
    if (UserPrefs.isUserLoggedIn) {
      UnAuthorizedService.event.fire(HttpStatus.unauthorized);
    }
  }
}
