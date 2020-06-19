import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataPageInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NoDataPageInfoState();
  }
}

class _NoDataPageInfoState extends State<NoDataPageInfo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("跳转不传数据"),),
      body: Text("这个是跳转没传数据的页面"),
    );
  }
}