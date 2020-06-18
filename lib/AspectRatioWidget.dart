import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// aspectRatio:1/2  width:height
class AspectratioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      width: 100.0,
    height: 100.0,
      color: Colors.lightGreenAccent,
      child: AspectRatio(
        aspectRatio: 2.0 / 4.0,
        child:Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
