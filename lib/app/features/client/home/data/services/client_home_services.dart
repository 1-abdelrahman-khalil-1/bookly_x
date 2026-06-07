import 'package:bookly_x/app/core/api_helper/dio_client.dart';
import 'package:bookly_x/app/core/api_helper/dio_providers.dart';
import 'package:bookly_x/app/core/api_helper/endpoints.dart';
import 'package:bookly_x/app/core/api_helper/handle_errors_response.dart';
import 'package:bookly_x/app/core/enums/client_category.dart';
import 'package:bookly_x/app/features/client/home/data/models/client_dashboard_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientHomeServiceProvider = Provider<ClientHomeService>((ref) {
  return ClientHomeService(ref.watch(dioClientProvider));
});

class ClientHomeService {
  ClientHomeService(this.dioClient);
  final DioClient dioClient;

  Future<ClientDashboardModel> getDashboard({
    required num lat,
    required num lng,
    ClientCategory? category,
  }) async {
    final response = await dioClient.get(Endpoints.clientDashboard, query: {
      'lat': lat,
      'lng': lng,
      if (category != null) 'category': category.apiKey,
    });
    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );
    return ClientDashboardModel.fromJson(res, activeCategory: category?.name);
  }
}
