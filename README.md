# flutterfirst

哈哈哈

## Getting Started
# Container:容器

<img src="./img/container1.png" style="zoom:50%;" />

```java
Container({
    Key key,                         //
    this.alignment,                  //  控制child的对齐方式
    this.padding,                    //  内间距
    Color color,                     //  用来设置container背景色，如果decoration设置了背景颜色，则在设置color的值，会报错。
    Decoration decoration,           //  绘制在child后面的装饰,
    this.foregroundDecoration,       //  绘制在child前面的装饰。
    double width,                    //  如果不设置，则会填充全屏
    double height,                   //  高度不设置，则会强制在高度上充满
    BoxConstraints constraints,
    this.margin,                     //  外边距
    this.transform,                  //  设置container的变换矩阵，类型为Matrix4。
    this.child,                      //  内容widget
  })
```

# Text : 文本组件

**Text**

```java
const Text(
    this.data, {
    Key key,
    this.style,           // 文本样式，
    this.strutStyle,
    this.textAlign,       // 文字对齐方式
    this.textDirection,
    this.locale,          // 此属性很少设置，用于选择区域特定字形的语言环境
    this.softWrap,        // 某一行中文本过长，是否需要换行。默认为true，如果为false，则文本中的字形将被定位为好像存在无限的水平空间
    this.overflow,        // 文字超出部分显示情况
    this.textScaleFactor, // 文字缩放，如果文本比例因子为1.5，则文本将比指定的字体大小大50％。
    this.maxLines,        // 文字最多几行
    this.semanticsLabel,  // 描述文字
    this.textWidthBasis,  // 基准线
  })
```



**Text ---- TextStyle**

```java
const TextStyle({
    this.inherit: true,         // 为false的时候不显示
    this.color,                 // 颜色
    this.fontSize,              // 字号
    this.fontWeight,            // 字重，加粗也用这个字段  FontWeight.w700
    this.fontStyle,             // FontStyle.normal  FontStyle.italic斜体
    this.letterSpacing,         // 字符间距  就是单个字母或者汉字之间的间隔，可以是负数
    this.wordSpacing,           // 字间距 句字之间的间距
    this.textBaseline,          // 基线，两个值，字面意思是一个用来排字母的，一个用来排表意字的（类似中文）
    this.height,                // 当用来Text控件上时，行高（会乘以fontSize,所以不以设置过大）
    this.decoration,        		// 添加上划线，下划线，删除线
    this.decorationColor,       // 划线的颜色
    this.decorationStyle,       // 这个style可能控制画实线，虚线，两条线，点, 波浪线等
    this.debugLabel,
    String fontFamily,          // 字体
    String package,
  })
```



# Image : 图片组件

> 图片组件显示图像的的组件,Image组件有很多构造方法,

1. **Image.asset:加载本地图片**
2. **Image.network:加载网络图片**
3. **绘制圆形图片**

**Image 属性 **

```Dart
 const Image({
    Key key,
    @required this.image,                  // 需要展示的Image
    this.frameBuilder,
    this.loadingBuilder,
    this.semanticLabel,                    // 用来描述图片的，无足轻重
    this.excludeFromSemantics = false,
    this.width,                            // 指Image Widget的可显示区域的宽高
    this.height,                           // 指Image height的可显示区域的宽高
    this.color,                            // 图片的背景颜色
    this.colorBlendMode,                   // 对图片进行混合颜色处理
    this.fit,                              // fit 设置图片的填充模式，具体由BoxFit实现
    this.alignment = Alignment.center,     // alignment 设置图片显示位置
    this.repeat = ImageRepeat.noRepeat,    // 设置图片重复填充方式
    this.centerSlice,                      // 将图片中的centerSlice区域设置为.9图片，按照.9图片进行拉伸显示。
    this.matchTextDirection = false,
    this.gaplessPlayback = false,          // 当image provider 发生变化时，显示新图片的过程中，如果true则保留旧图片直至显示出新图片为止；如果false，则显示新图片的过程中，空白，不保留旧图片。
    this.filterQuality = FilterQuality.low,
  })
```

## 绘制圆形图片

> **方法一 : 使用 Container 的 decoration 设置圆形图片**
>
> 下面这种方式设置圆形图片 跟Android 设置背景图相似.
```dart
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
```

> **使用ClipOval方式 创建一个圆形图片**
>
> ClipOval继承 Widget ,是一个容器组件,内部有一个Widget,将 Image 组件赋值给child属性

```dart
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
```

## Image.asset : 加载本地图片

- 在项目的根目录创建一个images 目录,
- 在images文件中创建三个 不同尺寸的文件夹,**`2.0x`**,**`3.0x`**,**`4.0x`**

```dart
/// 加载本地图片
/// 这里设置 宽高是由于图片不规则,ClipOval 会变成椭圆.
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
```

# ListView : 列表组件

**普通使用:**

```dart
/// 获取Widget 集合
List<Widget> _data() {
  List<Widget> result = new List();
  for (int i = 0; i < 20; i++) {
    result.add(_container());
  }
  return result;
}
/// 返货ListView Widget
Widget _listViewWidget() {
  return ListView(
    physics:BouncingScrollPhysics(),
    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
    children: this._data(),
  );
}
```

## ListView ListTile

> **ListTile** 是**Flutter** 给我们准备好的**widget** 提供非常常见的构造和定义方式，包括文字，**icon**，点击事件，一般是能够满足基本需求，但是就不能自己定义了

```dart
const ListTile({
    this.leading,              // item 前置图标
    this.title,                // item 标题
    this.subtitle,             // item 副标题
    this.trailing,             // item 后置图标
    this.isThreeLine = false,  // item 是否三行显示
    this.dense,                // item 直观感受是整体大小
    this.contentPadding,       // item 内容内边距
    this.enabled = true,
    this.onTap,                // item onTap 点击事件
    this.onLongPress,          // item onLongPress 长按事件
    this.selected = false,     // item 是否选中状态
})
```

```dart
/// 获取Widget 集合
List<Widget> _data() {
  List<ListTile> result = new List();
  for (int i = 0; i < 20; i++) {
    result.add(new ListTile(
      title: Text("这是主标题"),
      subtitle: Text("这是副标题，副标题是小的。"),
      leading: Icon(Icons.account_box),
    ));
  }
  return result;
}
```

## ListView builder

> **builder** 顾名思义 构造 可以非常方便的构建我们自己定义的**child**布局，所以在**Flutter**中非常的常用。

**builder 属性介绍**

