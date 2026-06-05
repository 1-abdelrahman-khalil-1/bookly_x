import 'package:bookly_x/app/core/utils/show_message.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:intl_phone_field/countries.dart';

class ValidationHelper {
  ValidationHelper._();

  static String? validateFullName(String? value, {bool showWarning = false}) {
    final words = value?.trim().split(RegExp(r'\s+'));
    if (value?.isEmpty ?? true) {
      if (showWarning) {
        setWarningMessage(tr.fullNameRequired);
        return null;
      }
      return tr.youForgotThisField;
    } else if (words!.length < 2) {
      return tr.fullNameShouldBeAtLeastTwoWords;
    } else {
      return null;
    }
  }

  static String? validateEmail(String? email, {bool showWarning = false}) {
    if (email?.isEmpty ?? true) {
      if (showWarning) {
        setWarningMessage(tr.emailRequired);
        return null;
      }
      return tr.youForgotThisField;
    }
    final bool isValid = EmailValidator.validate(email!);
    if (!isValid) {
      return tr.emailIsNotValid;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword,
      {bool showWarning = false}) {
    if (password?.isEmpty ?? true) {
      if (showWarning) {
        setWarningMessage(tr.passwordRequired);
        return null;
      }
      return tr.youForgotThisField;
    } else if (password != confirmPassword) {
      if (showWarning) {
        setWarningMessage(tr.passwordsDoNotMatch);
        return null;
      }
      return tr.passwordsDoNotMatch;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password,
      {bool showWarning = false}) {
    if (password?.isEmpty ?? true) {
      if (showWarning) {
        setWarningMessage(tr.passwordRequired);
        return null;
      }
      return tr.youForgotThisField;
    } else if (password!.length < 8) {
      if (showWarning) {
        setWarningMessage(tr.passwordShouldBeAtLeast8);
        return null;
      }
      return tr.passwordShouldBeAtLeast8;
    } else if (kDebugMode) {
      return null;
    } else if (!password.contains(RegExp(r'[A-Za-z]'))) {
      if (showWarning) {
        setWarningMessage(tr.passwordShouldContainAtLeastOneCharacter);
        return null;
      }
      return tr.passwordShouldContainAtLeastOneCharacter;
    } else if (!password.contains(RegExp(r'[0-9]'))) {
      if (showWarning) {
        setWarningMessage(tr.passwordShouldContainAtLeastOneNumber);
        return null;
      }
      return tr.passwordShouldContainAtLeastOneNumber;
    } else {
      return null;
    }
  }

  String? isValidPhoneNumber(String? phoneNumber, Country country,
      {bool showWarning = false}) {
    if (phoneNumber?.isEmpty ?? true) {
      if (showWarning) {
        setWarningMessage(tr.phoneNumberRequired);
        return null;
      }
      return tr.youForgotThisField;
    }
    return null;
  }

  static String? validateEndTime(String startTime, String endTime,
      {bool showWarning = false}) {
    if (startTime.isEmpty || endTime.isEmpty) {
      return null;
    }
    final startParts = startTime.split(':');
    final endParts = endTime.split(':');

    final startHour = int.parse(startParts[0]);
    final startMinute = int.parse(startParts[1]);
    final endHour = int.parse(endParts[0]);
    final endMinute = int.parse(endParts[1]);

    final startTotalMinutes = startHour * 60 + startMinute;
    final endTotalMinutes = endHour * 60 + endMinute;

    if (endTotalMinutes <= startTotalMinutes) {
      if (showWarning) {
        setWarningMessage(tr.endTimeMustBeAfterStartTime);
        return null;
      }
      return tr.endTimeMustBeAfterStartTime;
    }
    return null;
  }
}
