import 'package:bookly_x/app/core/enums/weeks_days_enum.dart';

class StaffAvailabilityModel {
  final int id;
  final int dayOfWeek;
  final String startTime;
  final String endTime;

  const StaffAvailabilityModel({
    required this.id,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  WeeksDaysEnum? get weekDay {
    if (dayOfWeek < 0 || dayOfWeek > 6) {
      return null;
    }
    return WeeksDaysEnum.values[dayOfWeek];
  }

  factory StaffAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return StaffAvailabilityModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      dayOfWeek: (json['day_of_week'] as num?)?.toInt() ?? 0,
      startTime: json['start_time']?.toString() ?? '',
      endTime: json['end_time']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'day_of_week': dayOfWeek,
        'start_time': startTime,
        'end_time': endTime,
      };
}
