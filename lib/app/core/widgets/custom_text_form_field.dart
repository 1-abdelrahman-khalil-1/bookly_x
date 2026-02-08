import 'package:bookly_x_client/app/core/constants/constants.dart';
import 'package:bookly_x_client/app/core/styles/app_text_field_border_styles.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_ink_well.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hint,
    this.title,
    this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.isPassword = false,
    this.readOnly = false,
    this.onPressed,
    this.prefixIconPath,
    this.validator,
    this.onChanged,
    this.minLines,
    this.maxLines,
    this.autofocus = false,
    this.suffixIconOnPressed,
    this.controller,
    this.prefixIconColor,
    this.hintTextStyle,
    this.titleTextStyle,
    this.maxLength,
    this.onEditingComplete,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusNode,
    this.borderColor = AppColors.textBorders,
    this.height = 60,
    this.borderRadius,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 8,
    ),
  });

  final String? hint;
  final String? label;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final String? prefixIconPath;
  final Function()? onPressed;
  final String? title;
  final int? minLines;
  final int? maxLines;
  final Widget? prefixIcon;
  final bool autofocus;
  final Function()? suffixIconOnPressed;
  final Color? prefixIconColor;
  final TextStyle? hintTextStyle;
  final TextStyle? titleTextStyle;
  final int? maxLength;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final Color borderColor;
  final double height;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry contentPadding;
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
            child: Text(
              title!,
              style: titleTextStyle ?? context.regular14Black,
            ),
          ),
        ],
        Container(
          height: height,
          decoration: BoxDecoration(borderRadius: borderRadius),
          child: TextFormField(
            controller: controller,
            autocorrect: false,
            obscureText: isPassword,
            keyboardType: keyboardType,
            validator: validator,
            onChanged: onChanged,
            onSaved: onSaved,
            readOnly: readOnly,
            textInputAction: textInputAction ?? TextInputAction.done,
            onTap: onPressed,
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            autofocus: autofocus,
            maxLength: maxLength,
            onEditingComplete: onEditingComplete,
            focusNode: focusNode,
            inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              isDense: true,
              labelText: label,
              labelStyle: context.regular14,
              alignLabelWithHint: true,
              filled: true,
              fillColor: AppColors.white,
              hintText: hint ?? '${tr.enter} $title',
              hintStyle: hintTextStyle ?? context.regular14TextSub,
              contentPadding: contentPadding,
              prefixIcon: prefixIcon ??
                  ((prefixIconPath != null)
                      ? Padding(
                          padding: const EdgeInsets.all(
                            Constants.defaultPadding * 2.5,
                          ),
                          child: SvgPicture.asset(
                            prefixIconPath!,
                            colorFilter: prefixIconColor != null
                                ? ColorFilter.mode(
                                    prefixIconColor!,
                                    BlendMode.srcIn,
                                  )
                                : null,
                          ),
                        )
                      : null),
              suffixIcon: (suffixIcon != null)
                  ? CustomInkWell(onTap: suffixIconOnPressed, child: suffixIcon)
                  : null,
              border: AppTextFieldBorderStyles.border.copyWith(
                borderSide: BorderSide(color: borderColor),
                borderRadius: borderRadius,
              ),
              enabledBorder: AppTextFieldBorderStyles.border.copyWith(
                borderSide: BorderSide(color: borderColor),
                borderRadius: borderRadius,
              ),
              focusedBorder: AppTextFieldBorderStyles.border.copyWith(
                borderSide: BorderSide(color: borderColor),
              ),
              disabledBorder: AppTextFieldBorderStyles.border,
              errorBorder: AppTextFieldBorderStyles.errorBorder,
              focusedErrorBorder: AppTextFieldBorderStyles.errorBorder,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
    required this.hint,
    this.title,
    this.keyboardType,
    this.readOnly = false,
    this.onPressed,
    this.validator,
    this.onChanged,
    this.minLines,
    this.maxLines,
    this.autofocus = false,
    this.suffixIconOnPressed,
    this.controller,
    this.prefixIconColor,
    this.hintTextStyle,
    this.maxLength,
    this.onEditingComplete,
    this.textInputAction,
  });

  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final Function()? onPressed;
  final String? title;
  final int? minLines;
  final int? maxLines;
  final bool autofocus;
  final Function()? suffixIconOnPressed;
  final Color? prefixIconColor;
  final TextStyle? hintTextStyle;
  final int? maxLength;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hint: widget.hint,
      title: widget.title,
      controller: widget.controller,
      validator: widget.validator,
      onPressed: widget.onPressed,
      maxLines: widget.minLines,
      minLines: widget.minLines,
      prefixIconColor: widget.prefixIconColor,
      onChanged: widget.onChanged,
      isPassword: isPassword,
      autofocus: widget.autofocus,
      hintTextStyle: widget.hintTextStyle,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      onEditingComplete: widget.onEditingComplete,
      suffixIconOnPressed: () {
        isPassword = !isPassword;
        setState(() {});
      },
      suffixIcon: isPassword
          ? const Icon(Icons.visibility_off, color: AppColors.primary)
          : const Icon(Icons.visibility, color: AppColors.primary),
      readOnly: widget.readOnly,
      textInputAction: widget.textInputAction,
    );
  }
}
