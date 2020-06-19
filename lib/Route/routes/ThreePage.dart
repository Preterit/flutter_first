import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThreePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThreePageState();
  }
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三个页面"),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            "这个页面单纯是又来凑数的",
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50.0,),
          RaisedButton(
            child: Text("下一个页面  ---   pushReplacementNamed "),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/fourPage");
            },
          ),
          SizedBox(height: 50.0,),
          RaisedButton(
            child: Text("下一个页面  ---   pushNamedAndRemoveUntil "),
            onPressed: () {
              Navigator.pushNamed(context, "/fourPage");
            },
          ),
        ],
      ),
    );
  }
}
