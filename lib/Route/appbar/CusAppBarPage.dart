import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 自定义导航栏
class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black,opacity: 0.6),     ///设置导航栏图标颜色
        actionsIconTheme: IconThemeData(color: Colors.blue,opacity: 0.6),   ///设置导航右边图标的主题色，此时iconTheme对于右边图标颜色会失效
        brightness: Brightness.light,  ///设置导航条上面的状态栏显示字体颜色
        textTheme: TextTheme( ///设置AppBar上面各种字体主题色
            title: TextStyle(color: Colors.red,fontSize: 20.0,fontWeight:FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen, /// 导航栏背景颜色
        centerTitle: true,  /// 标题居中显示
        title: Text("自定义导航"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: () {
              print("Search pressed");
            },
          ),
          PopupMenuButton(
            tooltip: "长按提示",
            initialValue: "hot",
            padding: EdgeInsets.all(10.0),
            itemBuilder: _itemBuilder,
            onSelected: _onSelected,
          ),
        ],
      ),
      body: Center(
        child: Text("自定义导航"),
      ),
    );
  }

  /// 选中 popMenu 回掉
  void _onSelected(String action) {
    switch (action) {
      case "hot":
        print("热度");
        break;
      case "new":
        print("最新");
        break;
      case "sao":
        print("扫一扫");
        break;
    }
  }

  /// popMenu item 构建器
  List<PopupMenuEntry<String>> _itemBuilder(BuildContext context) {
    return <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.message,
              color: Colors.blue,
            ),
            Text("发起群聊", style: TextStyle(color: Colors.blue)),
          ],
        ),
        value: "hot",
      ),
      PopupMenuItem<String>(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.group_add,
                color: Colors.blue,
              ),
              Text("添加服务", style: TextStyle(color: Colors.blue)),
            ]),
        value: "new",
      ),
      PopupMenuItem<String>(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.cast_connected,
                color: Colors.blue,
              ),
              Text("扫一扫", style: TextStyle(color: Colors.blue)),
            ]),
        value: "sao",
      ),
    ];
  }
}
