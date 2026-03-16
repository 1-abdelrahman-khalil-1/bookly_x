import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_calendar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';

import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class ClientTimeDateBottomSheet extends StatefulWidget {
  final void Function(DateTime date, TimeOfDay time, bool isAm) onConfirm;
  final DateTime? initialDate;
  final TimeOfDay? initialTime;
  final bool initialIsAm;

  const ClientTimeDateBottomSheet({
    super.key,
    required this.onConfirm,
    this.initialDate,
    this.initialTime,
    this.initialIsAm = true,
  });

  static void show(
    BuildContext context, {
    required void Function(DateTime date, TimeOfDay time, bool isAm) onConfirm,
    DateTime? initialDate,
    TimeOfDay? initialTime,
    bool initialIsAm = true,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ClientTimeDateBottomSheet(
        onConfirm: onConfirm,
        initialDate: initialDate,
        initialTime: initialTime,
        initialIsAm: initialIsAm,
      ),
    );
  }

  @override
  State<ClientTimeDateBottomSheet> createState() =>
      _ClientTimeDateBottomSheetState();
}

class _ClientTimeDateBottomSheetState
    extends State<ClientTimeDateBottomSheet> {
  int _activeTab = 0;
  DateTime? _selectedDate;
  late bool _isAm;

  late final WheelPickerController _hourController;
  late final WheelPickerController _minuteController;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _isAm = widget.initialIsAm;
    final t = widget.initialTime ?? const TimeOfDay(hour: 10, minute: 0);
    final hour = t.hour > 12 ? t.hour - 12 : (t.hour == 0 ? 12 : t.hour);
    _hourController = WheelPickerController(itemCount: 12, initialIndex: hour - 1);
    _minuteController = WheelPickerController(itemCount: 60, initialIndex: t.minute);
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  TimeOfDay get _selectedTime {
    final hour = _hourController.selected + 1;
    final minute = _minuteController.selected;
    final hour24 = _isAm
        ? (hour == 12 ? 0 : hour)
        : (hour == 12 ? 12 : hour + 12);
    return TimeOfDay(hour: hour24, minute: minute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: context.height * 0.92),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.width * 0.3,
            height: 6,
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(tr.timeAndDate, style: context.semiBold18TextMain),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.textMain,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ),
          20.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.textBorders,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  _TabPill(
                    label: tr.date,
                    isActive: _activeTab == 0,
                    onTap: () => setState(() => _activeTab = 0),
                  ),
                  _TabPill(
                    label: tr.time,
                    isActive: _activeTab == 1,
                    onTap: () => setState(() => _activeTab = 1),
                  ),
                ],
              ),
            ),
          ),
          20.h,
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _activeTab == 0 ? _buildDateTab() : _buildTimeTab(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: CustomButton(
              title: tr.confirm,
              onPress: () {
                if (_selectedDate != null) {
                  Navigator.pop(context);
                  widget.onConfirm(_selectedDate!, _selectedTime, _isAm);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTab() {
    return CustomCalendar(
      onDateSelected: (date) => setState(() => _selectedDate = date),
      initialDate: _selectedDate,
    );
  }

  Widget _buildTimeTab(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.textBorders),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(5, (i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(tr.start, style: context.regular14TextSub),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: WheelPicker(
                        builder: (ctx, index) => Text(
                          '${index + 1 == 13 ? 1 : (index + 1) > 12 ? index - 11 : index + 1}'
                          ':00',
                          style: context.regular14TextMain,
                        ),
                        controller: _hourController,
                        looping: true,
                        style: WheelPickerStyle(
                          itemExtent: 40,
                          squeeze: 1.0,
                          diameterRatio: 1.2,
                          magnification: 1.1,
                        ),
                      ),
                    ),
                    16.w,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _AmPmButton(label: tr.am, isSelected: _isAm, onTap: () => setState(() => _isAm = true)),
                        _AmPmButton(label: tr.pm, isSelected: !_isAm, onTap: () => setState(() => _isAm = false)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabPill extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _TabPill({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: isActive
                ? context.regular14White
                : context.regular14TextSub,
          ),
        ),
      ),
    );
  }
}

class _AmPmButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _AmPmButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: isSelected
              ? Border.all(color: AppColors.textBorders)
              : null,
        ),
        child: Text(
          label,
          style: isSelected
              ? context.regular12TextMain
              : context.regular12TextSub,
        ),
      ),
    );
  }
}

extension _ContextExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
