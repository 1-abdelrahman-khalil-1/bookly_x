import 'dart:async';

import 'package:bookly_x_client/app/core/constants/constants.dart';
import 'package:bookly_x_client/app/core/styles/app_text_field_border_styles.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneNumber extends StatelessWidget {
  const CustomPhoneNumber({
    super.key,
    required this.controller,
    required this.onCountryChanged,
    this.onChanged,
    this.disableLengthCheck = false,
    this.validator,
    this.title,
    this.borderColor = AppColors.textBorders,
    this.borderRadius = 8,
    this.initialValue,
    this.initialCountryCode,
  });

  final TextEditingController controller;
  final ValueChanged<Country>? onCountryChanged;
  final ValueChanged<PhoneNumber>? onChanged;
  final bool disableLengthCheck;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final String? title;
  final Color borderColor;
  final double borderRadius;
  final String? initialValue;
  final String? initialCountryCode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(
              left: Constants.defaultPadding / 2,
              bottom: Constants.defaultPadding,
            ),
            child: Text(title!, style: context.regular12),
          ),
        ],
        Directionality(
          textDirection: TextDirection.ltr,
          child: IntlPhoneField(
            initialValue: initialValue,
            showDropdownIcon: false,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              labelText: tr.phoneNumber,
              labelStyle: context.regular14,
              alignLabelWithHint: true,
              filled: true,
              fillColor: AppColors.white,
              hintText: tr.enterYourPhoneNumber,
              hintStyle: context.regular14TextSub,
              border: AppTextFieldBorderStyles.border.copyWith(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              enabledBorder: AppTextFieldBorderStyles.border.copyWith(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: AppTextFieldBorderStyles.border.copyWith(
                borderSide: BorderSide(color: borderColor),
              ),
              disabledBorder: AppTextFieldBorderStyles.border,
              errorBorder: AppTextFieldBorderStyles.errorBorder,
              focusedErrorBorder: AppTextFieldBorderStyles.errorBorder,
            ),
            invalidNumberMessage: tr.pleaseEnterAValidPhone,
            // disableLengthCheck: true,
            pickerDialogStyle: PickerDialogStyle(
              searchFieldPadding: const EdgeInsets.all(5),
              searchFieldInputDecoration: InputDecoration(
                hintText: tr.searchCountry,
                prefixIcon: const Icon(Icons.search),
                border: AppTextFieldBorderStyles.border,
                enabledBorder: AppTextFieldBorderStyles.border,
                disabledBorder: AppTextFieldBorderStyles.border,
              ),
              countryCodeStyle: context.regular14Primary,
              countryNameStyle: context.regular14Primary,
            ),
            // textAlign: TextAlign.right,
            // countries: ['AE'],
            initialCountryCode: initialCountryCode ?? 'EG',
            controller: controller,
            onCountryChanged: onCountryChanged,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
