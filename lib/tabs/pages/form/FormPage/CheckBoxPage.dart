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
  var flag2 = false;

  void _onChange(value, int type) {
    setState(() {
      if (type == 1) {
        this.flag = value;
      } else {
        this.flag2 = value;
      }
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
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("男"),
              Checkbox(
                  value: this.flag,
                  onChanged: (value) {
                    _onChange(value, 1);
                  }),
              Text("女"),
              Checkbox(
                  value: this.flag2,
                  onChanged: (value) {
                    _onChange(value, 2);
                  }),
            ],
          ),
          SizedBox(height: 10.0),
          Divider(),
          CheckboxListTile(
            value: this.flag,
            onChanged: (value) {
              _onChange(value, 1);
            },
            activeColor: Colors.orange,
            title: Text("CheckboxListTile"),
            selected: this.flag,
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
            value: this.flag2,
            onChanged: (value) {
              _onChange(value, 2);
            },
            selected: this.flag2,
            title: Text(
              "CheckboxListTile",
              style: TextStyle(),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            subtitle: Text(
              "带标题的CheckBox",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            secondary: Icon(
              Icons.access_alarm,
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
