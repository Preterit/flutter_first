import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CusAppBarWithDefaultTabController.dart';
import 'CusAppBarWithTabController.dart';

/// 自定义导航栏
class CustomAppbar extends StatelessWidget {
  List<Widget> tabsList = [
    Tab(text: '精选', icon: Icon(Icons.cast_connected)),
    Tab(text: '猜你喜欢', icon: Icon(Icons.cast_connected)),
    Tab(text: '母婴', icon: Icon(Icons.cast_connected)),
    Tab(text: '儿童', icon: Icon(Icons.cast_connected)),
    Tab(text: '女装', icon: Icon(Icons.cast_connected)),
    Tab(text: '百货', icon: Icon(Icons.cast_connected)),
    Tab(text: '美食', icon: Icon(Icons.cast_connected)),
    Tab(text: '美妆', icon: Icon(Icons.cast_connected)),
    Tab(text: '母婴', icon: Icon(Icons.cast_connected)),
    Tab(text: '儿童', icon: Icon(Icons.cast_connected)),
    Tab(text: '女装', icon: Icon(Icons.cast_connected)),
    Tab(text: '百货', icon: Icon(Icons.cast_connected)),
    Tab(text: '美食', icon: Icon(Icons.cast_connected)),
    Tab(text: '美妆', icon: Icon(Icons.cast_connected))
  ];
  List<Widget> tabViewList = [
    Container(alignment: Alignment.center, child: Text('精选')),
    Container(alignment: Alignment.center, child: Text('猜你喜欢')),
    Container(alignment: Alignment.center, child: Text('母婴')),
    Container(alignment: Alignment.center, child: Text('儿童')),
    Container(alignment: Alignment.center, child: Text('女装')),
    Container(alignment: Alignment.center, child: Text('百货')),
    Container(alignment: Alignment.center, child: Text('美食')),
    Container(alignment: Alignment.center, child: Text('美妆')),
    Container(alignment: Alignment.center, child: Text('母婴')),
    Container(alignment: Alignment.center, child: Text('儿童')),
    Container(alignment: Alignment.center, child: Text('女装')),
    Container(alignment: Alignment.center, child: Text('百货')),
    Container(alignment: Alignment.center, child: Text('美食')),
    Container(alignment: Alignment.center, child: Text('美妆')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义AppBar"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(height: 300.0, child: FirstAppBar(), color: Colors.green),
          Container(height: 400.0, child: SecondAppBar()),
        ],
      ),
    );
  }
}
