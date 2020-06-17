import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'res/listData.dart';

class MyGridViewWidget extends StatelessWidget {
  /// 获取 GirdView 的item数据
  List<Widget> _getWidgetList() {
    var resultList = listData.map((value) {
      return Container(
          child: Column(
            children: <Widget>[
              Image.network(value["imageUrl"]),
              SizedBox(height: 10.0),
              Text(
                value["title"],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                  color: Color.fromRGBO(233, 233, 233, 0.9), width: 1.0)));
    });

    /// ("xxxx","xxxxxx")  这里需要转下list
    return resultList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: listData.length,
      itemBuilder: this._getWidgetBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.8,
      ),
    );
  }

  Widget _getWidgetBuilder(context, index) {
    return new Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: <Widget>[
          Image.network(listData[index]["imageUrl"], fit: BoxFit.cover),
          SizedBox(height: 10.0),
          Text(
            listData[index]["title"],
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 13.0),
          )
        ],
      ),
    );
  }
}
