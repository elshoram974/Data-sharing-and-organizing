import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:intl/intl.dart';

abstract final class DateToString {
  const DateToString();

  static String call(DateTime time, bool putTodayWord) {
    final DateTime now = DateTime.now();
    if (time.day == now.day) {
      if (putTodayWord) return S.current.today;
      return DateFormat.jm().format(time);
    } else if (time.day == now.subtract(const Duration(days: 1)).day) {
      return S.current.yesterday;
    } else if (time.day > now.subtract(const Duration(days: 7)).day) {
      return DateFormat.E().format(time);
    }
    return DateFormat.yMMMd().format(time);
  }
}
