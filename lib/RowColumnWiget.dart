import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 水平布局组件
class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800.0,
      width: 300.0,
      color: Colors.yellow,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,  /// 这里使用 父布局高度的一半位置.
        mainAxisAlignment: MainAxisAlignment.start,     /// 位置是 屏幕的最左边
        children: <Widget>[
          _GetCusWidget(Icons.home, color: Colors.blue),
          _GetCusWidget(Icons.search, color: Colors.orange),
          _GetCusWidget(Icons.map, color: Colors.red)
        ],
      ),
    );
  }
}

class _GetCusWidget extends StatelessWidget {
  IconData icon;
  Color color;
  double size;

  _GetCusWidget(this.icon, {this.color = Colors.blue, this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        width: 50.0,
        color: color,
        child: Center(
          child: Icon(icon, color: Colors.white, size: this.size),
        ));
  }
}

/// 垂直布局组件
class ColumnWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800.0,
      width: 300.0,
      color: Colors.yellow,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _GetCusWidget(Icons.home, color: Colors.blue),
          _GetCusWidget(Icons.search, color: Colors.orange),
          _GetCusWidget(Icons.map, color: Colors.red)
        ],
      ),
    );
  }
}
