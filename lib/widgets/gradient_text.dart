import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  GradientText(
    this.text, {
    @required this.gradient,
    @required this.fontsize,
    @required this.fontweight,
  });

  final String text;
  final Gradient gradient;
  final double fontsize;
  final bool fontweight;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          // The color must be set to white for this to work
          color: Colors.white,
          fontSize: fontsize,
          fontWeight: (fontweight)?FontWeight.bold:FontWeight.normal,


        ),
      ),
    );
  }
}
