import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/shimmer/shimmer_box.dart';
import 'package:flutter/material.dart';

class StaffProfileShimmer extends StatelessWidget {
  const StaffProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        /// staff card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.04),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              const ShimmerBox(
                width: 50,
                height: 50,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              16.w,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ShimmerBox(
                      width: 140,
                      height: 18,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    10.h,
                    const ShimmerBox(
                      width: 110,
                      height: 32,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        16.h,

        /// reviews card
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.03),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              const ShimmerBox(
                width: 22,
                height: 22,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              8.w,
              const ShimmerBox(
                width: 35,
                height: 16,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              6.w,
              const ShimmerBox(
                width: 70,
                height: 14,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              const Spacer(),
              const ShimmerBox(
                width: 60,
                height: 14,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ],
          ),
        ),

        16.h,

        /// information section
        const StaffSectionShimmer(),

        const Divider(
          color: AppColors.textBorders,
          height: 40,
          thickness: 2,
        ),

        /// speciality section
        const StaffSectionShimmer(),

        const Divider(
          color: AppColors.textBorders,
          height: 40,
          thickness: 2,
        ),

        /// schedule section
        const StaffScheduleSectionShimmer(),

        const Divider(
          color: AppColors.textBorders,
          height: 40,
          thickness: 2,
        ),

        /// settings section
        const StaffSectionShimmer(),

        24.h,
      ],
    );
  }
}

class StaffSectionShimmer extends StatelessWidget {
  const StaffSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShimmerBox(
          width: 140,
          height: 18,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        16.h,
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (_, __) => 14.h,
          itemBuilder: (_, __) {
            return const ShimmerBox(
              width: double.infinity,
              height: 18,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            );
          },
        ),
      ],
    );
  }
}

class StaffScheduleSectionShimmer extends StatelessWidget {
  const StaffScheduleSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShimmerBox(
          width: 160,
          height: 18,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        20.h,

        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            separatorBuilder: (_, __) => 10.w,
            itemBuilder: (_, __) {
              return const ShimmerBox(
                width: 72,
                height: 80,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              );
            },
          ),
        ),
      ],
    );
  }
}