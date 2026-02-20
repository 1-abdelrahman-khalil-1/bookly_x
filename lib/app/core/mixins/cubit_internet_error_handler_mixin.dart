import 'dart:developer';

import 'package:bookly_x_client/app/core/api_helper/exceptions.dart';
import 'package:bookly_x_client/app/core/services/internet_error_service.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin CubitInternetErrorHandlerMixin<T> on Cubit<T> {
  /// Centralized exception handler
  void handleException(Object exception,
      {T Function(String message)? errorState}) {
    // Internet / network error
    if (InternetErrorService.handleException(exception)) {
      return;
    }

    // API error
    final message = exception is ApiExceptionMessage
        ? exception.message
        : tr.somethingHappenedError;

    if (errorState != null) {
      emit(errorState(message ?? tr.somethingHappenedError));
    }

    log('Error: $exception',
        name: '${runtimeType}_handleException', stackTrace: StackTrace.current);
  }

  /// Execute async operation with state + error handling
  Future<bool> execute(
    Future<T> Function() operation, {
    T? loadingState,
    T? successState,
    T Function(String message)? errorState,
  }) async {
    if (loadingState != null) {
      emit(loadingState);
    }

    try {
      final result = await operation();
      if (successState != null) {
        emit(successState);
      } else {
        emit(result);
      }
      return true;
    } catch (e) {
      handleException(e, errorState: errorState);
      return false;
    }
  }

  /// Execute async operation that doesn't return data
  Future<bool> executeVoid(
    Future<void> Function() operation, {
    T? loadingState,
    T? successState,
    T Function(String message)? errorState,
  }) async {
    if (loadingState != null) {
      emit(loadingState);
    }

    try {
      await operation();
      if (successState != null) {
        emit(successState);
      }
      return true;
    } catch (e) {
      handleException(e, errorState: errorState);
      return false;
    }
  }
}
