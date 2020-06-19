import 'package:flutter/material.dart';
import 'package:flutterfirst/Route/Routes.dart' as prefix0;
import 'package:flutterfirst/tabs/BottomTabs.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomTabs(),
      onGenerateRoute: prefix0.onGenerateRoute,
    );
  }
}

//      body: TextWidget(),
//      body: ImageWidget(),
//      body: MyGridViewWidget(),
//      body: PaddingWidgetTest(),
//      body: ColumnWiget(),
//      body: ExpandedWidget(),
//      body: StackAndAlign(),
//      body: StackAndPositioned(),
//      body: AspectratioWidget(),
//      body: CardWidget(),
//      body: WrapWidget(),