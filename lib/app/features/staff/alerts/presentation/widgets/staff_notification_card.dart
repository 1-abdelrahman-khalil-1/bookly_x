import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

enum NotificationStatus { pending, accepted, rejected }

class StaffNotificationCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final NotificationStatus status;
  final String date;
  final String time;
  final String duration;
  final String timeAgo;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const StaffNotificationCard({
    super.key,
    required this.userName,
    required this.userImage,
    required this.status,
    required this.date,
    required this.time,
    required this.duration,
    required this.timeAgo,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          16.h,
          _buildStatusBadge(context),
          12.h,
          if (status == NotificationStatus.rejected)
            Text(
              '${tr.bookingCancelledFor} $userName',
              style: context.regular14Black
                  .copyWith(color: const Color(0xFF6B7280)),
            )
          else ...[
            _buildDetailsRow(context),
            if (status == NotificationStatus.pending) ...[
              16.h,
              _buildActionButtons(context),
            ],
          ]
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(userImage),
          backgroundColor: Colors.grey[200],
        ),
        12.h,
        Expanded(
          child: Text(
            userName,
            style: context.bold16Black,
          ),
        ),
        Text(
          timeAgo,
          style:
              context.regular12Black.copyWith(color: const Color(0xFF6B7280)),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case NotificationStatus.pending:
        bgColor = const Color(0xFFFFF7ED);
        textColor = const Color(0xFFF97316);
        text = tr.pending;
        break;
      case NotificationStatus.accepted:
        bgColor = const Color(0xFFF0FDF4);
        textColor = const Color(0xFF22C55E);
        text = tr.accepted;
        break;
      case NotificationStatus.rejected:
        bgColor = const Color(0xFFFEF2F2);
        textColor = const Color(0xFFEF4444);
        text = tr.rejected;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: context.medium12Primary.copyWith(color: textColor),
      ),
    );
  }

  Widget _buildDetailsRow(BuildContext context) {
    return Row(
      children: [
        _buildDetailItem(context, Icons.calendar_today_outlined, date),
        16.h,
        _buildDetailItem(context, Icons.access_time, time),
        16.h,
        _buildDetailItem(
            context, Icons.timer_outlined, '$duration ${tr.minutes}'),
      ],
    );
  }

  Widget _buildDetailItem(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: const Color(0xFF6B7280)),
        16.h,
        Text(
          text,
          style:
              context.regular14Black.copyWith(color: const Color(0xFF6B7280)),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onReject,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              tr.reject,
              style: context.bold14Primary,
            ),
          ),
        ),
        12.h,
        Expanded(
          child: ElevatedButton(
            onPressed: onAccept,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              backgroundColor: AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              tr.accept,
              style: context.bold14White,
            ),
          ),
        ),
      ],
    );
  }
}
