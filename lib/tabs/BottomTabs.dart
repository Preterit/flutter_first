import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirst/tabs/pages/Categorypage.dart';
import 'package:flutterfirst/tabs/pages/HomePage.dart';
import 'package:flutterfirst/tabs/pages/SettingPage.dart';
import 'package:flutterfirst/tabs/pages/drawer/DrawerWidget.dart';

class BottomTabs extends StatefulWidget {
  int index;

  BottomTabs({this.index = 0});

  @override
  _BottomNavigationBar createState() {
    return _BottomNavigationBar(this.index);
  }
}

class _BottomNavigationBar extends State<BottomTabs> {
  int _currentIndex;

  _BottomNavigationBar(index) {
    this._currentIndex = index;
  }

  List<Widget> _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      body: this._pageList[this._currentIndex],
      drawer: DrawerWidget(),
      endDrawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页"),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("分类"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("设置"),
              backgroundColor: Colors.amber),
        ],
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        fixedColor: Colors.green,
        onTap: _onTap,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
