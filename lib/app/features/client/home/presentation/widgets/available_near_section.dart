import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/widgets/provider_card.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
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
