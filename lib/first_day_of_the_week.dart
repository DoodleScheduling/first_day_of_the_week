import 'first_day_of_the_week_platform_interface.dart';

class FirstDayOfTheWeek {
  /// 1 - Monday,
  /// 2 - Tuesday,
  /// 3 - Wednesday,
  /// 4 - Thursday,
  /// 5 - Friday,
  /// 6 - Saturday
  /// 7 - Sunday,
  static int? value;

  static Future<void> init() async {
    value = await FirstDayOfTheWeekPlatform.instance.get();
  }
}
