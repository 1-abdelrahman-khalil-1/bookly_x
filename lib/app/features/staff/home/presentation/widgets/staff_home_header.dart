import 'package:bookly_x_client/app/core/constants/constants.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

class StaffHomeHeader extends StatelessWidget {
  const StaffHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCachedNetworkImage(
          imgUrl: Constants.tempImage,
          width: 50,
          height: 50,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        16.w,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr.goodMorningAlex, style: context.bold16),
              4.h,
              Text(
                tr.hereIsYourScheduleForToday,
                style: context.regular14TextSub,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => context.push(const StaffProfileRoute()),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.textBorders),
            ),
            child: const Icon(
              MyIcons.setting2Outline,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
