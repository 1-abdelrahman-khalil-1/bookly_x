import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientPaymentSuccessScreen extends StatelessWidget {
  final BookingFlowData flowData;

  const ClientPaymentSuccessScreen({super.key, required this.flowData});

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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    _SuccessBadge(),
                    20.h,
                    Text(
                      tr.paymentSuccessful,
                      style: context.semiBold20TextMain,
                      textAlign: TextAlign.center,
                    ),
                    8.h,
                    Text(
                      tr.paymentSuccessMessage,
                      style: context.regular14TextSub,
                      textAlign: TextAlign.center,
                    ),
                    24.h,
                    _SectionCard(
                      title: tr.bookingInformation,
                      rows: [
                        _Row(label: tr.service, value: service?.name ?? ''),
                        _Row(label: tr.rentalDate, value: flowData.formattedDateRange),
                        _Row(label: tr.fullName, value: staff?.name ?? ''),
                      ],
                    ),
                    24.h,
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(tr.paymentDetail, style: context.semiBold14TextMain),
                    ),
                    12.h,
                    _DetailRow(label: tr.paymentId, value: '#T000123B0J1'),
                    12.h,
                    _DetailRow(label: tr.paymentDate, value: '01Jan2024 - 10:30 am'),
                    12.h,
                    _DetailRow(
                      label: tr.placeService,
                      value: service?.category ?? '',
                    ),
                    24.h,
                    _ReceiptButton(
                      icon: MyIcons.receiveSquareBold,
                      label: tr.downloadReceipt,
                      onTap: () {},
                    ),
                    12.h,
                    _ReceiptButton(
                      icon: MyIcons.shareOutline,
                      label: tr.shareReceipt,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                title: tr.backToHome,
                onPress: () => context.pushAndPopAll(const ClientMainRoute()),
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

class _SectionCard extends StatelessWidget {
  final String title;
  final List<_Row> rows;

  const _SectionCard({required this.title, required this.rows});

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

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: context.regular12TextSub),
        const Spacer(),
        Text(value, style: context.regular12TextMain),
      ],
    );
  }
}

class _Row {
  final String label;
  final String value;

  const _Row({required this.label, required this.value});
}

class _ReceiptButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ReceiptButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.textBorders),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: AppColors.textSub),
            8.w,
            Text(label, style: context.regular14TextMain),
          ],
        ),
      ),
    );
  }
}
