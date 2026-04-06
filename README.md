
# first_day_of_the_week

`first_day_of_the_week` is a Flutter plugin that allows you to retrieve the system's first day of the week on both Android and iOS. This can be particularly useful for calendar and scheduling applications.

## Features

- Get the system's first day of the week.
- Supports both Android and iOS platforms.

## Installation

Add `first_day_of_the_week` to your `pubspec.yaml` file:

```yaml
dependencies:
  first_day_of_the_week: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

First, ensure you initialize the plugin by calling the `init` method. This will retrieve and set the first day of the week from the system.

```dart
import 'package:first_day_of_the_week/first_day_of_the_week.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the plugin to get the first day of the week
  await FirstDayOfTheWeek.init();

  // Access the first day of the week
  int? firstDay = FirstDayOfTheWeek.value;
  print("The first day of the week is: $firstDay");

  runApp(MyApp());
}
```

### Day of the Week Mapping

The days of the week are represented as follows:


- 1 - Monday
- 2 - Tuesday
- 3 - Wednesday
- 4 - Thursday
- 5 - Friday
- 6 - Saturday
- 7 - Sunday

## Example

```dart
import 'package:flutter/material.dart';
import 'package:first_day_of_the_week/first_day_of_the_week.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the plugin to get the first day of the week
  await FirstDayOfTheWeek.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Day of the Week Example'),
        ),
        body: Center(
          child: Text(
            'The first day of the week is: ${FirstDayOfTheWeek.value}',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