```dart
ListView.builder({
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,                // 滑动监听
  bool primary,                               // false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
  ScrollPhysics physics,                      // 滑动类型设置
  bool shrinkWrap = false,                    // 内容适配
  EdgeInsetsGeometry padding,                 // 那边距
  this.itemExtent,                            // 确定每一个item的高度 会让item加载更加高效
  @required IndexedWidgetBuilder itemBuilder,
  int itemCount,                              // item 数量
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  bool addSemanticIndexes = true,
  double cacheExtent,                         //  设置预加载的区域
  int semanticChildCount,
  DragStartBehavior dragStartBehavior = DragStartBehavior.start,
})
```

```dart
List<Widget> _result = new List();
ListBuilder() {
  for (int i = 0; i < 20; i++) {
    _result.add(new ListTile(
      title: Text("主标题"),
      subtitle: Text("副标题"),
    ));
  }
}

Widget _itemBuilder(BuildContext context, int index) {
  return _result[index];
}

@override
Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: _result.length,
    itemBuilder: this._itemBuilder,
  );
}
```

# GridView : 网格组件

> GridView创建网格布局列表有很多方式,常用的两种:
>
> 1. 通过  **`GridView.count`**  实现网格布局.
> 2. 通过  **`GridView.builder`**  实现网格布局

**常用属性:**

| 属性             | 类型                            | 说明                                   |
| ---------------- | ------------------------------- | -------------------------------------- |
| scrollDirection  | Axis                            | 滚动方向                               |
| padding          | EdgeInsetsGeometry              | 内边距                                 |
| reverse          | bool                            | 组件反向排序                           |
| crossAxisSpacing | double                          | 水平子 Widget 之间间距                 |
| mainAxisSpacing  | double                          | 垂直子 Widget 之间间距                 |
| crossAxisCount   | int                             | 一行的 Widget 数量                     |
| childAspectRatio | double                          | 子 Widget 宽高比例                     |
| children         |                                 | <Widget>[ ]                            |
| gridDelegate     | SliverGridDelegateWithFix(常用) | 控制布局主要用在 GridView.builder 里面 |

##  GridView.count 的使用

```dart
/// 获取 GirdView 的item数据
List<Widget> _getWidgetList() {
  var resultList = listData.map((value) {
    return Container(
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]),
            SizedBox(height: 10.0),
            Text(
              value["title"],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
                color: Color.fromRGBO(233, 233, 233, 0.9), width: 1.0)));
  });

  /// ("xxxx","xxxxxx")  这里需要转下list
  return resultList.toList();
}
/// 使用 GridView.count 创建 GridView 列表.
@override
Widget build(BuildContext context) {
  return GridView.count(
    crossAxisCount: 3,
    padding: EdgeInsets.all(10.0),
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    children: this._getWidgetList(),
  );
}
```

## GridView.builder 的使用

```dart
@override
Widget build(BuildContext context) {
  return GridView.builder(
    padding: EdgeInsets.all(10.0),
    itemCount: listData.length,
    itemBuilder: this._getWidgetBuilder,
    ///  下面需要注意的 与 GridView.count 不同的是,
    ///  通过 builder 生成的 GridView 部分属性 是通过 gridDelegate 设置的.
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    ),
  );
}
/// GridView.builder itemBuilder 需要的类型是 Widget 类型, 这个方法就是创建itemBuilder
Widget _getWidgetBuilder(context, index) {
  return new Container(
    decoration: BoxDecoration(
      border:
          Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Column(
      children: <Widget>[
        Image.network(listData[index]["imageUrl"], fit: BoxFit.cover),
        SizedBox(height: 10.0),
        Text(
          listData[index]["title"],
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 13.0),
        )
      ],
    ),
  );
}
```



# Padding : 组件

> 在Flutter中很多 Widget 没有 padding 属性.这个时候我们可以用 **Padding** 组件处理容器与子元素直接的间距.

| 属性    | 说明                               |
| ------- | ---------------------------------- |
| padding | padding值, EdgeInsets设置填充的值. |
| child   | 子组件                             |

 **使用方法**

```dart
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
      ],
    );
  }
}
```

# Row & Column & Expanded

| 属性               | 类型               | 说明           |
| ------------------ | ------------------ | -------------- |
| mainAxisAlignment  | MainAxisAlignment  | 主轴的排序方式 |
| crossAxisAlignment | CrossAxisAlignment | 次轴的排列顺序 |
| children           |                    | <Widget>[]     |

## 自定义 Widget

```dart
class _GetCusWidget extends StatelessWidget {
  IconData icon;
  Color color;
  double size;
  /// 构造方法 第二个,第三个 参数 ,是可选参数.
  _GetCusWidget(this.icon, {this.color = Colors.blue, this.size = 32.0});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        width: 50.0,
        color: color,
        child: Center(
          child: Icon(icon, color: Colors.white, size: this.size),
        ));
  }
}
```
## Row 水平布局组件--使用:

> 这里的主轴  **`(可以理解为水平)`**  次轴 **`(可以理解为垂直)`**  .

```dart
/// 水平布局组件
class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800.0,
      width: 300.0,
      color: Colors.yellow,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,  /// 这里使用 父布局高度的一半位置.
        mainAxisAlignment: MainAxisAlignment.start,     /// 位置是 屏幕的最左边
        children: <Widget>[
          _GetCusWidget(Icons.home, color: Colors.blue),
          _GetCusWidget(Icons.search, color: Colors.orange),
          _GetCusWidget(Icons.map, color: Colors.red)
        ],
      ),
    );
  }
}
```

## Column 垂直布局组件--使用:

> 这里的主轴  **`(这里是指垂直方向)`**  , 这里的次轴 **`(这里的次轴指水平方向)`**

```dart
/// 垂直布局组件
class ColumnWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800.0,
      width: 300.0,
      color: Colors.yellow,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _GetCusWidget(Icons.home, color: Colors.blue),
          _GetCusWidget(Icons.search, color: Colors.orange),
          _GetCusWidget(Icons.map, color: Colors.red)
        ],
      ),
    );
  }
}
```

## Expanded 权重组件

> 类似 **`Android-LinearLayout  `** 的权重

| 属性  | 说明                                   |
| ----- | -------------------------------------- |
| flex  | 元素占整个父  **`Row /column`** 的比例 |
| child | 子元素                                 |

**基本使用:**

```dart
class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      child: Column(
        children: <Widget>[
          Container(height: 180.0, color: Colors.black),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 150.0,
                  child: Image.network(
                    "https://www.itying.com/images/flutter/3.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 1,
                child: Container(  /// 这里需要指定高度,不然会显示不出来.
                  height: 150.0,
                  child: ListView(
                    children: <Widget>[
                      Image.network(
                        "https://www.itying.com/images/flutter/1.png",
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10.0),
                      Image.network(
                        "https://www.itying.com/images/flutter/2.png",
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
```

