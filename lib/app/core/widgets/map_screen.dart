import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_location_picker/map_location_picker.dart';

import '../../../generated/translations.g.dart';
import '../constants/constants.dart';
import '../data/lang_pref.dart';
import 'custom_appbar.dart';

class MapScreen extends ConsumerStatefulWidget {
  final String? title;
  final LatLng currentLatLng;
  final Function(LatLng, String) onLocationSelected;

  const MapScreen({
    super.key,
    this.title,
    required this.currentLatLng,
    required this.onLocationSelected,
  });

  static void open(
    BuildContext context, {
    String? title,
    required LatLng currentLatLng,
    required Function(LatLng, String) onLocationSelected,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(
          title: title,
          currentLatLng: currentLatLng,
          onLocationSelected: onLocationSelected,
        ),
      ),
    );
  }

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final langPrefs = ref.watch(langPrefsProvider);
    final isArabic = langPrefs.isArabic;
    final locale = langPrefs.locale;

    return Localizations.override(
      context: context,
      locale: locale,
      child: Scaffold(
        appBar: CustomAppbar(
          title: widget.title ?? tr.selectLocation,
          hasBackButton: false,
        ),
        body: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: MapLocationPicker(
                      geoCodingConfig: GeoCodingConfig(
                        apiKey: Constants.mapsApiKey,
                        language: isArabic ? 'ar' : 'en',
                      ),
                      config: MapLocationPickerConfig(
                        apiKey: Constants.mapsApiKey,
                        initialPosition: widget.currentLatLng,
                        onNext: (result) {
                          final res = LatLng(
                            result?.geometry.location.lat ?? 0.0,
                            result?.geometry.location.lng ?? 0.0,
                          );
                          widget.onLocationSelected(
                            res,
                            result?.formattedAddress ?? '',
                          );
                          if (mounted) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
