import 'package:bookly_x_client/app/core/enums/booking_status.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/extensions/date_time_exensions.dart';
import 'package:bookly_x_client/app/core/models/booking_model.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

class StaffBookingCard extends StatefulWidget {
  final BookingModel booking;

  const StaffBookingCard({
    super.key,
    required this.booking,
  });

  @override
  State<StaffBookingCard> createState() => _StaffBookingCardState();
}

class _StaffBookingCardState extends State<StaffBookingCard> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final badgeBackground = widget.booking.status.lightColor;
    final accentColor = widget.booking.status.color;
    final isCompleted = widget.booking.status == BookingStatus.complete;

    return AnimatedScale(
      scale: _isPressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: () =>
            context.push(StaffBookingDetailsRoute(booking: widget.booking)),
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.textBorders),
            boxShadow: [
              BoxShadow(
                color:
                    AppColors.black.withValues(alpha: _isPressed ? 0.08 : 0.03),
                blurRadius: _isPressed ? 12 : 18,
                offset: Offset(0, _isPressed ? 4 : 8),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 5,
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      children: [
                        CustomCachedNetworkImage(
                          imgUrl: widget.booking.client.avatarUrl,
                          width: 56,
                          height: 56,
                          boxShape: BoxShape.circle,
                          placeholderWidget: const Icon(
                            MyIcons.profileCircleOutline,
                            size: 28,
                            color: AppColors.textSub,
                          ),
                        ),
                        16.w,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.booking.client.name,
                                style: context.bold20Primary
                                    .copyWith(color: AppColors.textMain),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              8.h,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: badgeBackground,
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(
                                        color:
                                            accentColor.withValues(alpha: 0.3),
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      widget.booking.status.displayLabel,
                                      style: context.regular12Primary.copyWith(
                                        color: accentColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              16.h,
                              Expanded(
                                child: Text(
                                  '${widget.booking.scheduledAt.formattedDate} - ${widget.booking.scheduledAt.formattedTime}',
                                  style: context.regular14TextSub,
                                ),
                              ),
                            ],
                          ),
                        ),
                        8.w,
                        if (isCompleted) ...[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$${widget.booking.service.price.toStringAsFixed(0)}',
                                style: context.bold20Primary
                                    .copyWith(color: AppColors.textSub),
                              ),
                              Text(
                                tr.earned,
                                style: context.regular12TextSub,
                              ),
                            ],
                          ),
                          12.w,
                        ],
                        const Icon(
                          Icons.chevron_right,
                          color: AppColors.textSub,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
