import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Stack 结合 Align 使用
class StackAndAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 300.0,
      color: Colors.lightGreenAccent,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Icon(Icons.home, size: 32.0, color: Colors.red),
          ),
          Align(
            alignment: Alignment(1, 1),
            child: Icon(Icons.search, size: 32.0, color: Colors.blue),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.send, size: 32.0, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

/// Stack 结合 Positioned 使用
class StackAndPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 300.0,
      color: Colors.lightGreenAccent,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 50.0,
            child: Icon(Icons.send, size: 32.0, color: Colors.grey),
          ),
          Positioned(
            right: 0,
            bottom: 50.0,
            child: Icon(Icons.home, size: 32.0, color: Colors.red),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Icon(Icons.send, size: 32.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
