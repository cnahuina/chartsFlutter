import 'package:flutter/material.dart';
import 'package:reports_pelotero/pages/reports_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      home: ReportsScreen(),
    );
  }
}

