import 'package:bookly_x_client/app/core/api_helper/dio_client.dart';
import 'package:bookly_x_client/app/core/api_helper/dio_providers.dart';
import 'package:bookly_x_client/app/core/api_helper/endpoints.dart';
import 'package:bookly_x_client/app/core/api_helper/handle_errors_response.dart';
import 'package:bookly_x_client/app/core/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resetPasswordServiceProvider = Provider<ResetPasswordService>(
  (ref) => ResetPasswordService(ref.read(dioClientProvider)),
);

class ResetPasswordService {
  final DioClient _dio;
  const ResetPasswordService(this._dio);

  /// Step 1: Request a password reset code sent to [email].
  Future<void> requestPasswordReset({required String email}) async {
    final response = await _dio.post(
      Endpoints.requestPasswordReset,
      body: {'email': email},
      attachToken: false,
    );
    final res = response.data as Json;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
  }

  /// Step 2: Verify OTP and receive the reset token.
  /// Returns the [resetToken] string on success.
  Future<String> verifyPasswordReset({
    required String email,
    required String code,
  }) async {
    final response = await _dio.post(
      Endpoints.verifyPasswordReset,
      body: {'email': email, 'code': code},
    );
    final res = response.data as Json;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
    final data = res['data'] as Json;
    return data['resetToken'] as String;
  }

  /// Step 3: Reset the password using [resetToken] and [newPassword].
  Future<void> resetPassword({
    required String resetToken,
    required String newPassword,
  }) async {
    final response = await _dio.post(
      Endpoints.resetPassword,
      body: {
        'resetToken': resetToken,
        'newPassword': newPassword,
      },
    );
    final res = response.data as Json;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
  }
}
