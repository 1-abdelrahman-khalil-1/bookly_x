import 'package:dio/dio.dart';

import '../../../generated/translations.g.dart';

abstract class ApiException implements Exception {}

class ApiExceptionMessage implements ApiException {
  final String? message;

  ApiExceptionMessage([this.message]);

  @override
  String toString() => message ?? tr.errorOccurred;
}

class EmptyBadResponse implements ApiException {
  @override
  String toString() => tr.somethingWentWrong;
}

class NoInternetConnection implements ApiException {
  @override
  String toString() {
    return tr.noInternet;
  }
}

// make class for connection error
class ConnectionError implements ApiException {
  @override
  String toString() {
    return tr.noInternet;
  }
}

class InternalServerError implements ApiException {
  @override
  String toString() => tr.somethingWentWrong;
}

class BadRequest implements InternalServerError {
  final Response<Map<String, dynamic>> res;

  BadRequest(this.res);
}

class UnAuthorized implements ApiException {
  final Response res;

  UnAuthorized(this.res);

  @override
  String toString() {
    return (res.data as Map<String, dynamic>)['Message'].toString();
  }
}

class Banned implements ApiException {
  final Response res;

  Banned(this.res);

  @override
  String toString() {
    return (res.data as Map<String, dynamic>)['Message'].toString();
  }
}
