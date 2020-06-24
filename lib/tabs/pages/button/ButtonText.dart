import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;

  ButtonText(this.text, {this.textColor = Colors.black, this.textSize = 16.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: this.textSize,
          color: this.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
