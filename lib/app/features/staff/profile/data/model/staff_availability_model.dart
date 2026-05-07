import 'package:bookly_x_client/app/core/enums/weeks_days_enum.dart';

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
      dayOfWeek: (json['dayOfWeek'] as num?)?.toInt() ?? 0,
      startTime: json['startTime']?.toString() ?? '',
      endTime: json['endTime']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'dayOfWeek': dayOfWeek,
        'startTime': startTime,
        'endTime': endTime,
      };
}
