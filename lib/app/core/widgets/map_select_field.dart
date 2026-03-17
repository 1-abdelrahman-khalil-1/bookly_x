import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../generated/translations.g.dart';
import '../themes/app_colors.dart';
import 'map_screen.dart';

class MapSelectField extends StatefulWidget {
  const MapSelectField({
    super.key,
    this.title,
    this.hintText,
    this.mapTitle,
    this.currentLatLng,
    this.currentAddress,
    required this.onLocationSelected,
    this.borderColor = AppColors.boxShadow,
  });

  final String? title;
  final String? hintText;
  final String? mapTitle;
  final LatLng? currentLatLng;
  final String? currentAddress;
  final Color borderColor;
  final Function(LatLng?, String?) onLocationSelected;

  @override
  State<MapSelectField> createState() => _MapSelectFieldState();
}

class _MapSelectFieldState extends State<MapSelectField> {
  LatLng? selectedLatLng;
  String? selectedAddress;

  @override
  void initState() {
    selectedLatLng = widget.currentLatLng;
    selectedAddress = widget.currentAddress;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: context.semiBold14,
          ),
          const SizedBox(height: 5),
        ],
        if (selectedLatLng == null)
          InkWell(
            onTap: () {
              MapScreen.open(
                context,
                title: widget.mapTitle ?? tr.selectLocation,
                currentLatLng: selectedLatLng ?? const LatLng(30.0467, 31.2347),
                onLocationSelected: (latLng, address) {
                  setState(() {
                    selectedLatLng = latLng;
                    selectedAddress = address;
                  });
                  widget.onLocationSelected(latLng, address);
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.boxShadow),
              ),
              child: Text(
                widget.hintText ?? tr.selectLocation,
                style: context.regular14TextSub,
              ),
            ),
          )
        else
          GestureDetector(
            onTap: () {
              setState(() {
                selectedLatLng = null;
                selectedAddress = null;
              });
              widget.onLocationSelected(null, null);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: widget.borderColor),
              ),
              child: Text(
                selectedAddress ?? tr.locationSelected,
                style: context.regular14,
              ),
            ),
          ),
      ],
    );
  }
}
