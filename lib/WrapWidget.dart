import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Wrap 组件 使用
class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      verticalDirection: VerticalDirection.down,
      direction: Axis.horizontal,
      textDirection: TextDirection.rtl,
      spacing: 10.0,
      runSpacing: 10.0,
      children: <Widget>[
        RaisedButtonWidget("java"),
        RaisedButtonWidget("python"),
        RaisedButtonWidget("全部技术总监"),
        RaisedButtonWidget("ios"),
        RaisedButtonWidget("go"),
        RaisedButtonWidget("go"),
        RaisedButtonWidget("维护技术专员"),
        RaisedButtonWidget("全部技术总监"),
        RaisedButtonWidget("php"),
        RaisedButtonWidget("图形项目经理"),
        RaisedButtonWidget("产品经理"),
        RaisedButtonWidget("算法工程师"),
        RaisedButtonWidget("UI设计"),
      ],
    );
  }
}

class RaisedButtonWidget extends StatelessWidget {

  final String text;

  const RaisedButtonWidget(this.text,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text),
      textColor: Colors.orange,
      onPressed: () {},
    );
  }
}
