import 'package:bookly_x_client/generated/translations.g.dart';

enum WeeksDaysEnum {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday;

  static WeeksDaysEnum fromString(String day) {
    switch (day.toLowerCase()) {
      case 'monday':
        return WeeksDaysEnum.monday;
      case 'tuesday':
        return WeeksDaysEnum.tuesday;
      case 'wednesday':
        return WeeksDaysEnum.wednesday;
      case 'thursday':
        return WeeksDaysEnum.thursday;
      case 'friday':
        return WeeksDaysEnum.friday;
      case 'saturday':
        return WeeksDaysEnum.saturday;
      case 'sunday':
        return WeeksDaysEnum.sunday;
      default:
        throw ArgumentError('Invalid day string: $day');
    }
  }

  String get displayName {
    switch (this) {
      case WeeksDaysEnum.monday:
        return tr.weekdays.monday;
      case WeeksDaysEnum.tuesday:
        return tr.weekdays.tuesday;
      case WeeksDaysEnum.wednesday:
        return tr.weekdays.wednesday;
      case WeeksDaysEnum.thursday:
        return tr.weekdays.thursday;
      case WeeksDaysEnum.friday:
        return tr.weekdays.friday;
      case WeeksDaysEnum.saturday:
        return tr.weekdays.saturday;
      case WeeksDaysEnum.sunday:
        return tr.weekdays.sunday;
    }
  }

  String get shortCode {
    return switch (this) {
      WeeksDaysEnum.monday => 'MON',
      WeeksDaysEnum.tuesday => 'TUE',
      WeeksDaysEnum.wednesday => 'WED',
      WeeksDaysEnum.thursday => 'THU',
      WeeksDaysEnum.friday => 'FRI',
      WeeksDaysEnum.saturday => 'SAT',
      WeeksDaysEnum.sunday => 'SUN',
    };
  }

  bool get isMonday => this == WeeksDaysEnum.monday;
  bool get isTuesday => this == WeeksDaysEnum.tuesday;
  bool get isWednesday => this == WeeksDaysEnum.wednesday;
  bool get isThursday => this == WeeksDaysEnum.thursday;
  bool get isFriday => this == WeeksDaysEnum.friday;
  bool get isSaturday => this == WeeksDaysEnum.saturday;
  bool get isSunday => this == WeeksDaysEnum.sunday;
}
