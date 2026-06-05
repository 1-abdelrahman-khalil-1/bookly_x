import 'package:bookly_x/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/home/presentation/widgets/client_home_shimmer.dart';
import 'package:bookly_x/app/features/client/offers/data/model/offer_model.dart';
import 'package:bookly_x/app/features/client/offers/presentation/widgets/offer_horizontal_card.dart';
import 'package:bookly_x/app/features/client/offers/providers/client_offers_future_providers.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopOffers extends ConsumerWidget {
  const TopOffers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watchWhen(
      provider: clientOffersFutureProvider,
      loading: () => const OffersShimmer(),
      data: (offers) => _TopOffersContent(offers: offers),
    );
  }
}

class _TopOffersContent extends StatelessWidget {
  const _TopOffersContent({required this.offers});

  final List<OfferModel> offers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            tr.topOffers,
            style: context.regular18,
          ),
        ),
        8.h,
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: offers.length,
            separatorBuilder: (context, index) => 8.w,
            itemBuilder: (context, index) {
              return OfferHorizontalCard(
                offer: offers[index],
                buttonColor:
                    index.isEven ? AppColors.primary : AppColors.warning,
              );
            },
          ),
        ),
      ],
    );
  }
}
