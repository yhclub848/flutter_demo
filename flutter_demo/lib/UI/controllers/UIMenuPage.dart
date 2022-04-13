import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/UI/progressIndicatorPage.dart';

class Uimenupage extends StatefulWidget {
  const Uimenupage({Key? key, required this.titleStr}) : super(key: key);
  final String titleStr;
  @override
  _UimenupageState createState() => _UimenupageState();
}

class _UimenupageState extends State<Uimenupage> {
  final double itemFontSize = 20.5;
  //下划线widget预定义以供复用。
  Widget dividerLine = Divider(
    color: Colors.grey,
    height: .0,
  );
  static const loadingTag = "------loading------";
  var _words = <String>[
    "ProgressIndicator",
    "ListView",
    "AnimatedList",
    "GirdView",
    "PageView与页面缓存",
    "TabBarView",
    "CustomScrollView 和 Slivers",
    "嵌套可滚动组件 NestedScrollView",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titleStr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: _words.length,
          // itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            //显示单词列表项
            // return ListTile(title: Text(_words[index]));
            return getItem(index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return dividerLine;
          },
        ),
      ),
    );
  }

  Widget getItem(int index) {
    return GestureDetector(
      child: Container(
        height: 40.0,
        child: Text(_words[index]),
      ),
      /** item点击事件 */
      onTap: () {
        print('点击到第$index个位置');
        setState(() {
          onItemClick(index);
        });
      },
    );
  }

  void onItemClick(int index) {
    /** 测试点击 */
    // showCustomDialog(context, index);
    String targetStr = _words[index];
    /** Push到对应控制器 */
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        if (targetStr == 'progressIndicator') {
          return Progressindicatorpage(titleStr: targetStr);
        } else if (targetStr == 'ListView') {
          return Uimenupage(titleStr: targetStr);
        } else {
          return Progressindicatorpage(titleStr: targetStr);
        }
      }),
    );
  }

  /** 安卓样式的toast */
  void showCustomDialog(BuildContext context, int position) {
    print("position---->$position");

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("点击提示"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("点击了第$position条数据"),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("取消"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("确认"),
              )
            ],
          );
        });
  }
}