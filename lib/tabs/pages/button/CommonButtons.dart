import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ButtonText.dart';

class CommonButtons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommonButtonsState();
  }
}

class _CommonButtonsState extends State<CommonButtons> {

  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          ButtonText("  ---RaisedButton---  ", textColor: Colors.orange),
          SizedBox(height: 10.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("普通按钮"),
                onPressed: _onPressed,
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                child: Text(
                  "带颜色按钮",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: _onPressed,
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                child: Text(
                  "阴影按钮",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                elevation: 10.0,
                onPressed: _onPressed,
              ),
            ],
          ),
          SizedBox(width: 10.0),
          RaisedButton.icon(
            icon: Icon(Icons.people, color: Colors.white),
            label: Text("图标按钮"),
            textColor: Colors.white,
            color: Colors.blue,
            elevation: 10.0,
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: RaisedButton(
                  child: Text("固定宽高 50*300"),
                  onPressed: _onPressed,
                ),
                height: 50.0,
                width: 300.0,
              ),
            ],
          ),
          SizedBox(height: 10.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 60.0,
                  margin: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text("自适应按钮"),
                    onPressed: _onPressed,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("圆角按钮"),
                onPressed: _onPressed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                height: 80.0,
                child: RaisedButton(
                    child: Text("圆形按钮"),
                    onPressed: _onPressed,
                    shape: CircleBorder(side: BorderSide(color: Colors.white))),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                child: Text("半圆按钮"),
                onPressed: _onPressed,
                shape: StadiumBorder(),
              )
            ],
          ),
          SizedBox(height: 10.0),
          ButtonText("   ---FlatButton---   ", textColor: Colors.orange),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("平铺按钮"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: _onPressed,
              ),
              SizedBox(width: 10.0),
              FlatButton(
                child: Text("半圆按钮"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: _onPressed,
                shape: StadiumBorder(),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          ButtonText("   ---OutlineButton---   ", textColor: Colors.orange),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                child: Text("带边框的按钮"),
                textColor: Colors.grey,
                onPressed: _onPressed,
                color: Colors.black,
                highlightedBorderColor: Colors.lightGreen,
                borderSide: BorderSide(
                  color: Colors.amber,
                  width: 2.0,
                ),
              ),
              SizedBox(width: 10.0),
              OutlineButton(
                child: Text("带边框的按钮"),
                textColor: Colors.grey,
                onPressed: _onPressed,
                highlightedBorderColor: Colors.lightGreen,
                shape: StadiumBorder(),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ButtonText("   ---FloatingActionButton---   ", textColor: Colors.orange),
        ],
      ),
    );
  }
}
