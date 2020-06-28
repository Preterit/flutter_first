import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckBoxState();
  }
}

class _CheckBoxState extends State<CheckBoxPage> {
  var flag = false;

  void _onChange(value) {
    setState(() {
      this.flag = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
        centerTitle: true,
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(value: this.flag, onChanged: _onChange),
          SizedBox(height: 10.0),
          Divider(),
          CheckboxListTile(
            value: this.flag,
            onChanged: _onChange,
            activeColor: Colors.orange,
            checkColor: Colors.greenAccent,
            title: Text("CheckboxListTile"),
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: Text(
              "带标题的CheckBox",
              style: TextStyle(fontSize: 12.0),
            ),
            secondary: Icon(
              Icons.access_alarm,
              size: 20.0,
              textDirection: TextDirection.rtl,
            ),
          ),
          Divider(),
          CheckboxListTile(
            value: this.flag,
            onChanged: _onChange,
            activeColor: Colors.orange,
            checkColor: Colors.greenAccent,
            title: Text(
              "CheckboxListTile",
              style: TextStyle(color: this.flag ? Colors.orange : Colors.black),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            subtitle: Text(
              "带标题的CheckBox",
              style: TextStyle(
                  fontSize: 12.0,
                  color: this.flag ? Colors.orange : Colors.grey),
            ),
            secondary: Icon(
              Icons.access_alarm,
              color: this.flag ? Colors.orange : Colors.grey,
              size: 20.0,
              textDirection: TextDirection.rtl,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
