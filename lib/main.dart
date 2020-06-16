import 'package:flutter/material.dart';
import 'package:flutterfirst/Image.dart';

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
      body: ImageState(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "我是一个文本我是一个文本我是一个文本我是一个文本",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
          textScaleFactor: 1.2,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 15.0,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
              letterSpacing: 9.0,
              decorationColor: Colors.green),
        ),
        height: 300.0,
        width: 300.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(width: 1.0, color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
    );
  }
}


