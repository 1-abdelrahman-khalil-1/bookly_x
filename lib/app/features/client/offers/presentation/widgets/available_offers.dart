import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x_client/app/features/client/offers/data/model/offer_model.dart';
import 'package:bookly_x_client/app/features/client/offers/presentation/widgets/offer_vertical_card.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

class AvailableOffers extends StatefulWidget {
  const AvailableOffers({super.key});

  @override
  State<AvailableOffers> createState() => _AvailableOffersState();
}

class _AvailableOffersState extends State<AvailableOffers>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${tr.availableOffers} :",
                style: context.regular18,
              ),
              Visibility(
                visible: offers.length > 3,
                child: TextButton(
                  onPressed: () {
                    ViewAllOffersRoute(providers: providers).push(context);
                  },
                  child: Text(
                    tr.viewAll,
                    style: context.regular14Primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        8.h,
        TabBar(
          controller: _tabController,
          labelStyle: context.medium16Warning,
          unselectedLabelStyle: context.regular16TextSub,
          labelPadding: EdgeInsets.zero,
          tabs: [
            Tab(text: tr.allServices),
            Tab(text: tr.spas),
            Tab(text: tr.clinics),
            Tab(text: tr.barbers),
          ],
        ),
        8.h,
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _OffersList(providers: providers),
              _OffersList(providers: providers),
              _OffersList(providers: providers),
              _OffersList(providers: providers),
            ],
          ),
        )
      ],
    );
  }
}

class _OffersList extends StatelessWidget {
  const _OffersList({required this.providers});

  final List<ProviderModel> providers;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: providers.length,
        separatorBuilder: (context, index) => 8.w,
        itemBuilder: (context, index) {
          return OfferVerticalCard(provider: providers[index]);
        },
      ),
    );
  }
}
