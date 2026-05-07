import 'package:bookly_x_client/app/core/enums/weeks_days_enum.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_availability_model.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/controllers/staff_availability_notifier.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/controllers/staff_profile_future_provider.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_time_field.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class StaffWorkScheduleBottomSheet extends ConsumerStatefulWidget {
  const StaffWorkScheduleBottomSheet({
    super.key,
    required this.availabilities,
  });

  final List<StaffAvailabilityModel> availabilities;

  static void showBottomSheet(
    BuildContext context, {
    required List<StaffAvailabilityModel> availabilities,
  }) {
    context.showBottomSheet(
      bottomSheetBody: StaffWorkScheduleBottomSheet(
        availabilities: availabilities,
      ),
    );
  }

  @override
  ConsumerState<StaffWorkScheduleBottomSheet> createState() =>
      _StaffWorkScheduleBottomSheetState();
}

class _StaffWorkScheduleBottomSheetState
    extends ConsumerState<StaffWorkScheduleBottomSheet> {
  late final List<_ScheduleDraft> _draft;

  @override
  void initState() {
    super.initState();
    _draft = _buildDraft(widget.availabilities);
  }

  @override
  Widget build(BuildContext context) {
    final saving = ref.watch(staffAvailabilityNotifierProvider).isLoading;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(tr.editWorkSchedule, style: context.semiBold18Primary),
          18.h,
          SizedBox(
            height: 450,
            child: ListView.separated(
              itemCount: _draft.length,
              separatorBuilder: (context, index) => 14.h,
              itemBuilder: (context, index) {
                final item = _draft[index];
                return _StaffWorkScheduleDayCard(
                    day: item.day,
                    isEnabled: item.isEnabled,
                    startTime: _displayTime(item.startTime),
                    endTime: _displayTime(item.endTime),
                    onToggle: (value) {
                      setState(() => item.isEnabled = value);
                    },
                    onStartTap: () {
                      _pickTime(
                          initialTime: item.startTime,
                          onSelected: (value) {
                            setState(() => item.startTime = value);
                          });
                    },
                    onEndTap: () {
                      _pickTime(
                          initialTime: item.endTime,
                          onSelected: (value) {
                            setState(() => item.endTime = value);
                          });
                    });
              },
            ),
          ),
          const Divider(height: 1, color: AppColors.textBorders),
          16.h,
          CustomButton(
            title: tr.saveChanges,
            prefixIcon: MyIcons.save2Outline,
            prefixIconSize: 18,
            buttonColor: AppColors.primary,
            titleColor: AppColors.white,
            isLoading: saving,
            onPress: _saveChanges,
          ),
          10.h,
          CustomButtonOutlined(
            title: tr.cancel,
            buttonColor: AppColors.textBorders,
            titleColor: AppColors.primary2,
            borderColor: AppColors.textBorders,
            isDisabled: saving,
            onPress: context.pop,
          ),
        ],
      ),
    );
  }

  Future<void> _saveChanges() async {
    final nextAvailabilities = _draft
        .where((entry) => entry.isEnabled)
        .map(
          (entry) => StaffAvailabilityModel(
            id: entry.id,
            dayOfWeek: entry.day.index,
            startTime: entry.startTime,
            endTime: entry.endTime,
          ),
        )
        .toList();

    final success = await ref
        .read(staffAvailabilityNotifierProvider.notifier)
        .saveAvailabilities(
          currentAvailabilities: widget.availabilities,
          draftAvailabilities: nextAvailabilities,
        );
    if (!success || !mounted) {
      return;
    }
    ref.invalidate(staffProfileFutureProvider);
    context.pop();
  }

  Future<void> _pickTime({
    required String initialTime,
    required ValueChanged<String> onSelected,
  }) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: _parseToTimeOfDay(initialTime),
    );
    if (selected == null) {
      return;
    }
    onSelected(_toApiTime(selected));
  }

  TimeOfDay _parseToTimeOfDay(String value) {
    final parts = value.split(':');
    if (parts.length != 2) {
      return const TimeOfDay(hour: 9, minute: 0);
    }
    return TimeOfDay(
      hour: int.tryParse(parts[0]) ?? 9,
      minute: int.tryParse(parts[1]) ?? 0,
    );
  }

  String _displayTime(String value) {
    try {
      final date = DateFormat('HH:mm').parseStrict(value);
      return DateFormat('hh:mm a').format(date);
    } catch (_) {
      return value;
    }
  }

  String _toApiTime(TimeOfDay value) {
    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  List<_ScheduleDraft> _buildDraft(
      List<StaffAvailabilityModel> availabilities) {
    return WeeksDaysEnum.values.map((day) {
      final existing =
          availabilities.where((item) => item.dayOfWeek == day.index);
      final availability = existing.isNotEmpty ? existing.first : null;
      return _ScheduleDraft(
        id: availability?.id ?? 0,
        day: day,
        isEnabled: availability != null,
        startTime: availability?.startTime ?? '09:00',
        endTime: availability?.endTime ?? '17:00',
      );
    }).toList();
  }
}

class _StaffWorkScheduleDayCard extends StatelessWidget {
  const _StaffWorkScheduleDayCard({
    required this.day,
    required this.isEnabled,
    required this.startTime,
    required this.endTime,
    required this.onToggle,
    required this.onStartTap,
    required this.onEndTap,
  });

  final WeeksDaysEnum day;
  final bool isEnabled;
  final String startTime;
  final String endTime;
  final ValueChanged<bool> onToggle;
  final VoidCallback onStartTap;
  final VoidCallback onEndTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isEnabled ? AppColors.white : AppColors.whiteCatskillWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.textBorders),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                day.displayName,
                style: isEnabled
                    ? context.semiBold16TextMain
                    : context.semiBold16TextSub,
              ),
              const Spacer(),
              Switch(
                value: isEnabled,
                onChanged: onToggle,
              ),
            ],
          ),
          8.h,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr.startTime, style: context.regular12TextSub),
                    8.h,
                    StaffTimeField(
                      value: startTime,
                      onTap: isEnabled ? onStartTap : () {},
                      dimmed: !isEnabled,
                    ),
                  ],
                ),
              ),
              12.w,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr.endTime, style: context.regular12TextSub),
                    8.h,
                    StaffTimeField(
                      value: endTime,
                      onTap: isEnabled ? onEndTap : () {},
                      dimmed: !isEnabled,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScheduleDraft {
  _ScheduleDraft({
    required this.id,
    required this.day,
    required this.isEnabled,
    required this.startTime,
    required this.endTime,
  });

  final int id;
  final WeeksDaysEnum day;
  bool isEnabled;
  String startTime;
  String endTime;
}
