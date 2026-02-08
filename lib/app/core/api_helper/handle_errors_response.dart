import 'dart:io';

import '/app/core/api_helper/exceptions.dart';
import '/app/core/constants/constants.dart';
import '/app/core/constants/keys.dart';

class HandleErrorsResponse {
  static void handleErrorsResponse({
    required int? statusCode,
    required Json response,
  }) {
    if (statusCode != HttpStatus.ok && statusCode != HttpStatus.created) {
      final data = response[Keys.data];

      if (data is Json) {
        // Use a safe reference to avoid repeated lookups
        final errorContent = data[Keys.error];

        // Case 1: data -> errors -> message (List)
        if (errorContent is Json &&
            errorContent.isNotEmpty &&
            errorContent.entries.first.value is List &&
            errorContent.entries.first.value.isNotEmpty) {
          throw ApiExceptionMessage(
            errorContent.entries.first.value.first.toString(),
          );
        }

        // Case 2: data -> message (List or String)
        if (data.isNotEmpty) {
          final firstValue = data.entries.first.value;
          if (firstValue is List && firstValue.isNotEmpty) {
            throw ApiExceptionMessage(firstValue.first.toString());
          } else {
            throw ApiExceptionMessage(firstValue.toString());
          }
        }
      }

      // fallback
      throw ApiExceptionMessage(
        response[Keys.msg]?.toString() ?? 'Unexpected error occurred',
      );
    }
  }
}
