import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirst/tabs/BottomTabs.dart';

class FourPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FourPageState();
  }
}

class _FourPageState extends State<FourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第四个页面"),
        ),
        body: ListView(
          children: <Widget>[
            Text(
              " 这个页面  根据不同罗进行 返回处理  ",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              "pushReplacementNamed 这种方式开启新的路由默认会把上级路由从堆栈中移除。所以通过  Navigator.of(context).pop() 返回 上级没有从堆栈中移除的路由。",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "如果跟路由 通过这种方式开启新路由，则 是退出程序。",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              child: Text("pushReplacementNamed 进来的返回"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 50.0),
            Text(
              "通过 Navigator.push 或者 pushNamed 会在堆栈中新增 一个路由，并不会把上个路由移除，所以 这种方式 返回跟路由的方式。 把堆栈清空，重新开启跟路由。",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              child: Text("pushNamedAndRemoveUntil 的返回"),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => BottomTabs(index: 1)),
                    (route) => route == null);
              },
            ),
          ],
        ));
  }
}
