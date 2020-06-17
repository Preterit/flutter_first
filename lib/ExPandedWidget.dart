import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      child: Column(
        children: <Widget>[
          Container(height: 180.0, color: Colors.black),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 150.0,
                  child: Image.network(
                    "https://www.itying.com/images/flutter/3.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 1,
                child: Container(
                  height: 150.0,
                  child: ListView(
                    children: <Widget>[
                      Image.network(
                        "https://www.itying.com/images/flutter/1.png",
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10.0),
                      Image.network(
                        "https://www.itying.com/images/flutter/2.png",
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
