import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_helper/exceptions.dart';
import 'no_internet_screen.dart';
import 'server_error_screen.dart';

extension ONExt on WidgetRef {
  Widget watchWhen<T>({
    bool skipError = false,
    Widget Function()? loading,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = false,
    required Widget Function(T data) data,
    required ProviderBase<AsyncValue<T>> provider,
    Widget Function(Object error, StackTrace stackTrace)? error,
  }) {
    return watch(provider).when(
      data: data,
      skipError: skipError,
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      error: error ??
          (e, s) {
            log(e.toString(), stackTrace: s, name: 'watchWhen');
            if (e is NoInternetConnection) {
              return NoInternetScreen(
                isLoading: watch(provider).isLoading,
                onRetry: () => invalidate(provider),
              );
            } else {
              return ServerErrorScreen(
                isLoading: watch(provider).isLoading,
                onRetry: () => invalidate(provider),
              );
            }
          },
      loading: loading ??
          () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
