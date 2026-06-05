import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x/app/features/client/main_screen/presentation/controller/main_providers.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_location_picker/map_location_picker.dart';

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

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.invalidate(clientMapListFutureProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watchWhen(
          provider: clientMapMarkersProvider,
          data: (data) {
            if (data.marker.isEmpty) {
              return Center(
                child: Text(
                  tr.noResultsFound,
                  style: context.medium16TextMain,
                ),
              );
            }

            final CameraPosition kGooglePlex = CameraPosition(
              target: LatLng(
                data.marker.first.position.latitude,
                data.marker.first.position.longitude,
              ),
              zoom: 12.0,
            );
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: GoogleMap(
                mapType: MapType.normal,
                markers: data.marker.map((marker) {
                  final providerId = data.markerToProviderId[marker.markerId];

                  return marker.copyWith(
                    onTapParam: () {
                      if (providerId != null) {
                        ProviderDetailsRoute(providerId: providerId)
                            .push(context);
                      }
                    },
                  );
                }).toSet(),
                initialCameraPosition: kGooglePlex,
                mapToolbarEnabled: false,
                buildingsEnabled: false,
                compassEnabled: false,
                fortyFiveDegreeImageryEnabled: true,
                indoorViewEnabled: true,
                myLocationEnabled: widget.myLocationButtonEnabled,
                myLocationButtonEnabled: widget.myLocationButtonEnabled,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            );
          }),
    );
  }
}
