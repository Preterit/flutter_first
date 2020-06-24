import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 底部导航 item
Widget getBottomNavBar(_currentIndex,_onTap){
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("咸鱼"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.autorenew),
        title: Text("鱼塘"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        title: Text("发布"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.mode_comment),
        title: Text("消息"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        title: Text("我的"),
      ),
    ],
    currentIndex: _currentIndex,
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    selectedFontSize: 12.0,
    onTap: _onTap,
  );
}

Widget getFloatButtonWidget(_currentIndex,_onPressed){
 return Container(
    height: 60.0,
    width: 60.0,
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white),
    margin: EdgeInsets.only(top: 8.0),
    child: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _onPressed,
      backgroundColor: _currentIndex == 2 ? Colors.yellow : Colors.yellow,
    ),
  );
}