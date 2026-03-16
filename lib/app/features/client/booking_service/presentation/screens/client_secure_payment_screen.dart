import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x_client/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientSecurePaymentScreen extends StatefulWidget {
  final BookingFlowData flowData;

  const ClientSecurePaymentScreen({super.key, required this.flowData});

  @override
  State<ClientSecurePaymentScreen> createState() =>
      _ClientSecurePaymentScreenState();
}

class _ClientSecurePaymentScreenState extends State<ClientSecurePaymentScreen> {
  late final TextEditingController _cardNumberController;
  late final TextEditingController _expiryController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _cardNumberController = TextEditingController();
    _expiryController = TextEditingController();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final service = widget.flowData.selectedService;
    final staff = widget.flowData.selectedStaff;
    final totalAmount = (service?.price ?? 0) + 15;

    return Scaffold(
      appBar: CustomAppbar(title: tr.securePayment),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.textBorders),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr.bookingSummary,
                              style: context.semiBold12TextSub,
                            ),
                            16.h,
                            _SummaryRow(
                              label: tr.service,
                              value: service?.name ?? '',
                              isBold: true,
                            ),
                            12.h,
                            _SummaryRow(
                              label: tr.specialist,
                              value: staff?.name ?? '',
                              isBold: true,
                            ),
                            12.h,
                            _SummaryRow(
                              label: tr.timeAndDate,
                              value: widget.flowData.formattedDateTime,
                              isBold: true,
                            ),
                            const Divider(
                                height: 24, color: AppColors.textBorders),
                            _SummaryRow(
                              label: tr.totalAmount,
                              value: '\$${totalAmount.toStringAsFixed(2)}',
                              isLarge: true,
                            ),
                          ],
                        ),
                      ),
                      24.h,
                      Text(tr.creditDebitCard,
                          style: context.semiBold14TextMain),
                      16.h,
                      CustomTextFormField(
                        title: '',
                        hint: tr.cardNumber,
                        controller: _cardNumberController,
                        keyboardType: TextInputType.number,
                        validator: (v) => (v == null || v.isEmpty)
                            ? tr.youForgotThisField
                            : null,
                      ),
                      12.h,
                      CustomTextFormField(
                        title: '',
                        hint: tr.expiryDate,
                        controller: _expiryController,
                        keyboardType: TextInputType.datetime,
                        validator: (v) => (v == null || v.isEmpty)
                            ? tr.youForgotThisField
                            : null,
                      ),
                      12.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.lock_outline,
                              size: 14, color: AppColors.success),
                          6.w,
                          Text(
                            tr.securedWithSSL,
                            style: context.regular11Success,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: CustomButton(
                title: '${tr.payNow} \$${totalAmount.toStringAsFixed(2)}',
                onPress: () {
                  if (!_formKey.currentState!.validate()) {
                    context.push(
                      ClientPaymentSuccessRoute(flowData: widget.flowData),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                    ),
                  ),
                  8.w,
                  Text(
                    tr.yourPaymentIsSecureAndEncrypted,
                    style: context.regular12TextSub,
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

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final bool isLarge;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: isBold
              ? context.semiBold12TextMain
              : isLarge
                  ? context.semiBold16TextMain
                  : context.regular12TextSub,
        ),
        const Spacer(),
        Text(
          value,
          style: isLarge ? context.bold18TextMain : context.regular12TextMain,
        ),
      ],
    );
  }
}
