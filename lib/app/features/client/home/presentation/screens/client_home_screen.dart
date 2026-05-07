import 'package:bookly_x_client/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/controller/client_home_future_providers.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/available_near_section.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/categories_section.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/client_home_shimmer.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/header_section.dart';
import 'package:bookly_x_client/app/features/client/offers/presentation/widgets/offer_horizontal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientHomeScreen extends ConsumerWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          16.h,
          // Pinned Header Section
          const HeaderSection(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(offersFutureProvider);
                final categoryId = ref.read(selectedCategoryProvider);
                ref.invalidate(providersFutureProvider(categoryId));
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.h,

                        // ── Offers Section ──────────────────────────────
                        ref.watchWhen(
                          provider: offersFutureProvider,
                          loading: () => const OffersShimmer(),
                          data: (offersList) {
                            if (offersList.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return SizedBox(
                              height: 200,
                              child: ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                itemCount: offersList.length,
                                separatorBuilder: (_, __) => 24.w,
                                itemBuilder: (context, index) {
                                  final offer = offersList[index];
                                  return OfferHorizontalCard(
                                    offer: offer,
                                    buttonColor: index.isEven
                                        ? AppColors.primary
                                        : AppColors.warning,
                                  );
                                },
                              ),
                            );
                          },
                        ),

                        // ── Categories Section ──────────────────────────
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: CategoriesSection(
                            selectedCategory:
                                ref.watch(selectedCategoryProvider),
                            onCategorySelected: (categoryId) {
                              ref
                                  .read(selectedCategoryProvider.notifier)
                                  .state = categoryId;
                            },
                          ),
                        ),

                        // ── Providers Section ───────────────────────────
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: ref.watchWhen(
                            provider: providersFutureProvider(
                              ref.watch(selectedCategoryProvider),
                            ),
                            loading: () => const ProvidersShimmer(),
                            data: (providersList) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AvailableNearSection(providers: providersList),
                                24.h,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
