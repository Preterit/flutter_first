import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DrawerHeader.dart';
import 'UserAccountsDrawerHeader.dart';

/// 侧边栏
class DrawerWidget extends StatelessWidget {
  BuildContext _context;

  void _onTap() {
    Navigator.of(_context).pop();
    Navigator.pushNamed(_context, "/userCenterPage");
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Drawer(
      child: ListView(
        children: <Widget>[
          CusDrawHader(),
          UserAccountsDrawerHeaderWidget(),
          ListTile(
            title: Text("用户空间"),
            leading: CircleAvatar(child: Icon(Icons.people)),
            onTap: _onTap,
          ),
          Divider(),
          ListTile(
            title: Text("用户中心"),
            leading: CircleAvatar(child: Icon(Icons.home)),
            onTap: _onTap,
          ),
          Divider(),
          ListTile(
            title: Text("设置"),
            leading: CircleAvatar(child: Icon(Icons.settings)),
            onTap: _onTap,
          ),
          Divider(),
        ],
      ),
    );
  }
}