# Stack : 堆

> 有点类似 **`Android RelativeLayout `** 控件,如果单纯只用Stack组件的话,里面的元素多了,会叠在一块.
>
> **`一般 Stack 是结合 Align 使用 `**
>
> **`或者 Stack 结合 Positioned 使用 `**

## Stack & Align

**Align属性:**

| 属性                  | 说明                 |
| --------------------- | -------------------- |
| **Align # alignment** | 配置子元素的显示位置 |
| **Align # child**     | 子组件               |

**使用:**

```dart
/// Stack 结合 Align 使用
class StackAndAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 300.0,
      color: Colors.lightGreenAccent,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,   ///  跟 alignment: Alignment(1,1) 是一样的功能
            child: Icon(Icons.home, size: 32.0, color: Colors.red),
          ),
          Align(
            alignment: Alignment(1,1),
            child: Icon(Icons.search, size: 32.0, color: Colors.blue),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.send, size: 32.0, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
```

## Stack & Positioned

**Positioned属性:**

| 属性   | 说明                 |
| ------ | -------------------- |
| top    | 子元素距离顶部的距离 |
| bottom | 子元素距离底部的距离 |
| left   | 子元素距离左侧距离   |
| right  | 子元素距离右侧距离   |
| child  | 子组件               |

**使用**

```dart
/// Stack 结合 Positioned 使用
class StackAndPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 300.0,
      color: Colors.lightGreenAccent,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 50.0,
            child: Icon(Icons.send, size: 32.0, color: Colors.grey),
          ),
          Positioned(
            right: 0,
            bottom: 50.0,
            child: Icon(Icons.home, size: 32.0, color: Colors.red),
          ),
          /// 居中展示
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Icon(Icons.send, size: 32.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
```

# AspectRatio : 宽高比(16/9)

> **AspectRatio**  的作用是根据 设置调整子元素child的宽高比
>
> **AspectRatio**  首先会在布局限制条件允许的范围内尽可能的扩展,widget 的高度由宽度和比例决定的, **`类似于BoxFit中的contain`**  ,按照比例去尽可能占满区域.
>
> 如果在满足所有限制条件后,无法找到一个可行的尺寸, **AspectRatio**  最终将会去优先适应布局限制条件.而忽略所设置的比例.

| 属性        | 说明                                                         |
| ----------- | ------------------------------------------------------------ |
| aspectRatio | 宽高比,最终可能不会根据这个值去布局,外层是否允许按照这个比例进行布局,这只是个参考值. |
| child       | 子元素                                                       |

```dart
/// aspectRatio:1/2  width:height
class AspectratioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      width: 100.0,
    height: 100.0,
      color: Colors.lightGreenAccent,
      child: AspectRatio(
        aspectRatio: 2.0 / 4.0,
        child:Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
```



# Card : 卡片组件

> **Card** 是卡片组件快,内容可以由大多数类型的 **Widget** 构成, **Card具有圆角,和阴影** 这让它看起来有立体感.

| 属性      | 说明                                                         |
| --------- | ------------------------------------------------------------ |
| child     | 子元素                                                       |
| margin    | 外边距                                                       |
| Shape     | Card的阴影效果,默认的阴影效果为圆角的长方形边                |
| elevation | 阴影大小                                                     |
| color     | 卡片背景颜色                                                 |
| shape     | RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), |

**使用:**

```dart
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
```

# Wrap : 流布局 组件

> **Wrap** 可以实现流布局,单行 **Wrap** 跟 **Row** 表现几乎一致,但是 **Row和Column都是单列.** **Wrap** 则突破这个限制,在 **mainAsis** 空间不足时,则向 **crossAxis** 上去扩展显示.

| 属性              | 说明                                                         |
| ----------------- | ------------------------------------------------------------ |
| direction         | 展示方向,默认是,  **Axis.horizontal**                        |
| alignment         | 主轴的对齐方式                                               |
| spacing           | 主轴方向上的 **item间距**                                    |
| textDirection     | **TextDirection.ltr** 文本正常展示,  **TextDirection.rtl** 文本从右边开始展示. |
| verticalDirection | 定义了 **children** 摆放顺序,默认是 **down**                 |
| runSpacing        | 次轴方向的间距                                               |
| spacing           | 主轴方向的间距                                               |

**使用:**

```dart
/// Wrap 组件 使用
class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      verticalDirection: VerticalDirection.down,
      direction: Axis.horizontal,
      textDirection: TextDirection.rtl,
      spacing: 10.0,
      runSpacing: 10.0,
      children: <Widget>[
        RaisedButtonWidget("java"),
        RaisedButtonWidget("python"),
        RaisedButtonWidget("全部技术总监"),
        RaisedButtonWidget("ios"),
        RaisedButtonWidget("go"),
        RaisedButtonWidget("go"),
        RaisedButtonWidget("维护技术专员"),
        RaisedButtonWidget("全部技术总监"),
        RaisedButtonWidget("php"),
        RaisedButtonWidget("图形项目经理"),
        RaisedButtonWidget("产品经理"),
        RaisedButtonWidget("算法工程师"),
        RaisedButtonWidget("UI设计"),
      ],
    );
  }
}
```

# StatefulWidget : 有状态的组件

> 在 Flutter 中自定义组件其实就是一个类，这个类需要继承  **StatelessWidget/StatefulWidget** 。
>
> **StatelessWidget** 是无状态组件，状态不可变的 widget
>
> **StatefulWidget** 是有状态组件，持有的状态可能在 widget 生命周期改变。
>
> 通俗的讲：如果我们想改变页面中的数据的话这个时候就需要用到 **StatefulWidget**

```dart
/// 有状态的组件
class StateFulWidgetTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateFul();
  }
}

class _StateFul extends State<StateFulWidgetTest> {
  List<String> _list = new List();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.lightGreenAccent,
          height: 600.0,
          child: ListView(
            children: _list.map((value) {
              return ListTile(
                title: Text(value),
              );
            }).toList(),
          ),
        ),
        RaisedButton(
          child: Text("按钮"),
          textColor: Colors.orange,
          onPressed: () {  /// 点击事件 , list里面数据发生变化, ListView就会重新渲染页面.
            setState(() {
              _list.add("添加的数据${_list.length + 1}");
            });
          },
        )
      ],
    );
  }
}
```

# BottomNavigationBar : 底部导航组件

