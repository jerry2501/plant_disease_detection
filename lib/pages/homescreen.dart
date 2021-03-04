import 'dart:io';

import 'package:fbutton/fbutton.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant/pages/nothing.dart';
import 'package:plant/pages/winter_plant_screen.dart';
import 'package:plant/tflite/tenserflow.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Plantify'),
            bottom: TabBar(
              indicatorColor: Colors.green,
              tabs: [
                Tab(
                  text: "Winter",
                ),
                Tab(
                  text: "Summer",
                ),
                Tab(
                  text: "Monsoon",
                ),
              ],
              labelColor: Colors.white,
              indicator: MaterialIndicator(
                height: 5,
                topLeftRadius: 8,
                topRightRadius: 8,
                horizontalPadding: 50,
                tabPosition: TabPosition.bottom,
                color: Colors.white,
              ),
            ),
          ),
          body: Stack(children: [
            TabBarView(children: [
              WinterPlantScreen(),
              Nothing(),
              Nothing(),
            ]),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.01,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FButton(
                      padding: EdgeInsets.all(5),
                      width: 200,
                      text: "Assess Your Plant",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        stops: [0.05,0.1,1],
                        colors: [Color(0xff00600f), Color(0xff097913),Color(0xff664fb3),],
                      ),
                      onPressed: () async{
                        File file = await ImagePicker.pickImage(source: ImageSource.gallery);
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Tensorflow(file)));
                      },
                      clickEffect: true,
                      corner: FCorner.all(20),
                      image: Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 30,
                      ),
                      highlightColor: Color(0xff097913).withOpacity(0.20),
                      hoverColor: Color(0xff42a355).withOpacity(0.16),
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
