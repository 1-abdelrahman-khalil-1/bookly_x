import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_calendar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x_client/app/features/client/booking_service/presentation/controller/booking_flow_providers.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientSelectDateTimeView extends ConsumerStatefulWidget {
  final BookingFlowData flowData;
  final void Function(DateTime date, TimeOfDay time) onNext;

  const ClientSelectDateTimeView({
    super.key,
    required this.flowData,
    required this.onNext,
  });

  @override
  ConsumerState<ClientSelectDateTimeView> createState() =>
      _ClientSelectDateTimeViewState();
}

class _ClientSelectDateTimeViewState
    extends ConsumerState<ClientSelectDateTimeView> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.flowData.selectedDate;
    _selectedTime = widget.flowData.selectedTime;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h,
          Text("${tr.date} & ${tr.time}", style: context.semiBold16TextMain),
          20.h,
          Column(
            children: [
              CustomCalendar(
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                    _selectedTime = null;
                  });
                },
                initialDate: _selectedDate,
              ),
              24.h,
              _buildTimeTab(context)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              title: tr.next,
              onPress: () {
                if (_selectedDate == null) {
                  setWarningMessage(tr.pleaseSelectDate);
                  return;
                }
                if (_selectedTime == null) {
                  setWarningMessage(tr.pleaseSelectTime);
                  return;
                }
                widget.onNext(
                  _selectedDate!,
                  _selectedTime!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeTab(BuildContext context) {
    if (_selectedDate == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text(tr.pleaseSelectDate, style: context.regular14TextSub),
        ),
      );
    }

    final timeSlots =
        ref.watch(bookingAvailableTimeSlotsProvider(_selectedDate!));

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: timeSlots.map((time) {
        final isSelected = _isSameTime(_selectedTime, time);
        return GestureDetector(
          onTap: () => setState(() => _selectedTime = time),
          child: Container(
            width: (MediaQuery.of(context).size.width - 40 - 24) /
                3, // 3 items per row
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.textBorders,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              time.format(context),
              style: isSelected
                  ? context.semiBold14White
                  : context.semiBold14TextMain,
            ),
          ),
        );
      }).toList(),
    );
  }

  bool _isSameTime(TimeOfDay? first, TimeOfDay second) {
    if (first == null) {
      return false;
    }
    return first.hour == second.hour && first.minute == second.minute;
  }
}
