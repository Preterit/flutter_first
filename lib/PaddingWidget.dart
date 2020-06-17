import 'package:flutter/cupertino.dart';

class PaddingWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.fromLTRB(0, 0, 10.0, 10.0),
      children: <Widget>[
        Padding(
          child: Image.network(
            "https://www.itying.com/images/flutter/1.png",
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Padding(
          child: Image.network(
            "https://www.itying.com/images/flutter/2.png",
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Padding(
          child: Image.network(
            "https://www.itying.com/images/flutter/3.png",
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Padding(
          child: Image.network(
            "https://www.itying.com/images/flutter/4.png",
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Padding(
          child: Image.network(
            "https://www.itying.com/images/flutter/5.png",
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Padding(
          child: Image.network(
            "https://www.itying.com/images/flutter/6.png",
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Padding(
          child: Image.network(
            "https://www.itying.com/images/flutter/7.png",
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
      ],
    );
  }
}
