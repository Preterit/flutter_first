import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
          child: Text("命名路由跳转 --- 携带参数"),
          onPressed: () {
            Navigator.pushNamed(context, '/categoryInfo',
                arguments: {"pid": 110});
          },
        ),
        RaisedButton(
          child: Text("命名路由跳转 --- 不携带参数"),
          onPressed: () {
            Navigator.pushNamed(context, "/noDataPage");
          },
        ),
        RaisedButton(
          child: Text("命名路由跳转 --- 路由替换"),
          onPressed: () {
            Navigator.pushNamed(context, "/secondPage");
          },
        ),
      ],
    );
  }
}
