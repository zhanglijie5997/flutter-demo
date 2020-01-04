class Base {
  /// 时间格式化
  /// time 当前时间
  static timeFormat(String time) {
    DateTime currentDate = DateTime.parse(time);
    int year = currentDate.year; // 年
    int month = currentDate.month;// 月
    int day = currentDate.day; // 日
    int houre = currentDate.hour;// 时
    int millisecond = currentDate.millisecond;// 分
    return {
      "year": year,
      "month": month,
      "day": day,
      "houre": houre,
      "millisecond": millisecond,
    };
  }
  /// 字符串转换时间
  /// year  年
  /// month 月
  /// day   日
  /// houre 时
  /// mill  分
  static int stringToTime(int year, int month, int day, int houre, int mill) {
    DateTime time = new DateTime(year, month, day, houre, mill);
    int dateTimeToInt = time.millisecondsSinceEpoch;
    return dateTimeToInt;
  }
}