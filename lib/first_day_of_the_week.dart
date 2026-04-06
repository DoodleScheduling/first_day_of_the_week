import 'first_day_of_the_week_platform_interface.dart';

class FirstDayOfTheWeek {
  const FirstDayOfTheWeek({required this.defaultValue});

  final int defaultValue;

  Future<int?> getValue() async =>
      await FirstDayOfTheWeekPlatform.instance.get();

  Future<int> getValueOrDefault() async => await getValue() ?? defaultValue;
}
