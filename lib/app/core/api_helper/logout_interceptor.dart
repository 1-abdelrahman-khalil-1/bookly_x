import 'dart:developer';
import 'dart:io';

import 'package:bookly_x_client/app/core/data/agent_pref.dart';
import 'package:bookly_x_client/app/core/data/lang_pref.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/user_pref.dart';
import '../services/unauthorized_service.dart';
import 'endpoints.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;
  final LangPrefs langPrefs;
  static Future<bool>? _refreshFuture;

  DioInterceptor(this.dio, {required this.langPrefs});

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
        headers: {
          'Accept-Language': langPrefs.locale.toString(),
          'platform': "APP",
          'User-Agent': UserAgentPrefs.getUserAgent,
        },
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ));

      refreshDio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          logPrint: (object) => log(object.toString(), name: 'Refresh Token'),
        ),
      );

      final response = await refreshDio.post(
        Endpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final resData = response.data;
        final newToken = resData['data']['token'];
        final newRefreshToken = resData['data']['refreshToken'];

        if (newToken != null) {
          await UserPrefs.setUserToken(newToken);
          if (newRefreshToken != null) {
            await UserPrefs.setRefreshToken(newRefreshToken);
          }
          return true;
        }
      }
    } catch (e) {}
    return false;
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: {
          ...requestOptions.headers,
          'Authorization': UserPrefs.getUserToken(),
        },
        extra: {
          ...requestOptions.extra,
          'isRetry': true,
        },
      ),
    );
  }

  Future<void> _handleLogout() async {
    if (UserPrefs.isUserLoggedIn) {
      UnAuthorizedService.event.fire(HttpStatus.unauthorized);
    }
  }
}