> **BottomNavigationBar** 是底部导航条，可以让我们定义底部 **Tab** 切换，**bottomNavigationBar** 是 **Scaffold** 组件的参数。

| 属性                | 说明                                                         |
| ------------------- | ------------------------------------------------------------ |
| items               | **List<BottomNavigationBarItem>**  底部导航 条按钮集合       |
| iconSize            | 图标的大小                                                   |
| currentIndex        | 当前选中的位置                                               |
| onTap               | 选中 **tab** 的回掉                                          |
| fixedColor          | 选中后的颜色                                                 |
| type                | **BottomNavigationBarType.fixed 全部展示** **BottomNavigationBarType.shifting ** 如果 **BottomNavigationBarItem设置了backgroundColor** 则选中条目后会将颜色值设置为 **BottomNavigationBar** 的的背景颜色. |
| unselectedItemColor | 未选中的条目的颜色.                                          |
| backgroundColor     | **type 设置为 BottomNavigationBarType.fixed 的时候生效 **    |
| showSelectedLabels  | 选中不现实文字.                                              |

**使用**

```dart
class _BottomNavigationBar extends State<BottomTabs> {
  int _currentIndex = 0;
  List<Widget> _pageList = [HomePage(), CategoryPage(), SettingPage(),];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页"),
              backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("分类"),
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("设置"),
            backgroundColor: Colors.amber
          ),
        ],
        showSelectedLabels:false,
        unselectedItemColor: Color.fromRGBO(233, 233, 233, 0.9),
        backgroundColor:Colors.green,
        fixedColor: Colors.lightGreenAccent,  /// 选中Tab的后的颜色
        onTap: _onTap,   /// 选中状态的回掉
        currentIndex: _currentIndex,   /// 当前选中的的第几个
        type: BottomNavigationBarType.fixed,   ///  底部Tab填充模式，BottomNavigationBarType.fixed 全展示。
      ),
    );
  }
}
```

# 路由

> **Flutter** 中的路由通俗的来讲就是页面跳转,在 **Flutter** 中通过 **Navigator** 组件来管理路由导航.并提供管理堆栈的方法, **如：Navigator.push 和 Navigator.pop**
>
> Flutter 中给我们提供了两种配置路由跳转的方式： **1、基本路由 2、命名路由**

## 基本路由

**使用:**

```dart
/// 基本路由
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
          child: Text("点击跳转"),
          onPressed: () {  /// 点击事件监听
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RouteTest(str: "HomePage");   /// 通过以构造函数传参的形式传值
            }));
          },
        ),
      ],
    );
  }
}
```

```dart
/// 跳转的新的页面
class RouteTest extends StatefulWidget {
  final String str;
  RouteTest({Key key, this.str  = " ----- 默认值"}) : super(key: key);   /// 接受传过来的值
  @override
  _RouteTestState createState() {
    return _RouteTestState(str:this.str);
  }
}

class _RouteTestState extends State<RouteTest> {
  final String str;
  _RouteTestState({this.str});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("跳转页面")),
      body: Text("我是跳转过来的页面${this.str}"),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backspace),
        onPressed: (){
          Navigator.of(context).pop();   /// 返回。
        },
      ),
    );
  }
}
```

## 命名路由

### 1 : 配置命名路由

```dart
/// 配置路由
final routes = {
  "/": (context) => main(),
  '/categoryInfo': (context,{arguments}) => CategoryInfoPage(arguments:arguments),
  "/noDataPage": (context) => NoDataPageInfo(),
  "/secondPage": (context) => SecondPage(),
  "/threePage": (context) => ThreePage(),
  "/fourPage": (context) => FourPage(),
};
```

### 2 : 设置路由拦截器

> 大致思路就是, 通过名字来判断是开启那个路由,然后内部调用 基本路由的开启方式.

```dart
/// 固定写法
// ignore: strong_mode_top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
```
### 3: 命名路由的使用

> 参数的携带 通过 **Map** 传递.

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    RaisedButton(
      child: Text("命名路由跳转 --- 携带参数"),
      onPressed: () {
        Navigator.pushNamed(context, '/categoryInfo',
            arguments: {"pid": 110});
      },
    ),
    RaisedButton(
      child: Text("命名路由跳转 --- 不携带参数"),
      onPressed: () {
        Navigator.pushNamed(context, "/noDataPage");
      },
    ),
    RaisedButton(
      child: Text("命名路由跳转 --- 路由替换"),
      onPressed: () {
        Navigator.pushNamed(context, "/secondPage");
      },
    ),
  ],
);
```

### 4 : 路由替换/路由销毁

> 通过 **Navigator.push** 或者 **pushNamed** 会在堆栈中新增 一个路由，并不会把上个路由移除，所以 这种方式 返回跟路由的方式。 把堆栈清空，重新开启跟路由。
>
>  接受两个参数，**第一个是开启新路由名**，下面的处理中我们清空了 route 全部置为 null，则会路由到 '/' 根路由前的所有 route 都被干掉。

```dart
RaisedButton(
  child: Text("pushNamedAndRemoveUntil 的返回"),
  onPressed: () {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomTabs(index: 1)),   /// 这里跟路由传 1 代表 我要BottomNavBar 的item 为1
        (route) => route == null);
  },
),
```

# AppBar



| 属性            | 说明                                                         |
| --------------- | ------------------------------------------------------------ |
| leading         | 在标题前面显示的一个控件，在首页通常显示应用 的 logo；在其他界面通常显示为返回按钮 |
| title           | 标题，通常显示为当前界面的标题文字，可以放组件               |
| actions         | 通常使用 IconButton 来表示，可以放按钮组                     |
| bottom          | 通常放 tabBar，标题下面显示一个 Tab 导航栏                   |
| backgroundColor | 导航背景颜色                                                 |
| iconTheme       | 图标样式                                                     |
| textTheme       | 文字样式                                                     |
| centerTitle     | 标题是否居中显示                                             |
| brightness      | Brightness.light 状态栏 样式                                 |

**使用:**

```dart
class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black,opacity: 0.6),     ///设置导航栏图标样式
        actionsIconTheme: IconThemeData(color: Colors.blue,opacity: 0.6),   ///设置导航右边图标的主题色，此时iconTheme对于右边图标颜色会失效
        brightness: Brightness.light,  ///设置导航条上面的状态栏显示字体颜色
        textTheme: TextTheme( ///设置AppBar上面各种字体主题色
            title: TextStyle(color: Colors.red,fontSize: 20.0,fontWeight:FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen, /// 导航栏背景颜色
        centerTitle: true,  /// 标题居中显示
        title: Text("自定义导航"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: () {
              print("Search pressed");
            },
          ),
          PopupMenuButton(
            tooltip: "长按提示",
            initialValue: "hot",
            padding: EdgeInsets.all(10.0),
            itemBuilder: _itemBuilder,
            onSelected: _onSelected,
          ),
        ],
      ),
      body: Center(
        child: Text("自定义导航"),
      ),
    );
  }
