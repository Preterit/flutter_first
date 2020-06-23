import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CusAppBarPage.dart';

/// 使用 TabController 方法 必须继承有状态的 StatefulWidget
class SecondAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondAppBar();
  }
}

class _SecondAppBar extends State<SecondAppBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 14, vsync: this);
    _tabController.addListener(() {
        print("----${_tabController.index}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_tabController != null) {
      _tabController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabController 实现"),
        centerTitle: true,
        leading: Icon(Icons.settings),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: CustomAppbar().tabsList,
        ),
      ),
      body: Container(
        height: 100.0,
        color: Colors.lightGreen,
        child: TabBarView(
            controller: _tabController, children: CustomAppbar().tabViewList),
      ),
    );
  }
}
