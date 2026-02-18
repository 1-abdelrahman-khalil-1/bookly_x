import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/categories_section.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/header_section.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/available_near_section.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/promo_cards_section.dart';
import 'package:flutter/material.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Pinned Header Section
          const HeaderSection(),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.h,
                  // Promotional Cards
                  const PromoCardsSection(),
                  24.h,
                  // Categories
                  const CategoriesSection(),
                  24.h,
                  // Nearby Providers
                  const AvailableNearSection(),
                  24.h,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
