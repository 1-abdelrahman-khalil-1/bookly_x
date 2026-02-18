import 'package:bookly_x_client/bookly_x_client_app.dart';
import 'package:flutter/material.dart';

import '../enums/snack_bar.dart';
import '../extensions/custom_snack_bar.dart';

BuildContext get currContext => appRouter.navigatorKey.currentContext!;

void setMessage(
  String message, {
  SnackBarStatus snackBarStatus = SnackBarStatus.error,
}) {
  currContext.showCustomSnackBar(
    snackBarStatus: snackBarStatus,
    message: message,
  );
}

void setErrorMessage(
  String message, {
  SnackBarStatus snackBarStatus = SnackBarStatus.error,
}) {
  currContext.showCustomSnackBar(message: message);
}

void setSuccessfullyMessage(String message) {
  currContext.showCustomSnackBar(
    snackBarStatus: SnackBarStatus.success,
    message: message,
  );
}

void setWarningMessage(String message) {
  currContext.showCustomSnackBar(
    snackBarStatus: SnackBarStatus.warning,
    message: message,
  );
}
