import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/app/core/mixins/internet_error_handler_mixin.dart';
import 'package:bookly_x_client/app/core/models/general_state.dart';
import 'package:bookly_x_client/app/features/common/reset_password/data/service/reset_password_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resetPasswordNotifierProvider =
    StateNotifierProvider<ResetPasswordNotifier, GeneralState<void>>(
  (ref) => ResetPasswordNotifier(ref.read(resetPasswordServiceProvider)),
);

class ResetPasswordNotifier extends StateNotifier<GeneralState<void>>
    with InternetErrorHandlerMixin<void> {
  final ResetPasswordService _repository;

  ResetPasswordNotifier(this._repository) : super(const GeneralState());

  String _email = '';
  String _otp = '';

  void setEmail(String email) => _email = email;
  void setOtp(String otp) => _otp = otp;

  /// Step 1 — Send reset code to email.
  Future<bool> requestPasswordReset() async {
    return executeVoid(
      () => _repository.requestPasswordReset(email: _email),
    );
  }

  /// Step 2 — Verify OTP and store the reset token.
  Future<bool> verifyPasswordReset() async {
    return executeVoid(() async {
      final resetToken = await _repository.verifyPasswordReset(
        email: _email,
        code: _otp,
      );
      await UserPrefs.setPasswordResetToken(resetToken);
    });
  }

  /// Step 3 — Set a new password using the stored reset token.
  Future<bool> resetPassword({required String newPassword}) async {
    return executeVoid(() async {
      final resetToken = UserPrefs.getPasswordResetToken();
      await _repository.resetPassword(
        resetToken: resetToken,
        newPassword: newPassword,
      );
      await UserPrefs.setPasswordResetToken('');
    });
  }
}
