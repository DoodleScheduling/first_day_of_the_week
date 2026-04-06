import 'first_day_of_the_week_platform_interface.dart';

class FirstDayOfTheWeek {
  const FirstDayOfTheWeek({required this.defaultValue});

  final DayOfWeek defaultValue;

  Future<DayOfWeek?> getValue() async {
    final value = await FirstDayOfTheWeekPlatform.instance.get();
    if (value == null) {
      return null;
    }
    return DayOfWeek.fromValue(value);
  }

  Future<DayOfWeek> getValueOrDefault() async =>
      await getValue() ?? defaultValue;
}

enum DayOfWeek {
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6),
  sunday(7);

  const DayOfWeek(this.value);

  final int value;

  static DayOfWeek? fromValue(int value) {
    for (var day in DayOfWeek.values) {
      if (day.value == value) {
        return day;
      }
    }
    return null;
  }
}
