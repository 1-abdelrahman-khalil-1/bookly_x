import 'dart:io';

import 'package:dio/dio.dart';

import '../../../generated/translations.g.dart';

class ResponseClient<T> {
  late T? data;
  late String message;
  late int status;
  late bool isError;

  ResponseClient(Response<dynamic> response) {
    final map = response.data as Map<String, dynamic>;
    if (response.statusCode != HttpStatus.ok || map['error'] as bool) {
      isError = true;
      message = (map['msg'] ?? tr.errorOccurred) as String;
    }
    data = map['data'] as T;
    message = map['msg'] as String;
    status =
        map['status'] != null ? (map['status'] as int) : response.statusCode!;
    isError = map['error'] as bool;
  }
}
