import 'package:flutter/material.dart';
import 'package:plant/pages/homescreen.dart';
import 'package:plant/tflite/tenserflow.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Color(0xff00600f),
      ),
      title: 'Tensorflow Lite',
      home: homeScreen(),
    );
  }
}