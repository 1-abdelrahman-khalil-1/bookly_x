import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/provider_card.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewAllOffersScreen extends StatelessWidget {
  const ViewAllOffersScreen({super.key, required this.providers});
  final List<ProviderModel> providers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: tr.availableOffers,
      ),
      body: ListView(
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ...List.generate(
                providers.length,
                (index) {
                  return ProviderCard(provider: providers[index]);
                },
              ),
              16.h,
            ],
          ),
        ],
      ),
    );
  }
}
