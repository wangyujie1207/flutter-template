import 'package:flutter_template/ui/helper/duration_extension.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'object_util.dart';

enum TimeFormatType { DHMS, HMS }

class TimeUtil {
  static String formatTime({String? formatter, DateTime? time}) {
    String formatterString = ObjectUtil.isEmptyString(formatter)
        ? "yyyy-MM-dd HH:mm:ss"
        : formatter!;
    var dateFormatter = DateFormat(formatterString);
    return dateFormatter.format(time ?? DateTime.now());
  }

  static DateTime? stringToDateTime(String dateString) {
    String formattedString = dateString.replaceAll(".", "-");
    DateTime? dateTime;
    try {
      dateTime = DateTime.parse(formattedString);
    } catch (e) {
      dateTime = null;
    }
    return dateTime;
  }

  static String formatFromSecond(
      int seconds, {
        String day = ':',
        String hour = ':',
        String minute = ':',
        String second = ':',
        TimeFormatType mode = TimeFormatType.HMS,
      }) {
    Duration duration = Duration(seconds: seconds);
    String d = duration.inDaysRest.toString().padLeft(2, '0');
    String h = duration.inHoursRest.toString().padLeft(2, '0');
    String m = duration.inMinutesRest.toString().padLeft(2, '0');
    String s = duration.inSecondsRest.toString().padLeft(2, '0');
    return mode == TimeFormatType.HMS
        ? '$h$hour$m$minute$s'
        : '$d$day$h$hour$m$minute$s';
  }

  static Duration now2endTimeDiff(String endTime) {
    DateTime _now = DateTime.now();
    final DateTime _endTime = DateTime.tryParse(endTime) ?? _now;
    if (_endTime.isAfter(_now)) {
      Duration _result = _endTime.difference(_now);
      return _result;
    } else {
      return const Duration(seconds: 0);
    }
  }

  static Future<String> fromNow(String time,
      [String pattern = 'yyyy-MM-dd hh:mm:ss']) async {
    await Jiffy.locale("zh_cn");
    return Jiffy(time, pattern).fromNow();
  }
}
