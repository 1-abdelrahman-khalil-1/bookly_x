import 'package:bookly_x_client/app/core/api_helper/dio_client.dart';
import 'package:bookly_x_client/app/core/api_helper/dio_providers.dart';
import 'package:bookly_x_client/app/core/api_helper/endpoints.dart';
import 'package:bookly_x_client/app/core/api_helper/handle_errors_response.dart';
import 'package:bookly_x_client/app/features/staff/home/data/models/appoitment_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staffHomeServiceProvider = Provider<StaffHomeService>((ref) {
  return StaffHomeService(ref.watch(dioClientProvider));
});

class StaffHomeService {
  StaffHomeService(this.dioClient);

  final DioClient dioClient;

  Future<List<AppoitmentModel>> getSchedule(DateTime date) async {
    final response = await dioClient.get(
      Endpoints.staffSchedule,
      query: {'date': date.toIso8601String().split('T')[0]},
    );
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
    return (res['data']['appointments'] as List)
        .map((e) => AppoitmentModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
