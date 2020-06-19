import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("item1"),
        ),
        ListTile(
          title: Text("item2"),
        ),
        ListTile(
          title: Text("item3"),
        ),
        ListTile(
          title: Text("item4"),
        ),
      ],
    );
  }
}
