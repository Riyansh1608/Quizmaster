import 'package:flutter/material.dart';
import 'package:quizmaster/pages/splashscreen.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splash(),
    );
  }
}

