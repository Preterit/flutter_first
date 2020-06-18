import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirst/res/listData.dart';

/// Card 卡片组件
class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listData.map((value) {
        return Card(
          margin: EdgeInsets.all(10.0),
          elevation:5.0,
          color:Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(value["imageUrl"],fit: BoxFit.cover,),
              ),
              ListTile(
                title: Text(
                  value["author"],
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                subtitle: Text(
                  value["title"],
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(value["imageUrl"]),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
