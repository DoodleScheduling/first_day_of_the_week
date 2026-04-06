import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'first_day_of_the_week_platform_interface.dart';

/// An implementation of [FirstDayOfTheWeekPlatform] that uses method channels.
class MethodChannelFirstDayOfTheWeek extends FirstDayOfTheWeekPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('first_day_of_the_week');

  @override
  Future<int?> get() async {
    final platformDay = await methodChannel.invokeMethod<int>(
      'getFirstDayOfWeek',
    );
    if (platformDay == null) {
      return null;
    }

    // Both iOS (through Foundation's Calendar) and Android (Java Calendar) use
    // 1 for Sunday, while Dart's DateTime uses 1 for Monday, which is in
    // accordance with ISO 8601. Neither of them index any days to zero (days go
    // from 1 through 7).
    //
    // Offset days by -1, skipping zero.
    return ((platformDay - 2) % 7) + 1;
  }
}
