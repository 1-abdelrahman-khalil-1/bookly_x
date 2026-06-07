import 'package:bookly_x/app/features/client/home/presentation/controller/client_home_future_providers.dart';
import 'package:bookly_x/app/features/client/main_screen/data/models/discovery_branch_model.dart';
import 'package:bookly_x/app/features/client/main_screen/data/services/discovery_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum MapSortFilter {
  nearest,
  highestRated,
  cheapest,
  offers,
}

class ClientMapState {
  final List<Marker> marker;
  final Map<MarkerId, String> markerToProviderId;

  const ClientMapState({
    required this.marker,
    required this.markerToProviderId,
  });
}

final selectedTabProvider = StateProvider<int>((ref) => 0);

final mapSearchQueryProvider = StateProvider<String>((ref) => '');
final mapSortFilterProvider = StateProvider<MapSortFilter>((ref) => MapSortFilter.nearest);
final selectedBranchIndexProvider = StateProvider<int>((ref) => 0);

final discoveryResultsProvider = FutureProvider<List<DiscoveryBranchModel>>((ref) async {
  final location = await ref.watch(clientLocationProvider.future);
  final searchQuery = ref.watch(mapSearchQueryProvider);
  final discoveryService = ref.watch(discoveryServiceProvider);

  return discoveryService.searchBranches(
    lat: location['lat']!,
    lng: location['lng']!,
    search: searchQuery,
  );
});

final filteredDiscoveryResultsProvider = Provider<AsyncValue<List<DiscoveryBranchModel>>>((ref) {
  final resultsAsync = ref.watch(discoveryResultsProvider);
  final sortFilter = ref.watch(mapSortFilterProvider);

  return resultsAsync.whenData((results) {
    final list = List<DiscoveryBranchModel>.from(results);
    if (sortFilter == MapSortFilter.nearest) {
      list.sort((a, b) => a.distance.compareTo(b.distance));
    } else if (sortFilter == MapSortFilter.highestRated) {
      list.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (sortFilter == MapSortFilter.cheapest) {
      // Locally shuffle or simulate cheapest order
      list.shuffle(); 
    } else if (sortFilter == MapSortFilter.offers) {
      // Show featured or shuffle
    }
    return list;
  });
});

final clientMapMarkersProvider = Provider<AsyncValue<ClientMapState>>((ref) {
  final branchesAsync = ref.watch(filteredDiscoveryResultsProvider);
  final selectedIndex = ref.watch(selectedBranchIndexProvider);

  return branchesAsync.whenData((branches) {
    final List<Marker> markers = [];
    final Map<MarkerId, String> markerToProviderId = {};

    for (int i = 0; i < branches.length; i++) {
      final branch = branches[i];
      final markerId = MarkerId(branch.id.toString());
      markerToProviderId[markerId] = branch.id.toString();

      final isSelected = i == selectedIndex;

      markers.add(
        Marker(
          markerId: markerId,
          position: LatLng(branch.location.lat, branch.location.lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            isSelected ? BitmapDescriptor.hueCyan : BitmapDescriptor.hueRed,
          ),
          infoWindow: InfoWindow(
            title: branch.name,
            snippet: '${branch.distance} km away',
          ),
        ),
      );
    }

    return ClientMapState(
      marker: markers,
      markerToProviderId: markerToProviderId,
    );
  });
});
