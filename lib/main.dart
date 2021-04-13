import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant/pages/homescreen.dart';
import 'package:plant/tflite/tenserflow.dart';


Future main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Color(0xff00600f),
      ),
      title: 'Plantify',
      home: homeScreen(),
    );
  }
}