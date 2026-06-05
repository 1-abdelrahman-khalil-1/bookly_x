import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffBookingAttachmentsCard extends StatelessWidget {
  const StaffBookingAttachmentsCard({
    super.key,
    required this.hasAttachments,
  });

  final bool hasAttachments;

  @override
  Widget build(BuildContext context) {
    if (!hasAttachments) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.attach_file, size: 20, color: AppColors.textMain),
          8.w,
          Text(
            tr.attachments,
            style: context.bold14Primary.copyWith(color: AppColors.textMain),
          ),
        ],
      ),
    );
  }
}
