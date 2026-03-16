import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ClientStaffInfoTabSection extends StatefulWidget {
  const ClientStaffInfoTabSection({
    super.key,
    required this.workPlaces,
    required this.reviews,
  });

  final List<ClientStaffWorkPlaceModel> workPlaces;
  final List<ClientStaffReviewModel> reviews;

  @override
  State<ClientStaffInfoTabSection> createState() =>
      _ClientStaffInfoTabSectionState();
}

class _ClientStaffInfoTabSectionState extends State<ClientStaffInfoTabSection>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.whiteCatskillWhite,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.textBorders),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 52,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.textBorders,
                borderRadius: BorderRadius.circular(14),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                splashBorderRadius: BorderRadius.circular(12),
                labelColor: AppColors.textMain,
                unselectedLabelColor: AppColors.textSub,
                labelStyle: context.semiBold18TextMain,
                unselectedLabelStyle: context.medium18TextSub,
                indicator: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.textPlaceholder),
                ),
                tabs: [
                  Tab(text: tr.workPlace),
                  Tab(text: tr.reviews),
                ],
              ),
            ),
            10.h,
            AnimatedBuilder(
              animation: _tabController,
              builder: (context, _) {
                return _tabController.index == 0
                    ? _ClientStaffWorkPlaceTab(items: widget.workPlaces)
                    : _ClientStaffReviewsTab(items: widget.reviews);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ClientStaffWorkPlaceTab extends StatelessWidget {
  const _ClientStaffWorkPlaceTab({required this.items});

  final List<ClientStaffWorkPlaceModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _ClientStaffWorkPlaceCard(item: item),
        );
      },
    );
  }
}

class _ClientStaffWorkPlaceCard extends StatelessWidget {
  const _ClientStaffWorkPlaceCard({required this.item});

  final ClientStaffWorkPlaceModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.textBorders),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomCachedNetworkImage(
              imgUrl: item.imageUrl,
              width: 74,
              height: 74,
            ),
          ),
          10.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: context.semiBold18TextMain),
                4.h,
                Text(item.subtitle, style: context.regular12TextSub),
                8.h,
                Row(
                  children: [
                    const Icon(
                      MyIcons.starBold,
                      color: AppColors.warningBadge,
                      size: 14,
                    ),
                    4.w,
                    Text(
                      '${item.rating.toStringAsFixed(1)} (${item.reviewCount} ${tr.review})',
                      style: context.regular12TextSub,
                    ),
                    12.w,
                    const Icon(
                      MyIcons.locationLinear,
                      color: AppColors.textPlaceholder,
                      size: 13,
                    ),
                    4.w,
                    Expanded(
                      child: Text(
                        item.location,
                        style: context.regular12TextSub,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ClientStaffReviewsTab extends StatelessWidget {
  const _ClientStaffReviewsTab({required this.items});

  final List<ClientStaffReviewModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _ClientStaffReviewCard(item: item),
        );
      },
    );
  }
}

class _ClientStaffReviewCard extends StatelessWidget {
  const _ClientStaffReviewCard({required this.item});

  final ClientStaffReviewModel item;

  @override
  Widget build(BuildContext context) {
    final dayLabel =
        item.day == ClientStaffReviewDay.today ? tr.today : tr.yesterday;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.textBorders),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: CustomCachedNetworkImage(
                  imgUrl: item.avatarUrl,
                  width: 30,
                  height: 30,
                ),
              ),
              8.w,
              Expanded(
                child:
                    Text(item.reviewerName, style: context.semiBold16TextMain),
              ),
              Text(dayLabel, style: context.regular12TextSub),
            ],
          ),
          8.h,
          Row(
            children: List.generate(
              item.rating,
              (_) => const Padding(
                padding: EdgeInsetsDirectional.only(end: 2),
                child: Icon(
                  MyIcons.starBold,
                  color: AppColors.warning,
                  size: 14,
                ),
              ),
            ),
          ),
          8.h,
          Text(item.comment, style: context.regular14TextSub),
        ],
      ),
    );
  }
}
