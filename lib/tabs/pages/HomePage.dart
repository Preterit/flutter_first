import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirst/Route/RouteTest.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

/// 基本路由
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
          child: Text("点击跳转"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RouteTest(str: "HomePage");
            }));
          },
        ),
      ],
    );
  }
}
