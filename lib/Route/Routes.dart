import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirst/Route/routes/FourPage.dart';
import 'package:flutterfirst/Route/routes/SecondPage.dart';
import 'package:flutterfirst/Route/routes/ThreePage.dart';
import 'package:flutterfirst/tabs/pages/TextField/LoginPage.dart';
import 'package:flutterfirst/tabs/pages/TextField/TextFieldDemoPage.dart';
import 'package:flutterfirst/tabs/pages/button/Buttons.dart';
import 'package:flutterfirst/tabs/pages/drawer/UserCenterPage/UserCenterPage.dart';

import '../main.dart';
import 'CategoryInfo.dart';
import 'NoDataPageInfo.dart';
import 'appbar/CusAppBarPage.dart';

/// 配置路由
final routes = {
  "/": (context) => main(),
  '/categoryInfo': (context,{arguments}) => CategoryInfoPage(arguments:arguments),
  "/noDataPage": (context) => NoDataPageInfo(),
  "/secondPage": (context) => SecondPage(),
  "/threePage": (context) => ThreePage(),
  "/fourPage": (context) => FourPage(),

  "/customAppbar": (context) => CustomAppbar(),
  "/userCenterPage": (context) => UserCenterPage(),  /// 用户中心
  "/buttonWidget": (context) => ButtonWidget(),  /// 按钮
  "/textFields": (context) => TextFieldDemoPage(),  /// 表单
  "/loginPage": (context) => LoginPage(),  /// 登陆
};

/// 固定写法
// ignore: strong_mode_top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
