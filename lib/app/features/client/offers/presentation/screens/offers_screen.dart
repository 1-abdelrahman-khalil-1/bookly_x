import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/offers/presentation/widgets/available_offers.dart';
import 'package:bookly_x_client/app/features/client/offers/presentation/widgets/top_offers.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopOffers(),
            16.h,
            const Expanded(child: AvailableOffers()),
          ],
        ),
      ),
    );
  }
}
