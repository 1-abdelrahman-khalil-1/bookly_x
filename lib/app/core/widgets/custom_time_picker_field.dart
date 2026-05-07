import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_text_form_field.dart';

class CustomTimePickerField extends StatefulWidget {
  final TimeOfDay? initialTime;
  final void Function(String)? onTimeSelected;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String title;
  final bool readOnly;
  const CustomTimePickerField({
    super.key,
    this.initialTime,
    this.onTimeSelected,
    this.validator,
    required this.title,
    this.controller,
    this.onSaved,
    this.readOnly = false,
  });

  @override
  State<CustomTimePickerField> createState() => _CustomTimePickerFieldState();
}

class _CustomTimePickerFieldState extends State<CustomTimePickerField> {
  String? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = _formatTime(widget.initialTime);
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return '';
    return DateFormat.jm().format(
      DateTime(0, 1, 1, time.hour, time.minute),
    );
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
        _selectedTime = _formatTime(picked);
        widget.controller?.text = _selectedTime!;
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
      hint: _selectedTime,
      onPressed: widget.readOnly ? null : _pickTime,
      title: widget.title,
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
