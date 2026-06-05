import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/utils/show_message.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/app/features/client/booking_service/presentation/controller/booking_flow_providers.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientConfirmBookingView extends ConsumerWidget {
  final VoidCallback onConfirm;

  const ClientConfirmBookingView({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flowData = ref.watch(bookingFlowDataProvider);
    final service = flowData.selectedService;
    final staff = flowData.selectedStaff;

    return Column(
      children: [
        20.h,
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.textBorders),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: flowData.statusColor
                                        .withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    flowData.statusLabel,
                                    style: context.regular11
                                        .copyWith(color: flowData.statusColor),
                                  ),
                                ),
                                8.w,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.success
                                        .withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    flowData.priceLabel,
                                    style: context.regular11Success,
                                  ),
                                ),
                              ],
                            ),
                            12.h,
                            Text(
                              service?.name ?? '',
                              style: context.semiBold16TextMain,
                            ),
                            4.h,
                            Text(
                              service?.category ?? '',
                              style: context.regular12TextSub,
                            ),
                            12.h,
                            _InfoRow(
                              icon: MyIcons.calendarOutline,
                              text: flowData.selectedDate != null
                                  ? '${flowData.selectedDate!.day}/${flowData.selectedDate!.month}/${flowData.selectedDate!.year}'
                                  : tr.pleaseSelectDate,
                            ),
                            8.h,
                            _InfoRow(
                              icon: MyIcons.clockOutline,
                              text: flowData.selectedTime != null
                                  ? flowData.selectedTime!.format(context)
                                  : tr.time,
                            ),
                            12.h,
                            Row(
                              children: [
                                const Icon(Icons.people_outline,
                                    size: 14, color: AppColors.textSub),
                                6.w,
                                Text(
                                  '${tr.specialist}: ${staff?.name ?? ''}',
                                  style: context.regular12TextSub,
                                ),
                              ],
                            ),
                            12.h,
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined,
                                    size: 14, color: AppColors.textSub),
                                4.w,
                                Text(
                                  'Banha-Qliubia',
                                  style: context.regular12TextSub,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      12.w,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomCachedNetworkImage(
                          imgUrl: staff?.imageUrl ??
                              'https://images.unsplash.com/photo-1567894340315-735d7c361db0?q=80&w=437',
                          width: 90,
                          height: 90,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                  16.h,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: tr.contact,
                          onPress: () {},
                          buttonColor: AppColors.white,
                          borderColor: AppColors.textBorders,
                          titleColor: AppColors.textMain,
                          prefixIcon: MyIcons.messageOutline,
                          prefixIconColor: AppColors.textSub,
                        ),
                      ),
                      12.w,
                      Expanded(
                        child: CustomButton(
                          title: tr.getInTouch,
                          onPress: () {},
                          buttonColor: AppColors.white,
                          borderColor: AppColors.textBorders,
                          titleColor: AppColors.textMain,
                          prefixIcon: MyIcons.callOutline,
                          prefixIconColor: AppColors.textSub,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomButton(
            title: tr.confirm,
            onPress: () {
              if (flowData.selectedDate == null) {
                setWarningMessage(tr.pleaseSelectDate);
                return;
              }
              if (flowData.selectedTime == null) {
                setWarningMessage(tr.pleaseSelectTime);
                return;
              }
              onConfirm();
            },
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textSub),
        6.w,
        Text(text, style: context.regular12TextSub),
      ],
    );
  }
}
