import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class BookingStepIndicator extends StatelessWidget {
  final int activeStep;
  final List<String> steps;

  const BookingStepIndicator({
    super.key,
    required this.activeStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          return Expanded(
            child: Container(
              height: 1,
              color: AppColors.textBorders,
              margin: const EdgeInsets.symmetric(horizontal: 4),
            ),
          );
        }
        final stepIndex = index ~/ 2;
        final isActive = stepIndex < activeStep;
        final isCurrent = stepIndex == activeStep - 1;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isActive || isCurrent
                    ? AppColors.primary
                    : AppColors.textBorders,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${stepIndex + 1}',
                style: context.regular12White,
              ),
            ),
            4.h,
            Text(
              steps[stepIndex],
              style: isActive || isCurrent
                  ? context.regular11Primary
                  : context.regular11TextSub,
            ),
          ],
        );
      }),
    );
  }
}
