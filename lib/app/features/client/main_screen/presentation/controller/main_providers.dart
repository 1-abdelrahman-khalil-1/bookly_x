import 'package:bookly_x/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x/app/features/client/home/presentation/controller/client_home_future_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_location_picker/map_location_picker.dart';

class ClientMapState {
  final List<Marker> marker;
  final Map<MarkerId, String> markerToProviderId;

  const ClientMapState({
    required this.marker,
    required this.markerToProviderId,
  });
}

final selectedTabProvider = StateProvider<int>((ref) => 0);

final clientMapListFutureProvider = FutureProvider<List<ProviderModel>>((ref) async {
  // Simulate API delay
  await Future.delayed(const Duration(milliseconds: 500));
  return mockProviders.where((p) => p.latitude != null && p.longitude != null).toList();
});

final clientMapMarkersProvider = Provider<AsyncValue<ClientMapState>>((ref) {
  final providersAsync = ref.watch(clientMapListFutureProvider);

  return providersAsync.when(
    loading: () => const AsyncValue.loading(),
    error: (err, stack) => AsyncValue.error(err, stack),
    data: (providers) {
      final List<Marker> markers = [];
      final Map<MarkerId, String> markerToProviderId = {};

      for (final provider in providers) {
        if (provider.latitude != null && provider.longitude != null) {
          final markerId = MarkerId(provider.id);
          markerToProviderId[markerId] = provider.id;

          markers.add(
            Marker(
              markerId: markerId,
              position: LatLng(provider.latitude!, provider.longitude!),
              infoWindow: InfoWindow(
                title: provider.name,
                snippet: provider.description.replaceAll('\n', ' '),
              ),
            ),
          );
        }
      }

      return AsyncValue.data(ClientMapState(
        marker: markers,
        markerToProviderId: markerToProviderId,
      ));
    },
  );
});