```

# TabBar

> 在AppBar中有一个非常重要的Widget，这个Widget就是bottom，bottom是一个抽象类PreferredSizeWidget.

```dart
const TabBar({
    Key key,
    @required this.tabs,//必须实现的，设置需要展示的tabs，最少需要两个
    this.controller,
    this.isScrollable = false,//是否需要滚动，true为需要
    this.indicatorColor,//选中下划线的颜色
    this.indicatorWeight = 2.0,//选中下划线的高度，值越大高度越高，默认为2
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,//用于设定选中状态下的展示样式
    this.indicatorSize,//选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
    this.labelColor,//设置选中时的字体颜色，tabs里面的字体样式优先级最高
    this.labelStyle,//设置选中时的字体样式，tabs里面的字体样式优先级最高
    this.labelPadding,
    this.unselectedLabelColor,//设置未选中时的字体颜色，tabs里面的字体样式优先级最高
    this.unselectedLabelStyle,//设置未选中时的字体样式，tabs里面的字体样式优先级最高
    this.dragStartBehavior = DragStartBehavior.start,
    this.onTap,//点击事件
  })
```

**使用:**

> 使用 **DefaultTabController**  与 **Scaffold** 通过在 **AppBar** 的 **bottom属性** 将 **TabBar** 设置在 **AppBar下面**

```dart
Widget _bottomTabs() {
  return TabBar(
    tabs: tabsList,
    unselectedLabelColor: Colors.grey,///置未选中时的字体颜色，tabs里面的字体样式优先级最高
    unselectedLabelStyle: TextStyle(fontSize: 20),///设置未选中时的字体样式，tabs里面的字体样式优先级最高
    labelColor: Colors.black,///设置选中时的字体颜色，tabs里面的字体样式优先级最高
    labelStyle: TextStyle(fontSize: 20.0),///设置选中时的字体样式，tabs里面的字体样式优先级最高
    isScrollable: true,///允许左右滚动
    indicatorColor: Colors.red,///选中下划线的颜色
    indicatorSize: TabBarIndicatorSize.label,///选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
    indicatorWeight: 3.0,///选中下划线的高度，值越大高度越高，默认为2。0
  );
}
```

**TabController 方式实现TabBar **

>
> 使用 **TabController** 方法 必须继承有状态的 **StatefulWidget** ,
>

```dart
/// state 组件创建的默认走的方法
@override
void initState() {   /// 生命周期函数
  super.initState();
  _tabController = new TabController(length: 14, vsync: this);   /// 初始化 TabController
}

@override
void dispose() {    /// 生命周期函数
  super.dispose();
  if (_tabController != null) {
    _tabController.dispose();   /// 组件销毁的 销毁 TabController
  }
}

@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabController 实现"),
        centerTitle: true,
        leading: Icon(Icons.settings),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,   /// 这里必须加上 相当于绑定, 方便 监听 切换 改变.
          tabs: CustomAppbar().tabsList,
        ),
      ),
      body: Container(
        height: 100.0,
        color: Colors.lightGreen,
        child: TabBarView(
            controller: _tabController,  /// 这里必须加上 相当于绑定, 方便 监听 切换 改变.
          	children: CustomAppbar().tabViewList),
      ),
    );
  }

/// 设置 监听
_tabController.addListener(() {
        print("----${_tabController.index}");
});

