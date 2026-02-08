import 'package:intl/intl.dart' show DateFormat;

extension DateTimeFormat on DateTime {
  DateTime adjustForCountryTimeZone(DateTime dateTime) {
    // Get the time zone offset for the specified country
    final Duration timeZoneOffset = DateTime.now().timeZoneOffset;

    // Adjust the date time by the time zone offset
    return dateTime.add(timeZoneOffset);
  }

  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(adjustForCountryTimeZone(this));

  String get formattedTime =>
      DateFormat('hh:mm a').format(adjustForCountryTimeZone(this));
}
