import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        RaisedButton(
          child: Text("自定义顶部导航"),
          onPressed: () {
            Navigator.pushNamed(context, "/customAppbar");
          },
        ),
        RaisedButton(
          child: Text("侧边栏"),
          onPressed: () {
            Navigator.pushNamed(context, "/customAppbar");
          },
        ),
      ],
    );
  }
}
