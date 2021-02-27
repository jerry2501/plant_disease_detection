import 'package:flutter/material.dart';
import 'package:plant/pages/nothing.dart';
import 'package:plant/pages/winter_plant_screen.dart';
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
        body: TabBarView(children: [
          WinterPlantScreen(),
          Nothing(),
          Nothing(),
        ]),
      ),
    );
  }
}
