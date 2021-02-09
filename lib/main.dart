import 'package:flutter/material.dart';
import 'package:plant/tflite/tenserflow.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tensorflow Lite',
      home: Tensorflow(),
    );
  }
}