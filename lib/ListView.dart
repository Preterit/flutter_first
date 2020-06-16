import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListBuilder();
  }

  /// 静态的ListView
  Widget _normalListView() {
    return ListView(
      children: <Widget>[
        Image.network(
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592303204407&di=96a9e85870ae1b0ee607e29414bb011f&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F86%2F16%2F01300000045385120158160911546.jpg",
          height: 180.0,
        ),
        Container(
          alignment: Alignment.center,
          child: Text("Container -- 文本居中显示"),
          height: 180.0,
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent,
          ),
        ),
        Text("这是文本"),
      ],
    );
  }

  /// 获取Widget 集合
  List<Widget> _data() {
    List<ListTile> result = new List();
    for (int i = 0; i < 20; i++) {
      result.add(new ListTile(
        title: Text("这是主标题"),
        subtitle: Text("这是副标题，副标题是小的。"),
        leading: Icon(Icons.account_box),
      ));
    }
    return result;
  }

  Widget _listViewWidget() {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      children: this._data(),
    );
  }

  /// 普通的Widget组件
  Widget _container() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      alignment: Alignment.center,
      child: Text("Container -- 文本居中显示"),
      height: 180.0,
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent,
      ),
    );
  }
}

// ignore: must_be_immutable
class ListBuilder extends StatelessWidget {

  List<Widget> _result = new List();

  ListBuilder() {
    for (int i = 0; i < 20; i++) {
      _result.add(new ListTile(
        title: Text("主标题"),
        subtitle: Text("副标题"),
      ));
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return _result[index];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _result.length,
      itemBuilder: this._itemBuilder,
    );
  }
}
