import 'package:bookly_x_client/app/core/di/service_locator.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/controller/client_home_cubit.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/available_near_section.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/categories_section.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/client_home_shimmer.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/header_section.dart';
import 'package:bookly_x_client/app/features/client/offers/data/model/offer_model.dart';
import 'package:bookly_x_client/app/features/client/offers/presentation/widgets/offer_horizontal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClientHomeCubit>(
      create: (context) => getIt()..loadData(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            // Pinned Header Section
            const HeaderSection(),

            Expanded(
              child: Builder(
                builder: (context) {
                  final cubit = context.read<ClientHomeCubit>();
                  return RefreshIndicator(
                    onRefresh: () => cubit.loadData(),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              16.h,
                              //Offers Section
                              BlocSelector<
                                  ClientHomeCubit,
                                  ClientHomeState,
                                  ({
                                    RequestStatus status,
                                    List<OfferModel> offers
                                  })>(
                                selector: (state) => (
                                  status: state.offersStatus,
                                  offers: state.offers
                                ),
                                builder: (context, data) {
                                  if (data.status == RequestStatus.loading ||
                                      data.status == RequestStatus.initial) {
                                    return const OffersShimmer();
                                  }

                                  if (data.offers.isEmpty) return const SizedBox.shrink();

                                  return SizedBox(
                                    height: 200,
                                    child: ListView.separated(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data.offers.length,
                                      separatorBuilder: (_, __) => 24.w,
                                      itemBuilder: (context, index) {
                                        final offer = data.offers[index];
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

                              // Categories Section
                              BlocSelector<ClientHomeCubit, ClientHomeState,
                                  String>(
                                selector: (state) => state.selectedCategoryId,
                                builder: (context, selectedCategoryId) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: CategoriesSection(
                                      selectedCategory: selectedCategoryId,
                                      onCategorySelected: (category) {
                                        context
                                            .read<ClientHomeCubit>()
                                            .selectCategory(category);
                                      },
                                    ),
                                  );
                                },
                              ),

                              BlocSelector<ClientHomeCubit,ClientHomeState,({
                                    RequestStatus status,
                                    List<ProviderModel> providers
                                  })>(
                                selector: (state) => (
                                  status: state.providersStatus,
                                  providers: state.providers
                                ),
                                builder: (context, data) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (data.status ==
                                                RequestStatus.loading ||
                                            data.status ==
                                                RequestStatus.initial)
                                          const ProvidersShimmer()
                                        else
                                          AvailableNearSection(
                                              providers: data.providers),
                                        24.h,
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
