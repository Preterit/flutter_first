import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CusAppBarPage.dart';

class FirstAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 14,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.settings),

          ///设置导航栏图标颜色
          iconTheme: IconThemeData(color: Colors.black, opacity: 0.6),

          ///设置导航右边图标的主题色，此时iconTheme对于右边图标颜色会失效
          actionsIconTheme: IconThemeData(color: Colors.blue, opacity: 0.6),

          ///设置导航条上面的状态栏显示字体颜色
          brightness: Brightness.light,

          ///设置AppBar上面各种字体主题色
          textTheme: TextTheme(
            title: TextStyle(
                color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),

          /// 导航栏背景颜色
          backgroundColor: Colors.orange,

          /// 标题居中显示
          centerTitle: true,
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
              itemBuilder: _itemBuilder,
              onSelected: _onSelected,
            ),
          ],
          bottom: _bottomTabs(),
        ),
        body: Container(
          height: 100.0,
          color: Colors.amberAccent,
          child: TabBarView(children: CustomAppbar().tabViewList),
        ),
      ),
    );
  }

  Widget _bottomTabs() {
    return TabBar(
      tabs: CustomAppbar().tabsList,
      unselectedLabelColor: Colors.grey,

      ///置未选中时的字体颜色，tabs里面的字体样式优先级最高
      unselectedLabelStyle: TextStyle(fontSize: 13.0),

      ///设置未选中时的字体样式，tabs里面的字体样式优先级最高
      labelColor: Colors.black,

      ///设置选中时的字体颜色，tabs里面的字体样式优先级最高
      labelStyle: TextStyle(fontSize: 13.0),

      ///设置选中时的字体样式，tabs里面的字体样式优先级最高
      isScrollable: true,

      ///允许左右滚动
      indicatorColor: Colors.red,

      ///选中下划线的颜色
      indicatorSize: TabBarIndicatorSize.label,

      ///选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
      indicatorWeight: 3.0,

      ///选中下划线的高度，值越大高度越高，默认为2。0
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
