import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  const ScrollNotificationTestRoute({Key? key, required this.titleStr})
      : super(key: key);
  final String titleStr;

  @override
  _ScrollNotificationTestRouteState createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //浮动按钮
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
          title: Text(
        widget.titleStr,
        style: TextStyle(fontSize: 14.0),
      )),
      body: Scrollbar(
        //进度条
        // 监听滚动通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return false;
            //return true; //放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder: (context, index) {
                    if (index % 5 == 0) {
                      return ListTile(
                        title: Text(
                          "旭东天下第一$index",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                              height: 1.2,
                              fontFamily: "Courier",
                              background: Paint()..color = Colors.yellow,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dashed),
                        ),
                      );
                    } else {
                      return ListTile(
                        title: Text("旭东天下第一$index"),
                      );
                    }
                  }),
              CircleAvatar(
                //显示进度百分比
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
