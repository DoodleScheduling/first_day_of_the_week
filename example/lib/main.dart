import 'package:flutter/material.dart';
import 'package:first_day_of_the_week/first_day_of_the_week.dart';

void main() async {
  runApp(
    const MyApp(
        firstDayOfTheWeek: FirstDayOfTheWeek(defaultValue: DateTime.wednesday)),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.firstDayOfTheWeek});

  final FirstDayOfTheWeek firstDayOfTheWeek;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<int> _firstDayOfWeek;

  @override
  void initState() {
    super.initState();
    _firstDayOfWeek = widget.firstDayOfTheWeek.getValueOrDefault();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First day of the week example'),
        ),
        body: Center(
          child: Column(
            children: [
              FutureBuilder<int>(
                future: _firstDayOfWeek,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(
                        'First day of week on device: ${snapshot.data}');
                  }
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final newValue =
                      await widget.firstDayOfTheWeek.getValueOrDefault();
                  setState(() {
                    _firstDayOfWeek = Future.value(newValue);
                  });
                },
                child: const Text('Refresh'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
