import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class StaffSpecialtyChip extends StatelessWidget {
  const StaffSpecialtyChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: context.semiBold14Primary),
    );
  }
}
