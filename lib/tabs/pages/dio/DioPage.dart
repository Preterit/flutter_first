import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DioPage extends StatefulWidget {
  @override
  _DioPage createState() {
    return _DioPage();
  }
}

class _DioPage extends State<DioPage> {
  String _result = "";
  String apiUrl =
      "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";

  List _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio 网络请求"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            RaisedButton(
              child: Text("get请求"),
              onPressed: _getData,
            ),
            RaisedButton(
              child: Text("Dio 请求数据， 渲染数据演示"),
              onPressed: _decodeData,
            ),
            new Container(
              width: double.infinity,
              height: 100.0,
              child: Text(this._result),
            ),
            this._list.length > 0
                ? Container(
                    height: 300.0,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(this._list[index]["username"]),
                          subtitle: Text(this._list[index]["title"]),
                        );
                      },
                    ),
                  )
                : Text("加载中。。。。。")
          ],
        ),
      ),
    );
  }

  /// 通过get请求获取服务器中的数据
  void _getData() async {
    Response result = await Dio().get(apiUrl);
    setState(() {
      this._result = result.data;
    });
  }

  /// 获取数据并渲染数据
  void _decodeData() async {
    Response result = await new Dio().get(apiUrl);
    setState(() {
      _result = "";
      this._list = json.decode(result.data)["result"];
    });
  }
}
