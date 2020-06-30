import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                          Text("日期选择"),
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
                          Text("时间选择"),
                          SizedBox(width: 10.0),
                          Text(_selectTime.format(context)),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
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
    setState(() {
      _selectTime = result;
    });
  }

  /* formatDate 使用案例 */
  void printTime() {
    print(
        "1 --- " + formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));
    print("2 --- " + formatDate(DateTime(1989, 2, 21), [yy, '-', m, '-', dd]));
    print("3 --- " + formatDate(DateTime(1989, 2, 1), [yy, '-', m, '-', d]));

    print("4 --- " + formatDate(DateTime(1989, 2, 1), [yy, '-', MM, '-', d]));
    print("5 --- " + formatDate(DateTime(1989, 2, 21), [yy, '-', M, '-', d]));

    print("6 --- " + formatDate(DateTime(1989, 2, 1), [yy, '-', M, '-', d]));

    print("7 --- " + formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', DD]));
    print("8 --- " + formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', D]));

    print("9 --- " +
        formatDate(DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss]));

    print("10 --- " +
        formatDate(DateTime(1989, 02, 1, 15, 40, 10),
            [hh, ':', nn, ':', ss, ' ', am]));

    print("11 --- " +
        formatDate(DateTime(1989, 02, 1, 15, 40, 10),
            [hh, ':', nn, ':', ss, ' ', am]));

    print("12 --- " + formatDate(DateTime(1989, 02, 1, 15, 40, 10), [hh]));
    print("13 --- " + formatDate(DateTime(1989, 02, 1, 15, 40, 10), [h]));

    print("14 --- " + formatDate(DateTime(1989, 02, 1, 5), [am]));
    print("15 --- " + formatDate(DateTime(1989, 02, 1, 15), [am]));

    print("16 --- " +
        formatDate(
            DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, z]));

    print("17 --- " +
        formatDate(
            DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));

    print("18 --- " + formatDate(DateTime(1989, 02, 21), [yy, ' ', w]));
    print("19 --- " + formatDate(DateTime(1989, 02, 21), [yy, ' ', W]));

    print("20 --- " + formatDate(DateTime(1989, 12, 31), [yy, '-W', W]));
    print("21 --- " + formatDate(DateTime(1989, 1, 1), [yy, '-', mm, '-w', W]));

    print("22 --- " +
        formatDate(
            DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));
  }
}