```

# Drawer 侧边栏组件

```dart
drawer: DrawerWidget(),  // 显示在左边的 Drawer
endDrawer: DrawerWidget(),    // 显示在右边的 Drawer
```
```dart
@override
Widget build(BuildContext context) {
  _context = context;
  return Drawer(
    child: ListView(
      children: <Widget>[
        CusDrawHader(),   // 自定 header 布局
        UserAccountsDrawerHeaderWidget(),    //  UserAccountsDrawerHeader 方式 创建的 header
        ListTile(
          title: Text("用户空间"),
          leading: CircleAvatar(child: Icon(Icons.people)),
          onTap: _onTap,
        ),
        Divider(),
        ListTile(
          title: Text("用户中心"),
          leading: CircleAvatar(child: Icon(Icons.home)),
          onTap: _onTap,
        ),
        Divider(),
        ListTile(
          title: Text("设置"),
          leading: CircleAvatar(child: Icon(Icons.settings)),
          onTap: _onTap,
        ),
        Divider(),
      ],
    ),
  );
}
```

**DrawerHeader 常用属性:**

| 属性       | 说明                             |
| ---------- | -------------------------------- |
| decoration | 设置顶部背景相关属性,背景颜色,等 |
| child      | 配置子元素                       |
| padding    | 内边距                           |
| margin     | 外边距                           |

**UserAccountsDrawerHeader 常用属性:**

| 属性                  | 说明                             |
| --------------------- | -------------------------------- |
| decoration            | 设置顶部背景相关属性,背景颜色,等 |
| accountName           | 账户名称                         |
| accountEmail          | 账户邮箱                         |
| currentAccountPicture | 用户头像                         |
| otherAccountPictures  | 用来设置当前用户的其他账户头像   |
| margin                | 外边距                           |

**UserAccountsDrawerHeader 使用:**
```dart
///  UserAccountsDrawerHeader  实现 固定布局的  header
class UserAccountsDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://www.itying.com/images/flutter/1.png"),
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage:
            NetworkImage("https://www.itying.com/images/flutter/3.png"),
        radius: 35.0,
      ),
      accountName: Text(
        "Tom",
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
      ),
      accountEmail: Text(
        "18614005205@163.com",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      ),
    );
  }
}
```

# Button 组件

Flutter中给我们预先定义好了一些按钮控件给我们用，常用的按钮如下

1. RaisedButton ：凸起的按钮，其实就是Android中的Material Design风格的Button ，继承自MaterialButton
2. FlatButton ：扁平化的按钮，继承自MaterialButton
3. OutlineButton ：带边框的按钮，继承自MaterialButton
4. IconButton ：图标按钮,继承自StatelessWidget

**Button常用属性:**

| 属性              | 值类型                           | 说明                                                         |
| ----------------- | -------------------------------- | ------------------------------------------------------------ |
| onPressed         | Void Callback ，一般接收一个方法 | 必填参数，按下按钮时触发的回调，接收一个方法，传null表示按钮禁用，会显示禁用相关样式 |
| child             | Widget                           | 按钮文字控件                                                 |
| textColor         | Color                            | 文本颜色                                                     |
| color             | Color                            | 按钮的背景颜色                                               |
| disabledColor     | Color                            | 按钮禁用时的颜色                                             |
| disabledTextColor | Color                            | 按钮禁用时文本的颜色                                         |
| splashColor       | Color                            | 按钮点击时水波纹的颜色                                       |
| highlightColor    | Color                            | 按钮长按后按钮的颜色                                         |
| elevation         | double                           | 阴影的范围，值越大阴影范围越大                               |
| padding           | EdgeInsetsGeometry               | 内边距                                                       |
| shape             | ShapeBorder                      | 按钮的形状                                                   |
| minWidth          | double                           | 按钮的最小宽度                                               |

## RaisedButton使用:

```dart
/// 添加图标
RaisedButton.icon(
  icon: Icon(Icons.people, color: Colors.white),
  label: Text("图标按钮"),
  textColor: Colors.white,
  color: Colors.blue,
  elevation: 10.0,
  onPressed: () {},
),
/// 正常使用
RaisedButton(
  child: Text(
    "阴影按钮",
    style: TextStyle(
      color: Colors.white,
    ),
  ),
  color: Colors.blue,
  elevation: 10.0,
  onPressed: _onPressed,
),
```

## FlatButton扁平按钮:

> FlatButton跟RaisedButton用法基本一致

```dart
FlatButton(
  child: Text("半圆按钮"),
  textColor: Colors.white,
  color: Colors.blue,
  onPressed: _onPressed,
  shape: StadiumBorder(),
),
```

## OutlineButton边线按钮:

> 注意，**OutlineButton** 是一个有默认边线且背景透明的按钮，也就是说我们设置颜色是无效的，其他属性跟MaterialButton中属性基本一致

**OutlineButton使用:**

```dart
OutlineButton(
  child: Text("带边框的按钮"),
  textColor: Colors.grey,
  onPressed: _onPressed,
  color: Colors.black,
  highlightedBorderColor: Colors.lightGreen,
  borderSide: BorderSide(   /// 通过这种方式来时设置 边线 颜色.
    color: Colors.amber,
    width: 2.0,
  ),
  shape: StadiumBorder(),  /// 半圆
),
```

## IconButton图标按钮:

> 一般用在 **AppBar # actions** 属性中

**IconButton使用:**

```dart
appBar: AppBar(
  title: Text("Button"),
  actions: <Widget>[
    IconButton(
      color: Colors.white,
      icon: Icon(Icons.accessible, color: Colors.white),
    )
  ],
),
```

##  FloatingActionButton悬浮按钮实现咸鱼发布效果

>**FloatingActionButton简称FAB ** ,可以实现浮动按钮,也可以实现类似咸鱼app的底部凸起按钮.

**常用属性:**

| 属性               | 说明                                                         |
| ------------------ | ------------------------------------------------------------ |
| child              | 子元素,一般为 **Icon** 不推荐使用文字                        |
| tooltip            | 长按时显示的提示                                             |
| foregroundColor    | 前景色，影响到文字颜色                                       |
| backgroundColor    | 背景色                                                       |
| heroTag            | hero效果使用的tag,系统默认会给所有FAB使用同一个tag,方便做动画效果 |
| elevation          | 未点击时阴影值                                               |
| highlightElevation | 点击下阴影值                                                 |
| mini               | FloatingActionButton有regular, mini, extended三种类型，默认为false即regular类型,true时按钮变小即mini类型，extended需要通过FloatingActionButton.extended()创建，可以定制显示内容 |
| shape              | 定义FAB的shape，设置shape时，默认的elevation将会失效,默认为CircleBorder |
| clipBehavior       | Clip.none                                                    |
| isExtended         | 是否为”extended”类型                                         |

 **使用**

```dart
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  /// 设置 FloatingActionButton 显示位置
floatingActionButton: getFloatButtonWidget(_currentIndex, _onPressed),    /// 设置 FloatingActionButton

/// 使用 Container 进行包裹 看起来像是外面有边距
return Container(
    height: 60.0,
    width: 60.0,
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white),
    margin: EdgeInsets.only(top: 8.0),
    child: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _onPressed,
      backgroundColor: _currentIndex == 2 ? Colors.yellow : Colors.yellow,
    ),
  );
