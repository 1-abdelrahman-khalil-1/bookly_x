import 'dart:io';
import 'package:bookly_x/app/core/api_helper/dio_client.dart';
import 'package:bookly_x/app/core/api_helper/dio_providers.dart';
import 'package:bookly_x/app/core/api_helper/endpoints.dart';
import 'package:bookly_x/app/core/api_helper/handle_errors_response.dart';
import 'package:bookly_x/app/core/data/user_pref.dart';
import 'package:bookly_x/app/core/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingServiceProvider =
    Provider((ref) => SettingService(ref.watch(dioClientProvider)));

class SettingService {
  final DioClient _dio;
  const SettingService(this._dio);

  Future<UserModel> getProfile() async {
    final response = await _dio.get(Endpoints.clientProfile);
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode!,
      response: res,
    );
    final data = res['data'];
    await UserPrefs.setUser(data);
    return UserModel.fromJson(data);
  }

  Future<void> updateProfile({
    required String name,
    File? profileImage,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      if (profileImage != null)
        'profile_image': await MultipartFile.fromFile(
          profileImage.path,
          filename: profileImage.path.split('/').last,
        ),
    });

    final response = await _dio.put(
      Endpoints.clientProfile,
      body: formData,
    );
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode!,
      response: res,
    );
    final data = res['data'];
    await UserPrefs.setUser(data);
  }
}
