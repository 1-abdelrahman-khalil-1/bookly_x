import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_transform_arabic.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    required this.onDateSelected,
    this.initialDate,
    this.firstDay,
    this.lastDay,
    this.selectedDayDecoration,
    this.todayDecoration,
  });

  final Function(DateTime selectedDate) onDateSelected;
  final DateTime? initialDate;
  final DateTime? firstDay;
  final DateTime? lastDay;
  final BoxDecoration? selectedDayDecoration;
  final BoxDecoration? todayDecoration;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _selectedDate;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
    _focusedDay = _selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.textBorders),
      ),
      child: TableCalendar(
        firstDay: widget.firstDay ?? DateTime.now(),
        lastDay:
            widget.lastDay ?? DateTime.now().add(const Duration(days: 365)),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
        locale: LocaleSettings.currentLocale.languageCode,
        startingDayOfWeek: StartingDayOfWeek.saturday,
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: context.regular16TextMain,
          leftChevronIcon: CustomTransformArabic(
            child: const Icon(
              MyIcons.arrowLeftOutline,
              color: AppColors.textMain,
            ),
          ),
          rightChevronIcon: CustomTransformArabic(
              child: const Icon(
            MyIcons.arrowRightOutline,
            color: AppColors.textMain,
          )),
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: context.regular14TextMain,
          weekendTextStyle: context.regular14TextMain,
          outsideTextStyle: context.regular14TextPlaceholder,
          selectedDecoration: widget.selectedDayDecoration ??
              BoxDecoration(
                color: AppColors.primary2.withAlpha(150),
                shape: BoxShape.circle,
              ),
          selectedTextStyle: context.regular14White,
          todayDecoration: widget.todayDecoration ??
              const BoxDecoration(
                color: AppColors.textBorders,
                shape: BoxShape.circle,
              ),
          todayTextStyle: context.regular14TextMain,
          disabledTextStyle: context.regular14TextPlaceholder,
        ),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDate = selectedDay;
            _focusedDay = focusedDay;
          });
          widget.onDateSelected(selectedDay);
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
      ),
    );
  }
}
