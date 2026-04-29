import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/translations.g.dart';
import '../api_helper/exceptions.dart';
import '../models/general_state.dart';
import '../services/internet_error_service.dart';
import '../utils/show_message.dart';

mixin InternetErrorHandlerMixin<T> on StateNotifier<GeneralState<T>> {
  /// Centralized exception handler
  void _handleException(Object exception) {
    // Internet / network error
    if (InternetErrorService.handleException(exception)) {
      state = GeneralState.error(null);
      return;
    }

    // API error
    final message = exception is ApiExceptionMessage
        ? exception.message
        : tr.somethingWentWrong;

    state = GeneralState.error(message);
    log(
      'Error: $exception',
      name: '${runtimeType}_handleException',
      error: exception,
      stackTrace: StackTrace.current,
    );
    if (message != null) {
      setWarningMessage(message);
    }
  }

  /// Execute async operation with state + error handling
  Future<bool> execute(
    Future<T> Function() operation, {
    GeneralState<T>? loadingState,
    GeneralState<T>? successState,
  }) async {
    state = loadingState ?? GeneralState.loading();

    try {
      final result = await operation();
      state = successState ?? GeneralState.success(result);
      return true;
    } catch (e) {
      _handleException(e);
      return false;
    }
  }

  /// Execute async operation that doesn't return data
  Future<bool> executeVoid(
    Future<void> Function() operation, {
    GeneralState<T>? loadingState,
    GeneralState<T>? successState,
  }) async {
    state = loadingState ?? GeneralState.loading();

    try {
      await operation();
      state = successState ?? GeneralState.success(null);
      return true;
    } catch (e) {
      _handleException(e);
      return false;
    }
  }
}
