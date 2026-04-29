import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/screens_not_related/server_error_screen.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/bookly_x_client_app.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

import '../api_helper/exceptions.dart';

/// Service to handle global internet connection errors
class InternetErrorService {
  /// Check if an exception is internet-related and show the no internet screen
  static bool handleException(dynamic exception, {VoidCallback? onRetry}) {
    if (exception is NoInternetConnection) {
      showNoInternetScreen(onRetry: onRetry);
      return true;
    } else if (exception is InternalServerError) {
      showServerErrorScreen(onRetry: onRetry);
      return true;
    }
    return false;
  }

  static void showServerErrorScreen({VoidCallback? onRetry}) {
    final context = appRouter.navigatorKey.currentContext;
    if (context == null) return;
    context.showCustomAlertDialog(
        dialog: ServerErrorScreen(
      isLoading: false,
      onRetry: () {
        onRetry?.call();
        context.pop();
      },
    ));
  }

  /// Show the no internet screen as a modal dialog
  static void showNoInternetScreen({VoidCallback? onRetry}) {
    final context = appRouter.navigatorKey.currentContext;
    if (context == null) return;
    context.showCustomAlertDialog(
        dialog: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          MyIcons.wifiBold,
          size: 100,
          color: Colors.grey,
        ),
        const Height(16),
        Text(
          tr.noInternetConnection,
          style: context.medium20,
        ),
        const Height(8),
        Text(
          tr.noInternetConnectionSubtitle,
          style: context.regular14,
        ),
        const Height(24),
        CustomButton(
          title: tr.tryAgain,
          onPress: () {
            onRetry?.call();
            context.pop();
          },
        ),
      ],
    ));
  }
}

/// Extension to easily handle internet errors in state notifiers
extension InternetErrorExtension on dynamic {
  /// Check if this exception is a NoInternetConnection and handle it
  bool handleAsInternetError({VoidCallback? onRetry}) {
    return InternetErrorService.handleException(this, onRetry: onRetry);
  }
}
