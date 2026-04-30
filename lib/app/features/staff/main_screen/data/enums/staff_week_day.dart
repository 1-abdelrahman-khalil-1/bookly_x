import 'package:bookly_x_client/generated/translations.g.dart';

enum StaffWeekDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension StaffWeekDayX on StaffWeekDay {
  String label(Translations tr) {
    return switch (this) {
      StaffWeekDay.monday => tr.monday,
      StaffWeekDay.tuesday => tr.tuesday,
      StaffWeekDay.wednesday => tr.wednesday,
      StaffWeekDay.thursday => tr.thursday,
      StaffWeekDay.friday => tr.friday,
      StaffWeekDay.saturday => tr.saturday,
      StaffWeekDay.sunday => tr.sunday,
    };
  }

  String get shortCode {
    return switch (this) {
      StaffWeekDay.monday => 'MON',
      StaffWeekDay.tuesday => 'TUE',
      StaffWeekDay.wednesday => 'WED',
      StaffWeekDay.thursday => 'THU',
      StaffWeekDay.friday => 'FRI',
      StaffWeekDay.saturday => 'SAT',
      StaffWeekDay.sunday => 'SUN',
    };
  }
}
