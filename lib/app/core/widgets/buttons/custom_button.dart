import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';
import '../../themes/app_colors.dart';
import '../custom_transform_arabic.dart';
import '../shimmer/shimmer_button.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final double width;
  final double height;
  final Gradient? gradient;
  final VoidCallback onPress;
  final VoidCallback? onDisabledPressed;
  final double borderRadius;
  final bool isDisabled;
  final bool isLoading;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Border? border;
  final Color borderColor;
  final Color prefixIconColor;
  final Color suffixIconColor;
  final double? titleSize;
  final bool isHaveCircleOnPrefixIcon;
  final String circleChild;
  final IconData? prefixIcon;
  final double prefixIconSize;
  const CustomButton({
    super.key,
    required this.title,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.primary2,
    this.borderColor = Colors.transparent,
    this.gradient,
    this.width = double.infinity,
    this.height = Constants.buttonHeight,
    required this.onPress,
    this.onDisabledPressed,
    this.textStyle,
    this.borderRadius = 8,
    this.prefixIconPath,
    this.suffixIconPath,
    this.border,
    this.titleSize,
    this.isDisabled = false,
    this.isLoading = false,
    this.prefixIconColor = Colors.white,
    this.suffixIconColor = Colors.white,
    this.isHaveCircleOnPrefixIcon = false,
    this.circleChild = '',
    this.prefixIcon,
    this.prefixIconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Material(
          color: Colors.transparent,
          child: isLoading
              ? ShimmerButton(
                  width: width,
                  height: height,
                  borderRadius: borderRadius,
                )
              : GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (isDisabled) {
                      onDisabledPressed?.call();
                    } else {
                      onPress.call();
                    }
                  },
                  child: Container(
                    width: width,
                    height: height,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isDisabled ? AppColors.textBorders : buttonColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                      border: border ?? Border.all(color: borderColor),
                      gradient: gradient,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (prefixIconPath != null || prefixIcon != null) ...[
                          Stack(
                            children: [
                              if (prefixIcon != null)
                                Icon(
                                  prefixIcon,
                                  size: prefixIconSize,
                                  color: prefixIconColor,
                                )
                              else
                                SvgPicture.asset(
                                  prefixIconPath!,
                                  height: 24,
                                  width: 24,
                                  colorFilter: ColorFilter.mode(
                                    prefixIconColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              if (isHaveCircleOnPrefixIcon)
                                PositionedDirectional(
                                  top: 0,
                                  end: 0,
                                  child: Container(
                                    width: 13,
                                    height: 13,
                                    decoration: const BoxDecoration(
                                      color: AppColors.secondary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        circleChild,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 4),
                        ],
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            title,
                            style: textStyle ??
                                context.bold14.copyWith(
                                  color: titleColor,
                                  fontSize: titleSize,
                                ),
                            maxLines: 1,
                          ),
                        ),
                        if (suffixIconPath != null) ...[
                          if (title != '') const SizedBox(width: 10),
                          CustomTransformArabic(
                            child: SvgPicture.asset(
                              suffixIconPath!,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                suffixIconColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class CustomButtonOutlined extends CustomButton {
  const CustomButtonOutlined({
    super.key,
    required super.title,
    required super.onPress,
    super.prefixIcon,
    super.titleColor = AppColors.textSub,
    super.buttonColor = AppColors.primaryHover,
    super.prefixIconColor = AppColors.textSub,
    super.width = double.infinity,
    super.height = Constants.buttonHeight,
    super.onDisabledPressed,
    super.border,
    super.borderColor,
    super.textStyle,
    super.borderRadius = 25,
    super.prefixIconPath,
    super.suffixIconPath,
    super.titleSize,
    super.isDisabled = false,
    super.isLoading = false,
  });
}
