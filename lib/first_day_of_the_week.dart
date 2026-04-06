import 'first_day_of_the_week_platform_interface.dart';

/// Provides methods to access the first day of the week on the current
/// platform.
class FirstDayOfTheWeek {
  const FirstDayOfTheWeek({required this.defaultValue});

  /// The default value to return if the platform does not provide a value.
  final int defaultValue;

  /// Returns the first day of the week as an integer whose value corresponds to
  /// the [DateTime] constants from the Dart core library (`DateTime.monday` to
  /// `DateTime.sunday`), where 1 represents Monday and 7 represents Sunday.
  Future<int?> getValue() async =>
      await FirstDayOfTheWeekPlatform.instance.get();

  /// Returns the first day of the week as an integer, or the default value if
  /// the platform does not provide a value.
  Future<int> getValueOrDefault() async => await getValue() ?? defaultValue;
}
