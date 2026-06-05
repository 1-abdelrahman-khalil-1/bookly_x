import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/app/features/client/provider_details/data/models/available_service_model.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

/// Horizontally scrollable row of service category cards with overlaid label.
class ProviderAvailableServicesSection extends StatelessWidget {
  const ProviderAvailableServicesSection({
    super.key,
    required this.services,
  });

  final List<AvailableServiceModel> services;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.availableServices, style: context.semiBold16Black),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: services
                .map((s) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _ServiceCard(service: s),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service});
  final AvailableServiceModel service;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomCachedNetworkImage(
            imgUrl: service.imageUrl,
            width: 100,
            height: 100,
          ),
          // Dark overlay
          Container(
            width: 100,
            height: 100,
            color: Colors.black.withValues(alpha: 0.30),
          ),
          Text(
            service.name,
            style: context.regular12White,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
