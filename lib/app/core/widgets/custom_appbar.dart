import 'package:bookly_x_client/app/core/data/lang_pref.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.bottom,
    this.hasBackButton = true,
  });
  final String title;
  final PreferredSizeWidget? bottom;
  final bool hasBackButton;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      leading: hasBackButton
          ? GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                context.pop();
              },
              child: Icon(
                isArabic
                    ? MyIcons.arrowSquareRightOutline
                    : MyIcons.arrowSquareLeftOutline,
                color: AppColors.textMain,
                size: 24,
              ),
            )
          : null,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
