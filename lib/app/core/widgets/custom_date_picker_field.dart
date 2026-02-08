import 'package:bookly_x_client/app/core/data/lang_pref.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerField extends StatefulWidget {
  const CustomDatePickerField({
    super.key,
    this.hintText,
    required this.onDateChanged,
    this.initialDate,
    this.height = 50,
    this.label,
    this.firstDate,
    this.lastDate,
    this.isRequired = false,
  });

  final String? label;
  final bool isRequired;
  final String? hintText;
  final ValueChanged<DateTime> onDateChanged;
  final double height;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectedDate = widget.initialDate ?? DateTime.now();
      widget.onDateChanged(_selectedDate);
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(CustomDatePickerField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialDate != widget.initialDate) {
      _selectedDate = widget.initialDate ?? DateTime.now();
      widget.onDateChanged(_selectedDate);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          RichText(
            text: TextSpan(
              style: context.medium16Black,
              children: [
                TextSpan(text: widget.label, style: context.medium14),
                if (widget.isRequired)
                  TextSpan(text: ' *', style: context.medium14Danger),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        InkWell(
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: widget.firstDate ?? DateTime(1900),
              lastDate: widget.lastDate ?? DateTime(2100),
            );
            if (pickedDate != null) {
              setState(() {
                _selectedDate = pickedDate;
              });
              widget.onDateChanged(_selectedDate);
            }
          },
          child: Container(
            width: double.infinity,
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              border: Border.all(color: AppColors.textBorders),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isArabic
                        ? DateFormat('d MMMM yyyy', 'ar').format(_selectedDate)
                        : DateFormat('d MMMM yyyy', 'en').format(_selectedDate),
                    style: context.medium14TextSub,
                  ),
                ),
                const Icon(
                  MyIcons.calendar2Outline,
                  color: AppColors.textSub,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
