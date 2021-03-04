import 'package:flutter/material.dart';

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 14.0,
      width: 14.0,
      decoration: new BoxDecoration(
        color: Colors.deepOrange,
        shape: BoxShape.circle,
      ),
    );
  }
}
