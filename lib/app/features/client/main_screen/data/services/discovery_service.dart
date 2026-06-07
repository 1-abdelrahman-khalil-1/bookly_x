import 'package:bookly_x/app/core/api_helper/dio_client.dart';
import 'package:bookly_x/app/core/api_helper/dio_providers.dart';
import 'package:bookly_x/app/core/api_helper/endpoints.dart';
import 'package:bookly_x/app/core/api_helper/handle_errors_response.dart';
import 'package:bookly_x/app/features/client/main_screen/data/models/discovery_branch_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final discoveryServiceProvider = Provider<DiscoveryService>((ref) {
  return DiscoveryService(ref.watch(dioClientProvider));
});

class DiscoveryService {
  final DioClient dioClient;

  DiscoveryService(this.dioClient);

  Future<List<DiscoveryBranchModel>> searchBranches({
    required double lat,
    required double lng,
    String? category,
    String? search,
    double radius = 20.0,
  }) async {
    final response = await dioClient.get(
      Endpoints.clientDiscovery,
      query: {
        'lat': lat,
        'lng': lng,
        'radius': radius,
        if (category != null && category.isNotEmpty) 'category': category,
        if (search != null && search.trim().isNotEmpty) 'search': search.trim(),
      },
    );

    final res = response.data;
    HandleErrorsResponse.handleErrorsResponse(
      statusCode: response.statusCode,
      response: res,
    );

    final dataList = res['data'] as List? ?? [];
    return dataList.map((e) => DiscoveryBranchModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
