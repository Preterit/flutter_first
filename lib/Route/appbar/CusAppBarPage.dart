import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 自定义导航栏
class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("自定义导航"),
        leading: Icon(Icons.menu),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: () {
              print("Search pressed");
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: "Setting",
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text(
          "这是自定义appbar",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
