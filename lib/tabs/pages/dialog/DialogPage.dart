import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() {
    return _DialogPageState();
  }
}

class _DialogPageState extends State<DialogPage> {
  /// AlertDialog
  _alertDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("AlertDialog"),
          content: Text("content"),
          actions: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text("取消"),
              onPressed: () {
                Navigator.pop(context, "取消");
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("确认"),
              onPressed: () {
                Navigator.pop(context, "确认");
              },
            ),
          ],
        );
      },
    );
    print("-----" + result);
  }

  /// SimpleDialog
  _simpleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("SimpleDialog"),
          titlePadding: EdgeInsets.only(left: 10.0, top: 10.0),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("SimpleDialogOption 1"),
              onPressed: () {
                Navigator.pop(context, "SimpleDialogOption 1");
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text("SimpleDialogOption 2"),
              onPressed: () {
                Navigator.pop(context, "SimpleDialogOption 2");
              },
            ),
          ],
        );
      },
    );
    print("-----" + result);
  }

  /// 底部弹出对话框
  void _showBottomSheet() async {
    var result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200.0,
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: new Column(
              children: <Widget>[
                ListTile(
                  title: Text("item 1"),
                  onTap: () {
                    Navigator.pop(context, "item 2");
                  },
                ),
                ListTile(
                  title: Text("item 2"),
                  onTap: () {
                    Navigator.pop(context, "item 2");
                  },
                ),
                ListTile(
                  title: Text("item 3"),
                  onTap: () {
                    Navigator.pop(context, "item 3");
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
    print("-----" + result);
  }

  /// IOS 风格的弹框
  void _showCupertinoAlertDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("这是一个 IOS 风格的弹框"),
          content: SizedBox(
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("第1行"),
                  Text("第2行"),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("取消"),
              onPressed: () {
                Navigator.pop(context,"取消");
              },
            ),
            CupertinoDialogAction(
              child: Text("确定"),
              onPressed: () {
                print("确定");
              },
            ),
          ],
        );
      },
    );
    print("-----" + result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
        centerTitle: true,
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text("AlearDialog"),
              onPressed: _alertDialog,
            ),
            RaisedButton(
              child: Text("SimpleDialog"),
              onPressed: _simpleDialog,
            ),
            RaisedButton(
              child: Text("showModalBottomSheet"),
              onPressed: _showBottomSheet,
            ),
            RaisedButton(
              child: Text("CupertinoAlertDialog"),
              onPressed: _showCupertinoAlertDialog,
            ),
            RaisedButton(
              child: Text("Toast"),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "This is Bottom Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.black12,
                  textColor: Colors.black54,
                  fontSize: 12.0,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
