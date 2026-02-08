// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../data/lang_pref.dart';

String getTimeAgo(DateTime time) {
  final dateAgo = timeago.format(time);
  if (dateAgo.contains('moment') || dateAgo.contains('minute')) {
    return dateAgo;
  } else {
    final formattedTime = DateFormat('hh:mm a').format(time);
    final formattedDate = DateFormat('dd/MM/yyyy').format(time);
    return '$formattedDate \t $formattedTime';
  }
}

String formatTime(String time) {
  try {
    final DateFormat inputFormat = DateFormat('HH:mm');
    final DateFormat outputFormat = DateFormat('hh:mm a');
    final DateTime dateTime = inputFormat.parse(time);
    String formattedTime = outputFormat.format(dateTime);
    if (isArabic) {
      formattedTime = formattedTime.replaceAll('AM', 'ص').replaceAll('PM', 'م');
    }
    return formattedTime;
  } catch (e) {
    return time;
  }
}

String formatTimeIsArabic(String time, bool isArabic) {
  try {
    final DateFormat inputFormat = DateFormat('HH:mm');
    final DateFormat outputFormat = DateFormat(
      'h:mm a',
      isArabic ? 'ar' : 'en',
    );

    final DateTime dateTime = inputFormat.parse(time);
    return outputFormat.format(dateTime);
  } catch (e) {
    return time;
  }
}

String formatDayToArabic(int day, bool isArabic) {
  if (!isArabic) return day.toString();
  final arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  return day
      .toString()
      .split('')
      .map((digit) => arabicNumbers[int.parse(digit)])
      .join();
}

String formatDate(String dateString) {
  try {
    final DateTime date = DateFormat('yyyy-MM-dd').parse(dateString);

    final DateFormat dayFormat = DateFormat('EEEE', 'en');
    final DateFormat monthFormat = DateFormat('MMMM', 'en');
    final String dayNumber = DateFormat('d').format(date);
    final Map<String, String> arabicDays = {
      'Sunday': 'الأحد',
      'Monday': 'الإثنين',
      'Tuesday': 'الثلاثاء',
      'Wednesday': 'الأربعاء',
      'Thursday': 'الخميس',
      'Friday': 'الجمعة',
      'Saturday': 'السبت',
    };
    final Map<String, String> arabicMonths = {
      'January': 'يناير',
      'February': 'فبراير',
      'March': 'مارس',
      'April': 'أبريل',
      'May': 'مايو',
      'June': 'يونيو',
      'July': 'يوليو',
      'August': 'أغسطس',
      'September': 'سبتمبر',
      'October': 'أكتوبر',
      'November': 'نوفمبر',
      'December': 'ديسمبر',
    };
    String dayName = dayFormat.format(date);
    String monthName = monthFormat.format(date);
    if (isArabic) {
      dayName = arabicDays[dayName] ?? dayName;
      monthName = arabicMonths[monthName] ?? monthName;
    }
    return '$dayName $dayNumber $monthName';
  } catch (e) {
    return dateString;
  }
}
