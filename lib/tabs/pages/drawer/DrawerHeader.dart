import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// 自定以  DrawHeader
class CusDrawHader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://www.itying.com/images/flutter/1.png"),
            fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          /// 可以使用这中方式来设置背景图。
//                Image.network("https://www.itying.com/images/flutter/2.png",fit: BoxFit.cover,width: double.infinity,),
          Align(
            alignment: FractionalOffset.bottomLeft,
            child: Container(
              height: 70.0,
              margin: EdgeInsets.only(left: 18.0, bottom: 18.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                /* 宽度只用包住子组件即可 */
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.itying.com/images/flutter/3.png'),
                    radius: 35.0,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 6.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Tom",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600)),
                          new Text("18614005205@163.com",
                              style: new TextStyle(
                                  fontSize: 14.0, color: Colors.white)),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
