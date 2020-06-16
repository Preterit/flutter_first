import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 图片Widget
class ImageWidget extends StatelessWidget {
  String _imgUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592301833445&di=f54546daefb11e594d561f9913c25d0f&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg";

  @override
  Widget build(BuildContext context) {
    return Center(
//      child: _decorationImage(),
//      child: _clipOvalGetImg(),
      child: _getLocalImgCircle(),
    );
  }

  /// 设置本地图片
  Widget _getLocalImg() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset(
        "images/cat.jpeg",
      ),
    );
  }

  /// 设置本地图片
  Widget _getLocalImgCircle() {
    return Container(
        width: 150.0,
        height: 150.0,
        child: ClipOval(
          child: Image.asset(
            "images/cat.jpeg",
            fit: BoxFit.cover,
          ),
        ));
  }

  /// 使用ClipOval方式 创建一个圆形图片
  Widget _clipOvalGetImg() {
    return Container(
      child: ClipOval(
        child: Image.network(
          _imgUrl,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 使用 Container 的 decoration 设置圆形图片
  Widget _decorationImage() {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
//          borderRadius: BorderRadius.all(Radius.circular(10.0)),   // 圆角图片
          borderRadius: BorderRadius.circular(150.0),
          color: Colors.green,
          image: DecorationImage(
            image: NetworkImage(_imgUrl),
            fit: BoxFit.cover,
          )),
    );
  }
}
