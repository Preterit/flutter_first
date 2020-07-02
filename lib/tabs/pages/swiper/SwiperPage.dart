import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  _SwiperPage createState() {
    return _SwiperPage();
  }
}

class _SwiperPage extends State<SwiperPage> {
  var _imgList = [
    {'img': "https://www.itying.com/images/flutter/1.png"},
    {'img': "https://www.itying.com/images/flutter/2.png"},
    {'img': "https://www.itying.com/images/flutter/3.png"},
    {'img': "https://www.itying.com/images/flutter/4.png"},
    {'img': "https://www.itying.com/images/flutter/5.png"},
    {'img': "https://www.itying.com/images/flutter/6.png"},
    {'img': "https://www.itying.com/images/flutter/7.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("轮播图演示"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 10.0),
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: new Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        _imgList[index]["img"],
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: 3,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: new Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        _imgList[index]["img"],
                        fit: BoxFit.cover,
                      );
                    },
                    pagination: new SwiperPagination(),
                    itemCount: 3,
                    viewportFraction: 0.7,
                    scale: 0.8,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: new Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        _imgList[index]["img"],
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: 3,
                    itemWidth: 300.0,
                    layout: SwiperLayout.STACK,
                  ),
                ),
              ),
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: new Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        _imgList[index]["img"],
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: 3,
                    itemWidth: 300.0,
                    itemHeight: 400.0,
                    layout: SwiperLayout.TINDER,
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(top:10.0,),
                color: Colors.cyanAccent,
                child: new ConstrainedBox(
                  child: new Swiper(
                    outer: false,
                    itemBuilder: (c, i) {
                      return new Wrap(
                        runSpacing: 6.0,
                        children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                          return new SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new SizedBox(
                                  child: new Container(
                                    child: new Image.network(
                                        "https://www.itying.com/images/flutter/1.png"),
                                  ),
                                    height: MediaQuery.of(context).size.width *
                                        0.12,
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                ),
                                new Padding(
                                  padding: new EdgeInsets.only(top: 6.0),
                                  child: new Text("$i"),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                      pagination:
                          new SwiperPagination(margin: new EdgeInsets.all(5.0)),
                    itemCount: 10,
                  ),
                  constraints: new BoxConstraints.loose(
                      new Size(double.infinity, 170.0)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
