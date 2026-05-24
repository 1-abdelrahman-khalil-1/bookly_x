import 'package:bookly_x_client/app/core/api_helper/dio_client.dart';
import 'package:bookly_x_client/app/core/api_helper/dio_providers.dart';
import 'package:bookly_x_client/app/core/api_helper/endpoints.dart';
import 'package:bookly_x_client/app/core/api_helper/handle_errors_response.dart';
import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/app/core/models/user_model.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_availability_model.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_review_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staffProfileServiceProvider = Provider(
  (ref) => StaffProfileService(ref.watch(dioClientProvider)),
);

class StaffProfileService {
  final DioClient _dio;
  const StaffProfileService(this._dio);

  Future<UserModel> getProfile() async {
    final response = await _dio.get(Endpoints.staffProfile);
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode!,
      response: res,
    );
    final data = res['data'];
    await UserPrefs.setUser(data['user']);
    return UserModel.fromJson(data['user']);
  }

  Future<List<StaffReviewModel>> getStaffReviews({
    required int page,
    required int limit,
  }) async {
    final response = await _dio.get(
      Endpoints.staffReview,
      query: {
        'page': page,
        'limit': limit,
      },
    );
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
    final data = res['data'] as Map<String, dynamic>? ?? {};
    return (data['reviews'] as List)
        .map((e) => StaffReviewModel.fromJson(e))
        .toList();
  }

  Future<StaffAvailabilityModel> createAvailability({
    required int dayOfWeek,
    required String startTime,
    required String endTime,
  }) async {
    final response = await _dio.post(
      Endpoints.staffAvailability,
      body: {
        'day_of_week': dayOfWeek,
        'start_time': startTime,
        'end_time': endTime,
      },
    );
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
    return StaffAvailabilityModel.fromJson(
      res['data'] as Map<String, dynamic>? ?? {},
    );
  }

  Future<StaffAvailabilityModel> updateAvailability({
    required int availabilityId,
    int? dayOfWeek,
    String? startTime,
    String? endTime,
  }) async {
    final response = await _dio.put(
      '${Endpoints.staffAvailability}/$availabilityId',
      body: {
        if (dayOfWeek != null) 'day_of_week': dayOfWeek,
        if (startTime != null) 'start_time': startTime,
        if (endTime != null) 'end_time': endTime,
      },
    );
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
    return StaffAvailabilityModel.fromJson(
      res['data'] as Map<String, dynamic>? ?? {},
    );
  }

  Future<void> deleteAvailability(int availabilityId) async {
    final response = await _dio.delete(
      '${Endpoints.staffAvailability}/$availabilityId',
    );
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
  }
}
