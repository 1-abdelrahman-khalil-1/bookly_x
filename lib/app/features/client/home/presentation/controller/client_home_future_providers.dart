import 'package:bookly_x/app/core/enums/client_category.dart';
import 'package:bookly_x/app/core/services/location_service.dart';
import 'package:bookly_x/app/features/client/home/data/models/category_model.dart';
import 'package:bookly_x/app/features/client/home/data/models/client_dashboard_model.dart';
import 'package:bookly_x/app/features/client/home/data/services/client_home_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider =
    StateProvider<ClientCategory>((ref) => ClientCategory.spa);
final clientLocationProvider = FutureProvider<Map<String, double>>((ref) async {
  final pos = await LocationService.getCurrentLocation();
  if (pos != null) {
    return {'lat': pos.latitude, 'lng': pos.longitude};
  }
  return {
    'lat': LocationService.defaultLatitude,
    'lng': LocationService.defaultLongitude,
  };
});

final clientDashboardProvider =
    FutureProvider.family<ClientDashboardModel, ClientCategory>(
        (ref, category) async {
  final location = await ref.watch(clientLocationProvider.future);
  final service = ref.watch(clientHomeServiceProvider);
  return service.getDashboard(
    lat: location['lat']!,
    lng: location['lng']!,
    category: category,
  );
});

final clientCategoriesProvider =
    FutureProvider<List<CategoryModel>>((ref) async {
  final dashboard =
      await ref.watch(clientDashboardProvider(ClientCategory.spa).future);
  return dashboard.categories;
});
