import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class sleekslider extends StatelessWidget {
  String toplabel,bottomlabel;
  double min,max,value;
  sleekslider({@required this.bottomlabel,@required this.toplabel,@required this.max,@required this.min,@required this.value});
  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        infoProperties: InfoProperties(topLabelText:toplabel,bottomLabelText: bottomlabel,modifier:(_)=>percentageModifier(value) ),
          startAngle: 180,
          angleRange: 360,
          customWidths: CustomSliderWidths(progressBarWidth: 10)),
      min: min,
      max: max,
      initialValue: value,
      
    );
  }

  String percentageModifier(double value) {
    final roundedValue = value.ceil().toInt().toString();
    return '$roundedValue ';
  }

}
