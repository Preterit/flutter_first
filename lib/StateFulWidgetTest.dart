import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 有状态的组件
class StateFulWidgetTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateFul();
  }
}

class _StateFul extends State<StateFulWidgetTest> {
  List<String> _list = new List();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.lightGreenAccent,
          height: 600.0,
          child: ListView(
            children: _list.map((value) {
              return ListTile(
                title: Text(value),
              );
            }).toList(),
          ),
        ),
        RaisedButton(
          child: Text("按钮"),
          textColor: Colors.orange,
          onPressed: () {
            setState(() {
              _list.add("添加的数据${_list.length + 1}");
            });
          },
        )
      ],
    );
  }
}