```

# 表单

## TextField : 文本编辑框

> Flutter中的文本输入框 **TextField** 就类似于Android中的 **EditText** ，但是用起来比EditText方便很多，改变样式也更加的方便。下面我们来看一下TextField的构造方法

**常用的属性**

| 属性              | 说明                                                         |
| ----------------- | ------------------------------------------------------------ |
| controller        | 编辑框的控制器，跟文本框的交互一般都通过该属性完成，如果不创建的话默认会自动创建 |
| focusNode         | 用于管理焦点                                                 |
| decoration        | 输入框的装饰器，用来修改外观                                 |
| keyboardType      | 设置输入类型，不同的输入类型键盘不一样                       |
| textInputAction   | 用于控制键盘动作（一般位于右下角，默认是完成）               |
| style             | 输入的文本样式                                               |
| textAlign         | 输入的文本位置                                               |
| textDirection     | 输入的文字排列方向，一般不会修改这个属性                     |
| autofocus         | 是否自动获取焦点, 默认false                                  |
| obscureText       | 是否隐藏输入的文字，一般用在密码输入框中                     |
| autocorrect       | 是否自动校验                                                 |
| maxLines          | 最大行                                                       |
| maxLength         | 能输入的最大字符个数                                         |
| maxLengthEnforced | 配合maxLength一起使用，在达到最大长度时是否阻止输入          |
| onChanged         | 输入文本发生变化时的回调                                     |
| onEditingComplete | 点击键盘完成按钮时触发的回调，该回调没有参数，(){}           |
| onSubmitted       | 同样是点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String){} |
| inputFormatters   | 对输入文本的校验                                             |
| enabled           | 输入框是否可用                                               |
| cursorWidth       | 光标的宽度                                                   |
| cursorRadius      | 光标的圆角                                                   |
| cursorColor       | 光标的颜色                                                   |
| onTap             | 点击输入框时的回调(){}                                       |

> **TextField 中常用到的属性 decoration（装饰器）** 接收一个**InputDecoration**类型的值，主要用于控制TextField的外观以及提示信息等
> 我们来看看**InputDecoration**的构造方法

**InputDecoration 中属性:**

```dart
InputDecoration({
    this.icon,         //位于装饰器外部和输入框前面的图片
    this.labelText,    //用于描述输入框，例如这个输入框是用来输入用户名还是密码的，当输入框获取焦点时默认会浮动到上方，
    this.labelStyle,   // 控制labelText的样式,接收一个TextStyle类型的值
    this.helperText,   //辅助文本，位于输入框下方，如果errorText不为空的话，则helperText不会显示
    this.helperStyle,  //helperText的样式
    this.hintText,     //提示文本，位于输入框内部
    this.hintStyle,    //hintText的样式
    this.hintMaxLines, //提示信息最大行数
    this.errorText,    //错误信息提示
    this.errorStyle,   //errorText的样式
    this.errorMaxLines,//errorText最大行数
    this.hasFloatingPlaceholder = true,  //labelText是否浮动，默认为true，修改为false则labelText在输入框获取焦点时不会浮动且不显示
    this.isDense,      //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
    this.contentPadding, //内间距
    this.prefixIcon,   //位于输入框内部起始位置的图标。
    this.prefix,       //预先填充的Widget,跟prefixText同时只能出现一个
    this.prefixText,   //预填充的文本，例如手机号前面预先加上区号等
    this.prefixStyle,  //prefixText的样式
    this.suffixIcon,   //位于输入框后面的图片,例如一般输入框后面会有个眼睛，控制输入内容是否明文
    this.suffix,       //位于输入框尾部的控件，同样的不能和suffixText同时使用
    this.suffixText,   //位于尾部的填充文字
    this.suffixStyle,  //suffixText的样式
    this.counter,      //位于输入框右下方的小控件，不能和counterText同时使用
    this.counterText,  //位于右下方显示的文本，常用于显示输入的字符数量
    this.counterStyle, //counterText的样式
    this.filled,       //如果为true，则输入使用fillColor指定的颜色填充
    this.fillColor,    //相当于输入框的背景颜色
    this.errorBorder,  //errorText不为空，输入框没有焦点时要显示的边框
    this.focusedBorder, //输入框有焦点时的边框,如果errorText不为空的话，该属性无效
    this.focusedErrorBorder,  //errorText不为空时，输入框有焦点时的边框
    this.disabledBorder,  //输入框禁用时显示的边框，如果errorText不为空的话，该属性无效
    this.enabledBorder,  //输入框可用时显示的边框，如果errorText不为空的话，该属性无效
    this.border,        //正常情况下的border
    this.enabled = true,  //输入框是否可用
  })
```

**简单实用:**

```dart
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
          color: _nameIconColor,
          width: 1.5,
        ),
      ),
    ),
  ),
),

final nameController = TextEditingController();  /// 编辑框的控制器. 控制文本 交互.

nameFocusNode.addListener(() {
      /// 监听 TextField 焦点
      if (!nameFocusNode.hasFocus) {
        /// 失去焦点
        setState(() {
          if (nameController.text.isEmpty) {
            _errorText = "请输入正确用户名";
            _nameIconColor = Colors.redAccent;
          } else {
            _errorText = null;
            _nameIconColor = Colors.greenAccent;
          }
        });
      }
    });
}

 @override
 void dispose() {
    super.dispose();
    nameController.dispose();
  }
```

## CheckBox : 复选框

> **Flutter** 复选框 有两种：一 是精简版 **Checkbox** 复选框 ，二是自带标题和副标题 **CheckboxListTile** 复选框

**CheckBox 属性介绍**

| 属性                  | 说明                                                       |
| --------------------- | ---------------------------------------------------------- |
| value                 | 是否选中此复选框                                           |
| onChanged             | 监听 当复选框的值应该更改时调用                            |
| tristate              | 默认false，如果为true，复选框的值可以为true、false或null。 |
| activeColor           | 选中此复选框时要使用的颜色                                 |
| checkColor            | 选中此复选框时用于复选图标的颜色                           |
| materialTapTargetSize | 配置tap目标的最小大小                                      |

**CheckBox简单实用:**

```dart
Checkbox(value: this.flag, onChanged: _onChange),

var flag = false;   /// checkBox 状态
/// checkBox 状态改变方法
void _onChange(value) {
  setState(() {
    this.flag = value;
  });
}
```

**CheckboxListTile 属性介绍:**

| 属性            | 说明                                                        |
| --------------- | ----------------------------------------------------------- |
| value           | 是否选中此复选框                                            |
| onChanged       | 监听 当复选框的值应该更改时调用                             |
| activeColor     | 选中此复选框时要使用的颜色                                  |
| title           | 列表主标题                                                  |
| subtitle        | 列表副标题                                                  |
| isThreeLine     | 默认false                                                   |
| dense           | 此列表平铺是否是垂直密集列表的一部分                        |
| secondary       | 显示在复选框前面的小部件                                    |
| selected        | 选中后文字高亮，默认false                                   |
| controlAffinity | 控件相对于文本的位置，默认 ListTileControlAffinity.platform |

**CheckboxListTile 简单使用: **

```dart
CheckboxListTile(
  value: this.flag,
  onChanged: _onChange,
  activeColor: Colors.orange,
  checkColor: Colors.greenAccent,
  title: Text(
    "CheckboxListTile",
    style: TextStyle(color: this.flag ? Colors.orange : Colors.black),
  ),
  controlAffinity: ListTileControlAffinity.leading,
  subtitle: Text(
    "带标题的CheckBox",
    style: TextStyle(
        fontSize: 12.0,
        color: this.flag ? Colors.orange : Colors.grey),
  ),
  secondary: Icon(
    Icons.access_alarm,
    color: this.flag ? Colors.orange : Colors.grey,
    size: 20.0,
    textDirection: TextDirection.rtl,
  ),
),
```

## Radio RadioListTile 单选框

> **Radio** 是单选框，和 **CheckBox** 一样本身不包含状态，当 **groupValue = value** 时代表选中状态。

**Radio 常用属性**

| 属性               | 说明                                                       |
| ------------------ | ---------------------------------------------------------- |
| value 、groupValue | 一起控制是否为选中状态，当groupValue = value时代表选中状态 |
| onChanged          | 状态改变时的回调                                           |
| activeColor        | 激活状态下颜色                                             |

**使用:**

```dart
Text("男"),
Radio(value: 1, onChanged: _onChange, groupValue: this.sex),
Text("女"),
Radio(value: 2, onChanged: _onChange, groupValue: this.sex),
```

**RadioListTile 属性:**

| 属性               | 说明                                                       |
| ------------------ | ---------------------------------------------------------- |
| value 、groupValue | 一起控制是否为选中状态，当groupValue = value时代表选中状态 |
| onChanged          | 状态改变时的回调                                           |
| activeColor        | 激活状态下颜色                                             |
| title              | 一级标题                                                   |
| subtitle           | 二级标题.(副标题)                                          |
| secondary          | 配置图标或者图片                                           |

**使用:**

```dart
RadioListTile(
  value: 1,
  groupValue: this.sex,
  onChanged: _onChange,
  title: Text("RadioListTile"),
  subtitle: Text("二级标题"),
  selected: this.sex == 1,
  secondary: Icon(Icons.access_alarms),
),
RadioListTile(
  value: 2,
  groupValue: this.sex,
  onChanged: _onChange,
  title: Text("RadioListTile"),
  subtitle: Text("二级标题"),
  selected: this.sex == 2,
  secondary: Icon(Icons.access_alarms),
),
SizedBox(height: 30.0),
new Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[Text("RadioListTile 选中了 ${this.sex == 1 ? '第一条' : '第二条'} ")],
),
```

## Switch 开关

**属性**

| 属性                   | 说明                           |
| ---------------------- | ------------------------------ |
| **activeColor**        | 激活时原点的颜色。             |
| **activeThumbImage**   | 原点还支持图片，激活时的效果。 |
| **activeTrackColor**   | 激活时横条的颜色。             |
| **inactiveThumbColor** | 非激活时原点的颜色。           |
| **inactiveThumbImage** | 非激活原点的图片效果。         |
| **inactiveTrackColor** | 非激活时横条的颜色。           |
| **onChanged**          | 改变时触发                     |
| **value**              | 切换按钮的值。                 |

**基本使用:**

```dart
Switch(
  value: _flag,
  onChanged: (v) {
    setState(() {
      this._flag = v;
    });
  },
),

