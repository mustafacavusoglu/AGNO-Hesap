import 'package:flutter/material.dart';
import 'operations/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        title: "AGNO HUNTER",
        theme: ThemeData?.light(),
        darkTheme: ThemeData.dark(),
        themeMode: now.isBefore(DateTime(now.year, now.month, now.day, 19,30))
            ? ThemeMode.light
            : ThemeMode.dark);
  }
}
