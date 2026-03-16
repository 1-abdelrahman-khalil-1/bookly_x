import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/provider_details/data/models/provider_detail_model.dart';
import 'package:bookly_x_client/app/features/client/provider_details/presentation/controller/provider_details_future_providers.dart';
import 'package:bookly_x_client/app/features/client/provider_details/presentation/widgets/provider_available_services_section.dart';
import 'package:bookly_x_client/app/features/client/provider_details/presentation/widgets/provider_booking_bar.dart';
import 'package:bookly_x_client/app/features/client/provider_details/presentation/widgets/provider_description_section.dart';
import 'package:bookly_x_client/app/features/client/provider_details/presentation/widgets/provider_details_header.dart';
import 'package:bookly_x_client/app/features/client/provider_details/presentation/widgets/provider_details_shimmer.dart';
import 'package:bookly_x_client/app/features/client/provider_details/presentation/widgets/provider_reviews_section.dart';
import 'package:bookly_x_client/app/features/client/provider_details/presentation/widgets/provider_seller_section.dart';
import 'package:bookly_x_client/app/features/client/provider_details/presentation/widgets/provider_service_info_section.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ProviderDetailsScreen extends ConsumerWidget {
  final String providerId;
  const ProviderDetailsScreen({super.key, required this.providerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ref.watchWhen(
        provider: providerDetailProvider(providerId),
        loading: () => const ProviderDetailsShimmer(),
        data: (detail) => _ProviderDetailsBody(detail: detail),
      ),
    );
  }
}

class _ProviderDetailsBody extends StatelessWidget {
  const _ProviderDetailsBody({required this.detail});

  final ProviderDetailModel detail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: false,
              floating: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: ProviderDetailsHeader(
                  coverImageUrl: detail.coverImageUrl,
                  galleryUrls: detail.galleryUrls,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProviderServiceInfoSection(
                            serviceName: detail.name,
                            rating: detail.rating,
                            reviewCount: detail.reviewCount,
                          ),
                          16.h,
                          ProviderSellerSection(
                            sellerName: detail.sellerName,
                            ownerName: detail.ownerName,
                            avatarUrl: detail.sellerAvatarUrl,
                            isVerified: detail.isVerified,
                          ),
                          16.h,
                          ProviderDescriptionSection(
                            description: detail.description,
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: AppColors.textBorders),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 18),
                      child: ProviderAvailableServicesSection(
                        services: detail.services,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ProviderReviewsSection(
                        reviews: detail.reviews,
                        totalCount: detail.reviewCount,
                      ),
                    ),
                    100.h,
                  ],
                ),
              ),
            ),
          ],
        ),

        // Sticky booking bar
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: ProviderBookingBar(
            totalPrice: detail.totalPrice,
            currency: detail.currency,
            onBook: () => context.pushRoute(
              const ClientBookingServiceHostRoute(),
            ),
          ),
        ),
      ],
    );
  }
}
