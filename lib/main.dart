import 'package:flutter/material.dart';
import 'mainPage/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      title: "AGNO HUNTER",
      darkTheme: now.isAfter(DateTime(now.year, now.month, now.day, 19))
          ? ThemeData.light()
          : ThemeData.dark(),
    );
  }
}
