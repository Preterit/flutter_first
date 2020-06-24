import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BottomNavigationWidget.dart';
import 'CommonButtons.dart';

class ButtonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtonWidgets();
  }
}

class _ButtonWidgets extends State<ButtonWidget> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPressed() {
    setState(() {
      _currentIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.accessible, color: Colors.white),
          )
        ],
      ),
      body: CommonButtons(),
      bottomNavigationBar: getBottomNavBar(_currentIndex, _onTap),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: getFloatButtonWidget(_currentIndex, _onPressed),
    );
  }
}
