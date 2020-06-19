import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondPage();
  }
}

class _SecondPage extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第二个页面"),
        ),
        body: ListView(
          children: <Widget>[
            Text(
              " 路由替换  ",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              "正常我们跳转页面，是通过 Navigator.push 或者 pushNamed 实现的，每次都是把页面压入堆栈，在回退 的时候会回退到上一跳页面",
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.green,
              ),
            ),
            Text(
              "某些场景下我们期望不返回上一条，在跳转吓一条的时候替换本页面，将上一个页面从堆栈中移除， Navigator.of(context).pushReplacementNamed 这个方法",
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 50.0),
            RaisedButton(
              child: Text("下一个页面 ----- pushReplacementNamed"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/threePage");
              },
            ),
            SizedBox(height: 50.0),
            Text(
              " 如果需求是打开下一个页面 还能返回上一个页面，这时候，pushReplacementNamed 就不好用，但又需要返回跟路由 ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.amber),
            ),
            SizedBox(height: 10.0),
            Text(
              " 这时候就需要使用  pushNamedAndRemoveUntil  之前的所有路由全部干掉，堆栈清空",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.amber),
            ),
            SizedBox(height: 50.0),
            RaisedButton(
              child: Text("下一个页面 ----- pushNamedAndRemoveUntil"),
              onPressed: () {
                Navigator.pushNamed(context, "/threePage");
              },
            ),
          ],
        ));
  }
}
