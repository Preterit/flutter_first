import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryInfoPage extends StatefulWidget{

  final Map arguments;
  CategoryInfoPage({this.arguments});

  @override
  State<StatefulWidget> createState() {
    return _CategoryInfoPageState(arguments:this.arguments);
  }

}

class _CategoryInfoPageState extends State<CategoryInfoPage>{

  final Map arguments;

  _CategoryInfoPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分类详情"),
      ),
      body: Text("这是分类详情页面  pid ---- ${arguments["pid"]?? "数据为空"}"),
    );
  }
}
