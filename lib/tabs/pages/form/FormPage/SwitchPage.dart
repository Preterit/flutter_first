import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchPageState();
  }
}

class _SwitchPageState extends State<SwitchPage> {
  bool _flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
        centerTitle: true,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Switch(
                value: _flag,
                onChanged: (v) {
                  setState(() {
                    this._flag = v;
                  });
                },
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Switch(
                value: _flag,
                inactiveThumbColor: Colors.red,
                activeColor: Colors.green,
                activeTrackColor: Colors.cyanAccent,
                inactiveTrackColor: Colors.amber,
                onChanged: (v) {
                  setState(() {
                    this._flag = v;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20.0),
          CupertinoSwitch(
            value: _flag,
            onChanged: (v) {
              setState(() {
                this._flag = v;
              });
            },
          ),
          SizedBox(height: 30.0),
          Text("${this._flag ? '开' : '关'}"),
        ],
      ),
    );
  }
}
