import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'CategoryInfo.dart';
import 'NoDataPageInfo.dart';

/// 配置路由
final routes = {
  "/": (context) => main(),
  '/categoryInfo': (context,{arguments}) => CategoryInfoPage(arguments:arguments),
  "/noDataPage": (context) => NoDataPageInfo(),
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
