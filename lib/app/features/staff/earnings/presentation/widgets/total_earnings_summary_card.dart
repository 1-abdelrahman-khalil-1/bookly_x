import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class TotalEarningsSummaryCard extends StatelessWidget {
  const TotalEarningsSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              color: AppColors.dodgerBlue,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(tr.totalEarnings, style: context.regular14TextSub),
                    4.h,
                    Text(
                      '\$2,840',
                      style: context.bold36DodgerBlue
                          .copyWith(fontFamily: 'Inter'),
                    ),
                    24.h,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.textBorders),
                            ),
                            child: Column(
                              children: [
                                Text(tr.services,
                                    style: context.regular12TextSub),
                                4.h,
                                Text('32',
                                    style: context.bold16Primary
                                        .copyWith(color: AppColors.textMain)),
                              ],
                            ),
                          ),
                        ),
                        16.w,
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.textBorders),
                            ),
                            child: Column(
                              children: [
                                Text(tr.avgService,
                                    style: context.regular12TextSub),
                                4.h,
                                Text('\$88',
                                    style: context.bold16Primary
                                        .copyWith(color: AppColors.textMain)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
