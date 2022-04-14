import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TestFlowDelegate.dart';

class FlexLayoutTestRoute extends StatefulWidget {
  const FlexLayoutTestRoute({Key? key, required this.titleStr})
      : super(key: key);
  final String titleStr;

  @override
  _FlexLayoutTestRoute createState() => _FlexLayoutTestRoute();
}

class _FlexLayoutTestRoute extends State<FlexLayoutTestRoute> {
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
        style: TextStyle(fontSize: 16.3),
      )),
      body: Column(
        children: [
          //Flex的两个子widget按1：2来占据水平空间
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.center, //沿主轴方向居中
            children: <Widget>[
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('A')),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('M')),
                label: Text('Lafayette'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('H')),
                label: Text('Mulligan'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('J')),
                label: Text('Laurens'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('Z')),
                label: Text('Zone'),
              ),
            ],
          ),
          //我们对六个色块进行自定义流式布局：
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.red,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.green,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.blue,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.yellow,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.brown,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
