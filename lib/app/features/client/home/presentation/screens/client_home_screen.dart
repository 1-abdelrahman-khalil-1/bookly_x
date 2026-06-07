import 'package:bookly_x/app/core/enums/client_category.dart';
import 'package:bookly_x/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/home/presentation/controller/client_home_future_providers.dart';
import 'package:bookly_x/app/features/client/home/presentation/widgets/available_near_section.dart';
import 'package:bookly_x/app/features/client/home/presentation/widgets/categories_section.dart';
import 'package:bookly_x/app/features/client/home/presentation/widgets/client_header_section.dart';
import 'package:bookly_x/app/features/client/home/presentation/widgets/client_home_shimmer.dart';
import 'package:bookly_x/app/features/client/offers/presentation/widgets/offer_horizontal_card.dart';
import 'package:bookly_x/app/features/client/setting/presentation/controllers/client_setting_future_providers.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
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
          // Pinned Client Header Section
          const ClientHeaderSection(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(clientProfileFutureProvider);
                ref.invalidate(clientLocationProvider);
                // Invalidate all dashboard family entries
                for (final cat in ClientCategory.values) {
                  ref.invalidate(clientDashboardProvider(cat));
                }
              },
              child: ref.watchWhen(
                provider: clientDashboardProvider(
                    ref.watch(selectedCategoryProvider)),
                loading: () => const ClientHomeShimmer(),
                data: (dashboard) => CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.h,

                          // ── Offers Section ──────────────────────────────
                          if (dashboard.offers.isEmpty)
                            Container(
                              height: 160,
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                                border:
                                    Border.all(color: AppColors.textBorders),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      MyIcons
                                          .percentage_circleOutlinePercentageCircle,
                                      color: AppColors.textSub,
                                      size: 40,
                                    ),
                                    8.h,
                                    Text(
                                      tr.noActiveOffersToday,
                                      style: context.semiBold14Black,
                                    ),
                                    4.h,
                                    Text(
                                      tr.checkBackLaterForExclusiveDeals,
                                      style: context.regular12TextSub,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          else
                            SizedBox(
                              height: 200,
                              child: ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                itemCount: dashboard.offers.length,
                                separatorBuilder: (_, __) => 24.w,
                                itemBuilder: (context, index) {
                                  final offer = dashboard.offers[index];
                                  return OfferHorizontalCard(
                                    offer: offer,
                                    buttonColor: index.isEven
                                        ? AppColors.primary
                                        : AppColors.warning,
                                  );
                                },
                              ),
                            ),

                          // ── Categories Section ──────────────────────────
                          if (dashboard.categories.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: CategoriesSection(
                                categories: dashboard.categories,
                                selectedCategory:
                                    ref.watch(selectedCategoryProvider),
                                onCategorySelected: (category) {
                                  ref
                                      .read(selectedCategoryProvider.notifier)
                                      .state = category;
                                },
                              ),
                            ),

                          // ── Providers Section ───────────────────────────
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AvailableNearSection(
                                    providers: dashboard.nearbyBranches),
                                24.h,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
