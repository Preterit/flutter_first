import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormPagesState();
  }
}

class _FormPagesState extends State<FormPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单演示"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
              child: Text("TextField演示"),
              onPressed: () {
                Navigator.pushNamed(context, "/textFields");
              }),
          RaisedButton(
              child: Text("CheckBox演示"),
              onPressed: () {
                Navigator.pushNamed(context, "/checkBoxPage");
              }),
          RaisedButton(
              child: Text("Radio演示"),
              onPressed: () {
                Navigator.pushNamed(context, "/radioPage");
              }),
          RaisedButton(
              child: Text("Switch演示"),
              onPressed: () {
                Navigator.pushNamed(context, "/switchPage");
              }),
        ],
      ),
    );
  }
}
