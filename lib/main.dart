import 'package:flutter/material.dart';
import 'package:flutterfirst/GridViewWidget.dart';
import 'package:flutterfirst/Image.dart';
import 'package:flutterfirst/PaddingWidget.dart';

import 'ExPandedWidget.dart';
import 'ListView.dart';
import 'RowColumnWiget.dart';
import 'TextContainer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
//      body: TextWidget(),
//      body: ImageWidget(),
//      body: MyGridViewWidget(),
//      body: PaddingWidgetTest(),
//      body: ColumnWiget(),
      body: ExpandedWidget(),
    );
  }
}
