import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RadioPageState();
  }
}

class _RadioPageState extends State<RadioPage> {
  int sex = 1;

  void _onChange(value) {
    setState(() {
      this.sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio"),
        centerTitle: true,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("男"),
              Radio(value: 1, onChanged: _onChange, groupValue: this.sex),
              Text("女"),
              Radio(value: 2, onChanged: _onChange, groupValue: this.sex),
            ],
          ),
          SizedBox(height: 30.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Radio 选中了 ${this.sex == 1 ? '男' : '女'} ")],
          ),
          RadioListTile(
            value: 1,
            groupValue: this.sex,
            onChanged: _onChange,
            title: Text("RadioListTile"),
            subtitle: Text("二级标题"),
            selected: this.sex == 1,
            secondary: Icon(Icons.access_alarms),
          ),
          Divider(),
          RadioListTile(
            value: 2,
            groupValue: this.sex,
            onChanged: _onChange,
            title: Text("RadioListTile"),
            subtitle: Text("二级标题"),
            selected: this.sex == 2,
            secondary: Icon(Icons.access_alarms),
          ),
          Divider(),
          SizedBox(height: 30.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("RadioListTile 选中了 ${this.sex == 1 ? '第一条' : '第二条'} ")],
          ),
        ],
      ),
    );
  }
}
