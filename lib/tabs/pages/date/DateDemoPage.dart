import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'DateUtil.dart';

/// 日期格式转换 系统默认 日期选择器，时间选择器。
class DateDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DateDemoPage();
  }
}

class _DateDemoPage extends State<DateDemoPage> {
  DateTime _selectDate = DateTime.now();
  TimeOfDay _selectTime = TimeOfDay.now();
  DateTime _pickerDate = DateTime.now();

  //创建时间对象，获取当前时间
  DateTime now = new DateTime.now();
  DateTime time;
  DateTime last;

  @override
  void initState() {
    super.initState();
    printTime();
  }

  @override
  Widget build(BuildContext context) {
    last = new DateTime.now();
    time = new DateTime.now();
    time.add(Duration(hours: 1));

    return Scaffold(
      appBar: AppBar(
        title: Text("日期相关"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("当前时间 --- ${now}"),
                    Text("当前时间戳 --- ${now.millisecondsSinceEpoch}"),
                    Text("创建指定时间对象 --- ${new DateTime(1945, 9, 9)}"),
                    Text("时间字符串转为时间对象 --- ${DateTime.parse("2020-06-30")}"),
                    Text(
                        "2天56时14分的跨度 --- ${new Duration(days: 2, hours: 56, minutes: 14)}"),
                    SizedBox(height: 5.0),
                    Text(
                      "time对象 --- ${time}",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "last对象 --- ${last}",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                        "time.compareTo(last) 大于返回1 ***** ${time.compareTo(last)}"),
                    Text(
                        "time.isAfter(last) 是否在之后 ***** ${time.isAfter(last)}"),
                    Text(
                        "time.isBefore(last) 是否在之前 ***** ${time.isBefore(last)}"),
                    Text(
                        "time.isAtSameMomentAs(last)是否在同一时刻 ** ${time.isAtSameMomentAs(last)}"),
                    SizedBox(height: 20.0),
                    Text(
                      "date_format --- 三方 日期格式化库 的使用",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                        "DateTime(1989, 02, 21)   转换为   ${formatDate(DateTime(1989, 02, 21), [
                      yyyy,
                      '-',
                      mm,
                      '-',
                      dd
                    ])}"),
                    SizedBox(height: 10.0),
                    InkWell(
                      onTap: () {
                        _selectDateMethod();
                      },
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("日期选择",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 10.0),
                          Text(formatDate(
                              _selectDate, [yyyy, "-", mm, "-", dd])),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    InkWell(
                      onTap: () {
                        _selectTimeMethod();
                      },
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("时间选择",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 10.0),
                          Text(_selectTime.format(context)),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 50.0),
            Container(
              width: double.infinity,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Flutter Cupertino Date Picker",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  new InkWell(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          formatDate(_pickerDate, [
                            yyyy,
                            "-",
                            mm,
                            "-",
                            dd,
                            " ",
                            HH,
                            ':',
                            nn,
                            ':',
                            ss,
                          ]),
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                    onTap: _showDatePickerSelect,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            new Center(
              widthFactor: double.infinity,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "InkWell 组件使用",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("基本使用:",
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(width: 10.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          child: Text('这是InkWell点击效果'),
                        ),
                        highlightColor: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("边框处理:",
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(width: 10.0),
                      Ink(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.cyanAccent),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]),
                        ),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20.0),
                            child: Text('这是InkWell点击效果',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// datePicker 底部弹框
  void _showDatePickerSelect() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('确认', style: TextStyle(color: Colors.red)),
        cancel: Text('取消', style: TextStyle(color: Colors.red)),
      ),
      minDateTime: DateTime.parse('2010-05-12'),
      maxDateTime: DateTime.parse('2021-11-25'),
      initialDateTime: _pickerDate,
      dateFormat: 'yyyy-MMM-dd  EEE , HH:mm:ss',
      pickerMode: DateTimePickerMode.datetime,
      locale: DateTimePickerLocale.zh_cn,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _pickerDate = dateTime;
        });
      },
    );
  }

  /// Future表示异步的返回值  必须使用async
  /// async 和 await 是组合使用的。
  /// 日期选择
  void _selectDateMethod() async {
    var result = await showDatePicker(
      context: context,
      initialDate: _selectDate,
      firstDate: DateTime(1998),
      lastDate: DateTime(2100),
    );
    if (result == null) return;
    setState(() {
      _selectDate = result;
    });
  }

  /// 时间选择
  void _selectTimeMethod() async {
    var result = await showTimePicker(
      context: context,
      initialTime: _selectTime,
    );
    if (result == null) return;

    /// 刷新数据
    setState(() {
      _selectTime = result;
    });
  }
}
