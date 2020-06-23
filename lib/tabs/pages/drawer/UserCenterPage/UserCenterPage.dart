import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCenterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户中心"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "用户中心",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}
