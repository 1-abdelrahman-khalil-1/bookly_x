import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/assets.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class LogoName extends StatelessWidget {
  const LogoName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          Assets.pngLogo,
          height: 40,
        ),
        8.h,
        Text(
          'BooklyX',
          style: context.bold20White,
        ),
      ],
    );
  }
}
