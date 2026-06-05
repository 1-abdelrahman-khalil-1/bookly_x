import 'package:bookly_x/app/core/api_helper/dio_client.dart';
import 'package:bookly_x/app/core/api_helper/dio_providers.dart';
import 'package:bookly_x/app/core/api_helper/endpoints.dart';
import 'package:bookly_x/app/core/api_helper/handle_errors_response.dart';
import 'package:bookly_x/app/core/models/booking_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staffBookingServiceProvider = Provider<BookingService>(
    (ref) => BookingService(ref.watch(dioClientProvider)));

class BookingService {
  final DioClient dio;
  BookingService(this.dio);

  Future<List<BookingModel>> getBookings({
    required String status,
  }) async {
    final response = await dio.get(
      Endpoints.staffAppointments,
      query: {
        "status": status,
      },
    );
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
    return (res['data'] as List)
        .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<BookingModel> getBookingById({required int id}) async {
    final response = await dio.get('${Endpoints.staffAppointments}/$id');
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
    
    return BookingModel.fromJson(res['data']);
  }
}
