import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x/app/features/client/home/presentation/widgets/provider_card.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

class AvailableNearSection extends StatelessWidget {
  final List<ProviderModel> providers;
  const AvailableNearSection({super.key, required this.providers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr.availableNearYou,
                style: context.regular18,
              ),
              Visibility(
                visible: providers.length > 3,
                child: TextButton(
                  onPressed: () {
                    ViewAllProvidersRoute(providers: providers).push(context);
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
        if (providers.isEmpty)
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.textBorders),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    MyIcons.locationSlashOutline,
                    color: AppColors.textSub,
                    size: 40,
                  ),
                  8.h,
                  Text(
                    'No Nearby Branches Found',
                    style: context.semiBold14Black,
                  ),
                  4.h,
                  Text(
                    'Try changing your location or category filter.',
                    style: context.regular12TextSub,
                  ),
                ],
              ),
            ),
          )
        else
          SizedBox(
            height: 360,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: providers.length,
              separatorBuilder: (context, index) => 8.w,
              itemBuilder: (context, index) {
                return ProviderCard(provider: providers[index]);
              },
            ),
          ),
      ],
    );
  }
}
