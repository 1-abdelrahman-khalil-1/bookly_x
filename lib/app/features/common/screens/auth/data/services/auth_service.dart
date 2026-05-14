import 'package:bookly_x_client/app/core/api_helper/dio_client.dart';
import 'package:bookly_x_client/app/core/api_helper/dio_providers.dart';
import 'package:bookly_x_client/app/core/api_helper/endpoints.dart';
import 'package:bookly_x_client/app/core/api_helper/handle_errors_response.dart';
import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider =
    Provider((ref) => AuthService(ref.watch(dioClientProvider)));

class AuthService {
  final DioClient _dio;
  const AuthService(this._dio);
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      Endpoints.login,
      body: {
        "email": email,
        "password": password,
        "role": UserPrefs.isUserStaff ? 'staff' : 'client',
      },
    );
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode!,
      response: res,
    );
    final data = res['data'];
    String token = data['token'];
    String refreshToken = data['refresh_token'];
    await UserPrefs.setUserToken(token);
    await UserPrefs.setRefreshToken(refreshToken);
    await UserPrefs.setUser(data['user']);
  }

  Future<void> refreshToken() async {
    final response = await _dio.post(
      Endpoints.refreshToken,
      body: {
        "refresh_token": UserPrefs.getRefreshToken(),
      },
      attachToken: false,
    );
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode!,
      response: res,
    );
    final data = res['data'];
    String token = data['token'];
    String refreshToken = data['refresh_token'];

    await UserPrefs.setUserToken(token);
    await UserPrefs.setRefreshToken(refreshToken);
  }
}
