import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:intl/intl.dart';

abstract final class DateToString {
  const DateToString();

  static String call(DateTime time, bool putTodayWord) {
    final DateTime timeToday = DateTime(time.year, time.month, time.day);

    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = today.subtract(const Duration(days: 1));

    if (timeToday.isAtSameMomentAs(today)) {
      if (putTodayWord) return S.current.today;
      return DateFormat.jm().format(time);
    } else if (timeToday.isAtSameMomentAs(yesterday)) {
      return S.current.yesterday;
    } else if (time.isAfter(now.subtract(const Duration(days: 8)))) {
      return DateFormat.EEEE().format(time);
    }
    return DateFormat.yMMMd().format(time);
  }

  static String lastLoginText(DateTime time) {
    final DateTime timeToday = DateTime(time.year, time.month, time.day);

    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = today.subtract(const Duration(days: 1));

    final String timeString = DateFormat.jm().format(time);

    if (timeToday.isAtSameMomentAs(today)) {
      return S.current.atTimeString(timeString) ;
    } else if (timeToday.isAtSameMomentAs(yesterday)) {
      return S.current.yesterdayAtTimeString(timeString);
    } else if (time.isAfter(now.subtract(const Duration(days: 8)))) {
      return S.current.dateTimeString(timeString, DateFormat.EEEE().format(time));
    }
    return S.current.dateTimeString(timeString, DateFormat.yMMMd().format(time));
  }
}
