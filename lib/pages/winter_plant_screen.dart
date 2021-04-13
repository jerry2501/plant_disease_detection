import 'package:flutter/material.dart';
import 'package:plant/pages/nothing.dart';

import 'package:plant/widgets/sliding_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class WinterPlantScreen extends StatefulWidget {
  final plant_list;
  WinterPlantScreen({@required this.plant_list});
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
                      text: widget.plant_list[0]['plant_name'],
                    ),
                    Tab(
                      text: widget.plant_list[1]['plant_name'],
                    ),
                    Tab(
                      text: widget.plant_list[2]['plant_name'],
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
              children: [
                Slidingpanel(plant:widget.plant_list[0]),
                Slidingpanel(plant:widget.plant_list[1]), 
                Slidingpanel(plant:widget.plant_list[2]),  
                ],
            )),
      ),
    );
  }
}
