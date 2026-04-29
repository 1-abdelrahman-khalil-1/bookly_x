import 'package:bookly_x_client/app/core/constants/constants.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffHeaderSection extends StatelessWidget {
  const StaffHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.padding + const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.dodgerBlue,
            AppColors.white,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.goodMorning,
                    style: context.regular14.white,
                  ),
                  4.h,
                  Text(
                    'Sarah Johnson', // TODO: Get from user profile provider
                    style: context.bold24.white,
                  ),
                ],
              ),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.black.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: const CustomCachedNetworkImage(
                  imgUrl: Constants.tempImage,
                  boxShape: BoxShape.circle,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          24.h,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 8),
                  spreadRadius: -6,
                ),
              ],
              border: Border.all(color: AppColors.black.withValues(alpha: 0.1)),
            ),
            child: Row(
              children: [
                const Icon(
                  MyIcons.searchNormalOutline,
                  color: AppColors.textSub,
                  size: 20,
                ),
                12.w,
                Text(
                  tr.searchServicesProviders,
                  style: context.regular14TextSub,
                ),
              ],
            ),
          ),
          16.h,
        ],
      ),
    );
  }
}
