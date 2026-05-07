import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../data/agent_pref.dart';
import '../data/lang_pref.dart';
import '../data/user_pref.dart';
import 'exceptions.dart';

/// wrapper around dio to handlers api calls
class DioClient {
  final LangPrefs langPrefs;
  Dio? dio;

  DioClient({required this.dio, required this.langPrefs});

  Future<String> get userToken async => UserPrefs.getUserToken();

  /// sends a [GET] request to the given [url]

  Future<Response> get(
    String path, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
    String? token,
  }) =>
      validateResponse(
        () async => dio!.get(
          path,
          queryParameters: {...query},
          options: Options(
            headers: {
              if (attachToken) 'Authorization': token ?? await userToken,
              ...headers,
              'platform': "APP",
              'Accept-Language': langPrefs.locale.toString(),
              'User-Agent': UserAgentPrefs.getUserAgent,
              // if (LocationPrefs.getUserDistrictId() != -1)
              //   'district-id': LocationPrefs.getUserDistrictId(),
            },
          ),
        ),
      );

  Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
    String? token,
  }) =>
      validateResponse(
        () async => dio!.post(
          path,
          queryParameters: {...query},
          data: body,
          options: Options(
            headers: {
              'Accept-Language': langPrefs.locale.toString(),
              'platform': "APP",
              if (attachToken) 'Authorization': token ?? await userToken,
              'User-Agent': UserAgentPrefs.getUserAgent,
              ...headers,
              // if (LocationPrefs.getUserDistrictId() != -1)
              //   'district-id': LocationPrefs.getUserDistrictId(),
            },
          ),
        ),
      );

  Future<Response> delete(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
    String? token,
  }) =>
      validateResponse(
        () async => dio!.delete(
          path,
          queryParameters: {...query},
          data: body,
          options: Options(
            headers: {
              'Accept-Language': langPrefs.locale.toString(),
              'platform': "APP",
              if (attachToken) 'Authorization': token ?? await userToken,
              'User-Agent': UserAgentPrefs.getUserAgent,
              ...headers,
              // if (LocationPrefs.getUserDistrictId() != -1)
              //   'district-id': LocationPrefs.getUserDistrictId(),
            },
          ),
        ),
      );

  Future<Response> put(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
    String? token,
  }) =>
      validateResponse(
        () async => dio!.put(
          path,
          queryParameters: {...query},
          data: body,
          options: Options(
            headers: {
              'Accept-Language': langPrefs.locale.toString(),
              'platform': "APP",
              'User-Agent': UserAgentPrefs.getUserAgent,
              if (attachToken) 'Authorization': token ?? await userToken,
              ...headers,
              // if (LocationPrefs.getUserDistrictId() != -1)
              //   'district-id': LocationPrefs.getUserDistrictId(),
            },
          ),
        ),
      );

  Future<Response> patch(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
    String? token,
  }) =>
      validateResponse(
        () async => dio!.patch(
          path,
          queryParameters: {...query},
          data: body,
          options: Options(
            headers: {
              'Accept-Language': langPrefs.locale.toString(),
              'User-Agent': UserAgentPrefs.getUserAgent,
              if (attachToken) 'Authorization': token ?? await userToken,
              ...headers,
              // if (LocationPrefs.getUserDistrictId() != -1)
              //   'district-id': LocationPrefs.getUserDistrictId(),
            },
          ),
        ),
      );
}

Future<Response> validateResponse(Future<Response> Function() zone) async {
  try {
    final res = await zone();

    if (res.statusCode == 200 &&
        res.data != null &&
        res.data is String &&
        (res.data! as String).isEmpty) {
      throw EmptyBadResponse();
    }
    return res;
  } on DioException catch (e, st) {
    log(st.toString());

    // 1. Immediate connection errors
    if (e.type == DioExceptionType.connectionError) {
      throw NoInternetConnection();
    }

    // 2. Response errors
    if (e.response != null) {
      if (e.response?.statusCode == HttpStatus.internalServerError) {
        throw InternalServerError();
      }
      return e.response!;
    }

    // 3. Network checks for other errors
    final hasConnection = await InternetConnection().hasInternetAccess;
    if (!hasConnection) {
      throw NoInternetConnection();
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.unknown ||
        e.type == DioExceptionType.connectionError) {
      throw InternalServerError();
    }
    rethrow;
  }
}

Object? extractError(dynamic data) => data is Map ? data['msg'] : null;
