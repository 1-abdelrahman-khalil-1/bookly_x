import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/extensions/context_extensions.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientBookingSuccessScreen extends StatelessWidget {
  final BookingFlowData flowData;

  const ClientBookingSuccessScreen({super.key, required this.flowData});

  @override
  Widget build(BuildContext context) {
    final service = flowData.selectedService;
    final staff = flowData.selectedStaff;

    return Scaffold(
      appBar: CustomAppbar(title: tr.bookingServices),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    _SuccessBadge(),
                    20.h,
                    Text(
                      tr.bookingSuccessful,
                      style: context.semiBold20TextMain,
                      textAlign: TextAlign.center,
                    ),
                    8.h,
                    Text(
                      tr.bookingSuccessMessage,
                      style: context.regular14TextSub,
                      textAlign: TextAlign.center,
                    ),
                    24.h,
                    _InfoCard(
                      title: tr.bookingInformation,
                      rows: [
                        _InfoCardRow(
                            label: tr.service, value: service?.name ?? ''),
                        _InfoCardRow(
                          label: tr.rentalDate,
                          value: flowData.formattedDateRange,
                        ),
                        _InfoCardRow(
                            label: tr.fullName, value: staff?.name ?? ''),
                      ],
                    ),
                    24.h,
                    _DetailSection(
                      title: tr.bookingDetail,
                      rows: [
                        _InfoCardRow(
                            label: tr.bookingId, value: '#T000123B0J1'),
                        _InfoCardRow(
                            label: tr.bookingDate,
                            value: '01Jan2024 - 10:30 am'),
                        _InfoCardRow(
                            label: tr.placeService, value: 'Xp center massage'),
                        _InfoCardRow(
                          label: tr.amount,
                          value: '${service?.price.toInt() ?? 0} EG',
                        ),
                        _InfoCardRow(label: tr.serviceFee, value: 'EG 15'),
                        _InfoCardRow(label: tr.tax, value: '\$0'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: tr.checkBooking,
                      onPress: () => AutoRouter.of(context).pop(),
                      buttonColor: AppColors.white,
                      borderColor: AppColors.textBorders,
                      titleColor: AppColors.textMain,
                    ),
                  ),
                  12.w,
                  Expanded(
                    child: CustomButton(
                      title: tr.payNow,
                      onPress: () => context.push(
                        ClientSecurePaymentRoute(flowData: flowData),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuccessBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.success,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.success.withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
      child: const Icon(Icons.verified, color: Colors.white, size: 52),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final List<_InfoCardRow> rows;

  const _InfoCard({required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textBorders),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(title, style: context.semiBold14TextMain),
          ),
          const Divider(height: 1, color: AppColors.textBorders),
          ...rows.map(
            (row) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Text(row.label, style: context.regular12TextSub),
                  const Spacer(),
                  Text(row.value, style: context.regular12TextMain),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  final String title;
  final List<_InfoCardRow> rows;

  const _DetailSection({required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.semiBold14TextMain),
        12.h,
        ...rows.map(
          (row) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Text(row.label, style: context.regular12TextSub),
                const Spacer(),
                Text(row.value, style: context.regular12TextMain),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoCardRow {
  final String label;
  final String value;

  const _InfoCardRow({required this.label, required this.value});
}
