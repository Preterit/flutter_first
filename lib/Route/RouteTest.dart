import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 跳转的新的页面
class RouteTest extends StatefulWidget {
  final String str;
  RouteTest({Key key, this.str  = " ----- 默认值"}) : super(key: key);
  @override
  _RouteTestState createState() {
    return _RouteTestState(str:this.str);
  }
}

class _RouteTestState extends State<RouteTest> {
  final String str;
  _RouteTestState({this.str});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("跳转页面")),
      body: Text("我是跳转过来的页面${this.str}"),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backspace),
        onPressed: (){
          Navigator.of(context).pop();   /// 返回。
        },
      ),
    );
  }
}
