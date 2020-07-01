import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwiperPage extends StatefulWidget {
  @override
  _SwiperPage createState() {
    return _SwiperPage();
  }
}

class _SwiperPage extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("轮播图演示"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("轮播图"),
        ),
      ),
    );
  }
}
