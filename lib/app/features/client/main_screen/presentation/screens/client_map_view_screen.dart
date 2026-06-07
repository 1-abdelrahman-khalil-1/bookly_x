import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x/app/core/services/location_service.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_search.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/app/core/widgets/shimmer/shimmer_box.dart';
import 'package:bookly_x/app/features/client/home/presentation/controller/client_home_future_providers.dart';
import 'package:bookly_x/app/features/client/main_screen/data/models/discovery_branch_model.dart';
import 'package:bookly_x/app/features/client/main_screen/data/services/discovery_service.dart';
import 'package:bookly_x/app/features/client/main_screen/presentation/controller/main_providers.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class ClientMapViewScreen extends ConsumerStatefulWidget {
  const ClientMapViewScreen({
    this.myLocationButtonEnabled = true,
    super.key,
  });

  final bool myLocationButtonEnabled;

  @override
  ConsumerState<ClientMapViewScreen> createState() =>
      _ClientMapViewScreenState();
}

class _ClientMapViewScreenState extends ConsumerState<ClientMapViewScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    Future.microtask(() {
      ref.invalidate(discoveryResultsProvider);
      ref.read(selectedBranchIndexProvider.notifier).state = 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _goToPosition(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 14.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeFilter = ref.watch(mapSortFilterProvider);
    final selectedIndex = ref.watch(selectedBranchIndexProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ref.watchWhen(
        provider: clientLocationProvider,
        loading: () => const ShimmerBox(
          width: double.infinity,
          height: double.infinity,
        ),
        data: (location) {
          final initialTarget = LatLng(location['lat']!, location['lng']!);

          return Stack(
            children: [
              // ── Background Map (Always Rendered) ──────────────────────────
              Positioned.fill(
                child: _buildGoogleMap(initialTarget),
              ),

              // ── Top Search & Filter Panels ──────────────────────────────────
              _buildTopPanels(activeFilter),

              // ── Bottom Cards Slider / Empty State ──────────────────────────
              Positioned(
                bottom: 24,
                left: 0,
                right: 0,
                child: ref.watchWhen(
                  provider: filteredDiscoveryResultsProvider,
                  loading: () => const SizedBox.shrink(),
                  data: (branches) {
                    if (branches.isEmpty) {
                      return _buildEmptyState();
                    }
                    return _buildPageViewSlider(branches, selectedIndex);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGoogleMap(LatLng initialTarget) {
    final markersState = ref.watch(clientMapMarkersProvider).valueOrNull;
    final markers = markersState?.marker.toSet() ?? {};
    final markerToProviderId = markersState?.markerToProviderId ?? {};

    return GoogleMap(
      mapType: MapType.normal,
      markers: markers.map((marker) {
        final providerId = markerToProviderId[marker.markerId];
        return marker.copyWith(
          onTapParam: () {
            if (providerId != null) {
              final branches =
                  ref.read(filteredDiscoveryResultsProvider).asData?.value ??
                      [];
              final idx = branches.indexWhere((b) => b.id == providerId);
              if (idx != -1) {
                ref.read(selectedBranchIndexProvider.notifier).state = idx;
                _pageController.animateToPage(
                  idx,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                _goToPosition(branches[idx].location.lat, branches[idx].location.lng);
              }
            }
          },
        );
      }).toSet(),
      initialCameraPosition: CameraPosition(
        target: initialTarget,
        zoom: 13.0,
      ),
      mapToolbarEnabled: false,
      buildingsEnabled: false,
      compassEnabled: false,
      fortyFiveDegreeImageryEnabled: true,
      indoorViewEnabled: true,
      myLocationEnabled: widget.myLocationButtonEnabled,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        if (!_controller.isCompleted) {
          _controller.complete(controller);
        }
      },
    );
  }

  Widget _buildTopPanels(MapSortFilter activeFilter) {
    return Positioned(
      top: 24,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomSearch<DiscoveryBranchModel>(
                      onSelected: (branch) {
                        final branches = ref
                                .read(filteredDiscoveryResultsProvider)
                                .asData
                                ?.value ??
                            [];
                        final idx =
                            branches.indexWhere((b) => b.id == branch.id);
                        if (idx != -1) {
                          ref.read(selectedBranchIndexProvider.notifier).state =
                              idx;
                          _pageController.animateToPage(
                            idx,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          _goToPosition(branches[idx].location.lat, branches[idx].location.lng);
                        }
                      },
                      suggestionsCallback: (pattern) async {
                        Future.microtask(() {
                          ref.read(mapSearchQueryProvider.notifier).state =
                              pattern;
                        });
                        if (pattern.isEmpty) return [];
                        final location =
                            await ref.read(clientLocationProvider.future);
                        final discoveryService =
                            ref.read(discoveryServiceProvider);
                        return await discoveryService.searchBranches(
                          lat: location['lat']!,
                          lng: location['lng']!,
                          search: pattern,
                        );
                      },
                    ),
                  ),
                  12.w,
                  // Custom Location Refresh Button
                  GestureDetector(
                    onTap: () async {
                      final pos = await LocationService.getCurrentLocation();
                      if (pos != null) {
                        _goToPosition(pos.latitude, pos.longitude);
                      }
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.navigation,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            16.h,
            // Horizontal Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _FilterChip(
                    label: tr.nearest,
                    icon: Icons.my_location,
                    isActive: activeFilter == MapSortFilter.nearest,
                    onTap: () {
                      ref.read(mapSortFilterProvider.notifier).state =
                          MapSortFilter.nearest;
                    },
                  ),
                  8.w,
                  _FilterChip(
                    label: tr.highestRated,
                    icon: Icons.star,
                    isActive: activeFilter == MapSortFilter.highestRated,
                    onTap: () {
                      ref.read(mapSortFilterProvider.notifier).state =
                          MapSortFilter.highestRated;
                    },
                  ),
                  8.w,
                  _FilterChip(
                    label: tr.cheapest,
                    icon: Icons.attach_money,
                    isActive: activeFilter == MapSortFilter.cheapest,
                    onTap: () {
                      ref.read(mapSortFilterProvider.notifier).state =
                          MapSortFilter.cheapest;
                    },
                  ),
                  8.w,
                  _FilterChip(
                    label: tr.offers,
                    icon: Icons.local_offer,
                    isActive: activeFilter == MapSortFilter.offers,
                    onTap: () {
                      ref.read(mapSortFilterProvider.notifier).state =
                          MapSortFilter.offers;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Text(
          tr.noResultsFound,
          style: context.medium16TextMain,
        ),
      ),
    );
  }

  Widget _buildPageViewSlider(
      List<DiscoveryBranchModel> branches, int selectedIndex) {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: branches.length,
        onPageChanged: (index) {
          ref.read(selectedBranchIndexProvider.notifier).state = index;
          final branch = branches[index];
          _goToPosition(branch.location.lat, branch.location.lng);
        },
        itemBuilder: (context, index) {
          final branch = branches[index];
          final isSelected = index == selectedIndex;

          return AnimatedScale(
            scale: isSelected ? 1.0 : 0.95,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: () {
                ProviderDetailsRoute(providerId: branch.id.toString()).push(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Left Branch Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CustomCachedNetworkImage(
                        imgUrl: branch.profileImage ?? '',
                        width: 90,
                        height: 120,
                      ),
                    ),
                    12.w,
                    // Right Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Name & Featured Tag
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  branch.name,
                                  style: context.semiBold16Black,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          // Rating Stars
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              4.w,
                              Text(
                                branch.rating.toStringAsFixed(1),
                                style: context.bold12Black,
                              ),
                              4.w,
                              Text(
                                '• ${tr.reviewsCountFormat(count: branch.totalReviews)}',
                                style: context.regular12TextSub,
                              ),
                            ],
                          ),
                          // Distance
                          Row(
                            children: [
                              Text(
                                '${branch.distance} ${tr.km}',
                                style: context.regular12TextSub,
                              ),
                            ],
                          ),
                          // Top categories/services tags
                          Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: branch.topServiceCategories
                                .take(2)
                                .map((tag) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.textBorders,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        tag,
                                        style: context.regular11TextSub,
                                      ),
                                    ))
                                .toList(),
                          ),
                          // Book Now Button using CustomButton core widget
                          CustomButton(
                            title: tr.bookNow,
                            height: 36,
                            buttonColor: const Color(0xFF0097A7),
                            borderRadius: 10,
                            titleSize: 12,
                            onPress: () {
                              ProviderDetailsRoute(providerId: branch.id.toString())
                                  .push(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? Colors.black : AppColors.textBorders,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: isActive ? Colors.white : Colors.black,
            ),
            6.w,
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
