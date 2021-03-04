import 'package:flutter/material.dart';
import 'package:plant/widgets/sliding_panel.dart';

class PlantScreen extends StatefulWidget {
  @override
  _PlantScreenState createState() => _PlantScreenState();
}
class _PlantScreenState extends State<PlantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Slidingpanel(),
      ],),
    );
  }
}