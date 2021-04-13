import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant/widgets/bullets.dart';
import 'package:plant/widgets/gradient_text.dart';

import 'package:plant/widgets/sleek_slider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Slidingpanel extends StatefulWidget {
  Map plant;
  Slidingpanel({@required this.plant});
  @override
  _SlidingpanelState createState() => _SlidingpanelState();
}

class _SlidingpanelState extends State<Slidingpanel> {
  double _panelHeightOpen;
  double _panelHeightClosed;
  final double _initFabHeight = 120.0;
  double _fabHeight;
  double height, width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .60;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SlidingUpPanel(
      maxHeight: _panelHeightOpen,
      minHeight: height * 0.3,
      parallaxEnabled: true,
      parallaxOffset: .5,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 14,
        )
      ],
      body: _body(),
      panelBuilder: (sc) => _panel(sc),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.0), topRight: Radius.circular(22.0)),
      onPanelSlide: (double pos) => setState(() {
        _fabHeight =
            pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
      }),
    );
  }

  Widget _panel(ScrollController sc) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.10,
                    child: Divider(
                      thickness: 3,
                      height: 2,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // Text('General Instructions',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Color(0xff00600f),
                  //         decoration: TextDecoration.underline,
                  //         fontSize: 18)),
                  _gradientText(
                      text: 'General Instructions',
                      fontsize: 20,
                      fontweight: true),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.18,
                  width: width * 0.40,
                  child: sleekslider(
                    min: 0,
                    max: 10,
                    value: double.parse(widget.plant['depth']),
                    bottomlabel: 'inch',
                    toplabel: 'Depth of Plant',
                  ),
                ),
                Container(
                  height: height * 0.18,
                  width: width * 0.40,
                  child: sleekslider(
                    min: 0,
                    max: 5,
                    value: double.parse(widget.plant['water_level']),
                    bottomlabel: 'inch per week',
                    toplabel: 'Water level',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            instruction_row(
                titlelabel: 'Soil Quality:',
                valuelabel: widget.plant['soil_quality'],
                titlebool: true,
                valuebool: false),
            SizedBox(
              height: 10,
            ),
            instruction_row(
                titlelabel: 'Fertilizer:',
                valuelabel: widget.plant['fertilizer'],
                titlebool: true,
                valuebool: false),
            SizedBox(
              height: 10,
            ),
            instruction_row(
                titlelabel: 'Harvesting Time:',
                valuelabel: widget.plant['harvesting_time'],
                titlebool: true,
                valuebool: false),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                instruction_row(
                    titlelabel: 'Sunlight:',
                    valuelabel: widget.plant['sunlight'],
                    titlebool: true,
                    valuebool: false),
                SizedBox(width: 5),
                (widget.plant['sunlight']=='Partial Sun')?Icon(
                  FontAwesomeIcons.cloudSun,
                  color: Colors.deepOrange,
                ):
                Icon(
                  FontAwesomeIcons.solidSun,
                  color: Colors.deepOrange,
                ),
              ],
            )
          ],
        ));
  }

  GradientText _gradientText({String text, double fontsize, bool fontweight}) {
    return GradientText(
      text,
      fontsize: fontsize,
      fontweight: fontweight,
      gradient: LinearGradient(stops: [
        0.1,
        0.2,
        1
      ], colors: [
        Color(0xff00600f),
        Color(0xff097913),
        Color(0xff664fb3),
      ]),
    );
  }

  Padding instruction_row(
      {String titlelabel, String valuelabel, bool titlebool, bool valuebool}) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyBullet(),
          SizedBox(width: 5),
          _gradientText(text: titlelabel, fontsize: 18, fontweight: titlebool),
          SizedBox(width: 8),
          instruction_text(label: valuelabel, fontweight: valuebool),
        ],
      ),
    );
  }

  Widget instruction_text({String label, bool fontweight}) {
    return Column(
      children: [
        Container(
          child: Text(
            label,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 18,
                fontWeight: (fontweight) ? FontWeight.bold : FontWeight.normal,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Material(
        child: Stack(
      children: [
        Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/${widget.plant['plant_name']}.png',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   width: width,
                  //   child: Text('Tomato',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: Color(0xff00600f),
                  //           fontSize: 24)),
                  // )
                ],
              ),
            )),
      ],
    ));
  }
}
