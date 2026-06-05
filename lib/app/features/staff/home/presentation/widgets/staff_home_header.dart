import 'package:bookly_x/app/core/constants/constants.dart';
import 'package:bookly_x/app/core/data/user_pref.dart';
import 'package:bookly_x/app/core/extensions/context_extensions.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StaffHomeHeader extends ConsumerWidget {
  const StaffHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Row(
      children: [
        CustomCachedNetworkImage(
          imgUrl: user.staff?.profileImageUrl ?? Constants.tempImage,
          width: 50,
          height: 50,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        16.w,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${tr.goodMorning} ${user.name.split(" ")[0]}",
                  style: context.bold16),
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
