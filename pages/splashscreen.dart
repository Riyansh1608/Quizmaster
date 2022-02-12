import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizmaster/pages/homescreen.dart';

class splash extends StatefulWidget {

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {


  @override

  void initState()
  {

    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text('QuizMaster',
        style: TextStyle(
          fontSize: 50.0,
          color: Colors.white,
          fontFamily: "Satisfy",
        ),
        ),
      ),
    );
  }
}