Switch(
  value: _flag,
  inactiveThumbColor: Colors.red,        /// 非激活时原点的颜色。
  activeColor: Colors.green,						 /// 激活时原点的颜色。
  activeTrackColor: Colors.cyanAccent,   /// 激活时横条的颜色。
  inactiveTrackColor: Colors.amber,      /// 非激活时横条的颜色
  onChanged: (v) {
    setState(() {
      this._flag = v;
    });
  },
),
```

# 日期选择/时间选择

```dart
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


/// 将字符串时间转换为 DateTime 对象.
DateTime.parse("2020-06-30")
/// 创建指定时间的 DateTime 对象
new DateTime(1945, 9, 9)

DateTime time = new DateTime.now();
DateTime last = new DateTime.now();
/// 时间比较
time.compareTo(last)
/// 是否在之后
time.isAfter(last)
/// 是否在之前
time.isBefore(last)
```

## formatDate : 日期格式化 库

```dart
date_format: ^1.0.8  ///  添加依赖.

print(formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));      /// 1989-02-21
print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));   /// 15:40:10 CST
print(formatDate(DateTime(1989, 02, 1, 5), [am]));    /// AM
print(formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', DD]));   /// 18-Jan-Sunday
print(formatDate(DateTime(1989, 02, 1, 15, 40, 10),[hh, ':', nn, ':', ss, ' ', am]));   /// 03:40:10 PM


```

## 开源日期选择库 : Flutter Cupertino Date Picker

```dart
/// 显示BottomSheet形式的日期时间选择器。
///
/// context: [BuildContext]
/// minDateTime: [DateTime] 日期选择器的最小值
/// maxDateTime: [DateTime] 日期选择器的最大值
/// initialDateTime: [DateTime] 日期选择器的初始值
/// dateFormat: [String] 日期时间格式化
/// locale: [DateTimePickerLocale] 国际化，语言地区
/// pickerMode: [DateTimePickerMode] 显示的类型: date(日期选择器)、time(时间选择器)、datetime(日期时间选择器)
/// pickerTheme: [DateTimePickerTheme] 日期选择器的样式
/// onCancel: [DateVoidCallback] 点击标题取消按钮的回调事件
/// onClose: [DateVoidCallback] 关闭日期时间选择器的回调事件
/// onChange: [DateValueCallback] 选择的日期时间改变的事件
/// onConfirm: [DateValueCallback] 点击标题确定按钮的回调事件

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
```

# InkWell:水波纹组件 & Ink:装饰组件

	> 件在用户点击时出现“水波纹”效果

**使用:**

```dart
InkWell(
  onTap: () {},  /// 如果不设置 这个方法 , 则无法出现水波纹效果.
  borderRadius: BorderRadius.all(Radius.circular(30.0)),
  child: Container(
    padding: EdgeInsets.symmetric(
        vertical: 8.0, horizontal: 20.0),
    child: Text('这是InkWell点击效果',style: TextStyle(color: Colors.white),),
  ),
),

/// 如果设置边框圆角的情况下,则水波纹 会超出边框范围
/// 这时候就需要结合 Ink 组件一起使用.
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

```

# flutter_swiper : 开源轮播图组件

https://github.com/best-flutter/flutter_swiper

**使用:**

```dart
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
```

# Dialog : 弹框

## AlertDialog  : 基础弹框

```dart
/// AlertDialog
/// 异步执行,把结果赋值给 result 变量
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
        ],
      );
    },
  );
  print("-----" + result);
}
```

## SimpleDialog : 多选弹框

```dart
/// SimpleDialog
/// 异步执行,把结果赋值给 result 变量
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
        ],
      );
    },
  );
  print("-----" + result);
}
```

## showModalBottomSheet : 底部弹出弹框

```dart
/// 底部弹出对话框
/// 异步执行,把结果赋值给 result 变量
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
              .....
            ],
          ),
        ),
      );
    },
  );
  print("-----"+result);
}
```

## CupertinoAlertDialog :  IOS 风格的的弹框

```dart
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
```

# Dio 网络请求库

**get 请求**

```dart
/// 通过get请求获取服务器中的数据
void _getData() async {
  Response result = await Dio().get(apiUrl);
  setState(() {
    this._result = result.data;
  });
}

/// 获取数据并渲染数据
/// 转化为 JSON
void _decodeData() async {
  Response result = await new Dio().get(apiUrl);
  setState(() {
    _result = "";
    this._list = json.decode(result.data)["result"];
  });
}

/// 数据渲染
this._list.length > 0
  ? Container(
  height: 300.0,
  child: ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(this._list[index]["username"]),
        subtitle: Text(this._list[index]["title"]),
      );
    },
  ),
): Text("加载中。。。。。")
```