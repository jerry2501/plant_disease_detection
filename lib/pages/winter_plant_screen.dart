import 'package:flutter/material.dart';
import 'package:plant/pages/nothing.dart';
import 'package:plant/pages/plant_screen.dart';
import 'package:plant/widgets/sliding_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class WinterPlantScreen extends StatefulWidget {
  @override
  _WinterPlantScreenState createState() => _WinterPlantScreenState();
}

class _WinterPlantScreenState extends State<WinterPlantScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: SafeArea(
                child: TabBar(
                  indicatorColor: Colors.green,
                  tabs: [
                    Tab(
                      text: "Home",
                    ),
                    Tab(
                      text: "Work",
                    ),
                    Tab(
                      text: "Play",
                    ),
                  ],
                  labelColor: Colors.white,
                  unselectedLabelColor: Theme.of(context).primaryColor,
                  indicator: RectangularIndicator(
                    bottomLeftRadius: 100,
                    bottomRightRadius: 100,
                    topLeftRadius: 100,
                    topRightRadius: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [Slidingpanel(), Nothing(), Nothing()],
            )),
      ),
    );
  }
}
