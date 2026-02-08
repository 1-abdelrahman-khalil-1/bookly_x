import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class CustomTimePickerField extends StatefulWidget {
  final TimeOfDay? initialTime;
  final void Function(String)? onTimeSelected;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String hint;

  const CustomTimePickerField({
    super.key,
    this.initialTime,
    this.onTimeSelected,
    this.hint = "Enter time",
    this.validator,
    this.controller,
    this.onSaved,
  });

  @override
  State<CustomTimePickerField> createState() => _CustomTimePickerFieldState();
}

class _CustomTimePickerFieldState extends State<CustomTimePickerField> {
  String? _selectedTime;

  @override
  void initState() {
    super.initState();
    final formattedTime =
        '${widget.initialTime?.hour.toString().padLeft(2, '0')}:${widget.initialTime?.minute.toString().padLeft(2, '0')}';
    _selectedTime = formattedTime;
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: widget.initialTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null && widget.controller != null) {
      setState(() {
        final String formattedTime =
            '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
        _selectedTime = formattedTime;
        widget.controller?.text = formattedTime;
      });

      if (widget.onTimeSelected != null) {
        widget.onTimeSelected!(_selectedTime!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      readOnly: true,
      onPressed: _pickTime,
      hint: widget.hint,
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
