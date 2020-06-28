import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldsState();
  }
}

class _TextFieldsState extends State<TextFieldDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
        centerTitle: true,
      ),
      body: new Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 50.0,
              width: double.infinity,
              child: RaisedButton(
                child: Text("登陆"),
                onPressed: () {
                  Navigator.pushNamed(context, "/loginPage");
                },
              ),
            ),
            _getTextFieldWidget(),

          ],
        ),
      ),
    );
  }
}

/// 表格基本使用
Widget _getTextFieldWidget() {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      TextField(
        decoration: InputDecoration(hintText: "正常输入框"),
      ),
      SizedBox(height: 10.0),
      TextField(
        decoration: InputDecoration(
          labelText: "label 输入框",
          labelStyle: TextStyle(fontSize: 14.0, color: Colors.orange),
          isDense: true,
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 10.0),
      TextField(
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(),
          hintText: "边框样式修改",
          alignLabelWithHint: true,
          hintStyle: TextStyle(fontSize: 10.0),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyanAccent)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        ),
      ),
      SizedBox(height: 10.0),
      TextField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            icon: Icon(Icons.group, color: Colors.orange),
            suffixIcon: Icon(Icons.remove_red_eye),
//                      suffixIconConstraints: BoxConstraints(
//                        minHeight: 32,
//                        minWidth: 32,
//                      ),
            isDense: true,
            border: OutlineInputBorder(),
            hintText: "带logo输入框",
            alignLabelWithHint: true,
            hintStyle: TextStyle(
              fontSize: 12.0,
              textBaseline: TextBaseline.alphabetic,
              fontStyle: FontStyle.normal,
            )),
      ),
      SizedBox(height: 10.0),
      TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.people, color: Colors.orange),
            isDense: true,
            border: OutlineInputBorder(),
            hintText: "带logo输入框",
            hintStyle: TextStyle(fontSize: 12.0)),
      ),
      SizedBox(height: 10.0),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: "密码",
            isDense: true,
            border: OutlineInputBorder(),
            hintText: "密码框",
            hintStyle: TextStyle(fontSize: 12.0)),
      ),
      SizedBox(height: 10.0),
      TextField(
        maxLines: 4,
        maxLength: 100,
        maxLengthEnforced: true,
        decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
            hintText: "多行文本",
            hintStyle: TextStyle(fontSize: 12.0)),
      ),
    ],
  );
}
