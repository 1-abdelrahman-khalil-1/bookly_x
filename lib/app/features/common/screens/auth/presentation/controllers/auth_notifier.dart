import 'package:bookly_x_client/app/core/mixins/internet_error_handler_mixin.dart';
import 'package:bookly_x_client/app/core/models/general_state.dart';
import 'package:bookly_x_client/app/features/common/screens/auth/data/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, GeneralState>((ref) {
  return AuthNotifier(ref.watch(authServiceProvider));
});

class AuthNotifier extends StateNotifier<GeneralState<bool>>
    with InternetErrorHandlerMixin {
  AuthNotifier(this._authService) : super(const GeneralState());
  final AuthService _authService;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    return await executeVoid(() async => await _authService.login(
          email: email,
          password: password,
        ));
  }
}
