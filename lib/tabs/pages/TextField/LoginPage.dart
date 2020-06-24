import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String _errorText;
  String _pwdErrorText;
  Color _nameIconColor = Colors.grey;
  Color _pwdIconColor = Colors.grey;

  FocusNode nameFocusNode = FocusNode();
  final nameController = TextEditingController();
  FocusNode pwdFocusNode = FocusNode();
  final pwdController = TextEditingController();

  Color getIconColor() {
    return _errorText == null ? Colors.redAccent : Colors.white30;
  }

  @override
  void initState() {
    super.initState();
    nameFocusNode.addListener(() {
      if (!nameFocusNode.hasFocus) {
        /// 失去焦点
        setState(() {
          if (nameController.text.isEmpty) {
            _errorText = "请输入正确用户名";
            _nameIconColor = Colors.redAccent;
          } else {
            _errorText = null;
            _nameIconColor = Colors.green;
          }
        });
      }
    });

    pwdFocusNode.addListener(() {
      if(!pwdFocusNode.hasFocus){
        /// 失去焦点
        setState(() {
          if (pwdController.text.isEmpty) {
            _pwdErrorText = "请输入正确密码";
            _pwdIconColor = Colors.redAccent;
          } else {
            _pwdErrorText = null;
            _pwdIconColor = Colors.green;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登陆"),
        centerTitle: true,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: TextField(
                focusNode: nameFocusNode,
                controller: nameController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    size: 20.0,
                    color: _nameIconColor,
                  ),
                  isDense: true,
                  labelText: "用户名",
                  labelStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                  errorText: _errorText,
                  errorStyle: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.cyanAccent,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(233, 233, 233, 0.9),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: TextField(
                focusNode: pwdFocusNode,
                controller: pwdController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.help,
                    size: 20.0,
                    color: _pwdIconColor,
                  ),
                  isDense: true,
                  labelText: "密码",
                  labelStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                  errorText: _pwdErrorText,
                  errorStyle: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.cyanAccent,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(233, 233, 233, 0.9),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
