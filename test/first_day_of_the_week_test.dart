import 'package:flutter_test/flutter_test.dart';
import 'package:first_day_of_the_week/first_day_of_the_week.dart';
import 'package:first_day_of_the_week/first_day_of_the_week_platform_interface.dart';
import 'package:first_day_of_the_week/first_day_of_the_week_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFirstDayOfTheWeekPlatform
    with MockPlatformInterfaceMixin
    implements FirstDayOfTheWeekPlatform {
  @override
  Future<int?> get() {
    return Future<int?>.value(1);
  }
}

void main() {
  final FirstDayOfTheWeekPlatform initialPlatform =
      FirstDayOfTheWeekPlatform.instance;

  test('$MethodChannelFirstDayOfTheWeek is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFirstDayOfTheWeek>());
  });

  test('get first day of week', () async {
    MockFirstDayOfTheWeekPlatform fakePlatform =
        MockFirstDayOfTheWeekPlatform();
    FirstDayOfTheWeekPlatform.instance = fakePlatform;

    expect(
      await const FirstDayOfTheWeek(
        defaultValue: DateTime.wednesday,
      ).getValue(),
      1,
    );
  });
}
