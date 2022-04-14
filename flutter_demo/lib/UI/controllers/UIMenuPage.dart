import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/UI/wigets/GridViewWiget.dart';
import 'package:flutter_demo/UI/wigets/ScrollController.dart';
import 'package:flutter_demo/UI/wigets/progressIndicatorPage.dart';

import '../wigets/FlexLayoutTestRoute.dart';

class Uimenupage extends StatefulWidget {
  const Uimenupage({Key? key, required this.titleStr}) : super(key: key);
  final String titleStr;

  @override
  _UimenupageState createState() => _UimenupageState();
}

class _UimenupageState extends State<Uimenupage> {
  final double itemFontSize = 20.5;

  //下划线widget预定义以供复用。
  Widget dividerLine = const Divider(
    color: Colors.grey,
    height: .0,
  );
  final loadingTag = "------loading------";

  final _words = <String>[
    "ProgressIndicator",
    "ListView",
    "ScrollController",
    "GridviewWiget",
    "弹性布局（Flex）& 流式布局",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titleStr,
          style: const TextStyle(
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
        // child: Text(_words[index]),
        child: ListTile(title: Text(_words[index])),
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
    /** 测试点击 非本页面重点*/
    // showCustomDialog(context, index);
    String targetStr = _words[index];
    /** Push到对应控制器 */
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        if (targetStr == 'progressIndicator') {
          return Progressindicatorpage(titleStr: targetStr);
        } else if (targetStr == 'ListView') {
          return Uimenupage(titleStr: targetStr);
        } else if (targetStr == 'ScrollController') {
          return ScrollcontrollerTestRute(titleStr: targetStr);
        } else if (targetStr == 'GridviewWiget') {
          return GridviewWiget(titleStr: targetStr);
        } else if (targetStr == '弹性布局（Flex）& 流式布局') {
          return FlexLayoutTestRoute(titleStr: targetStr);
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
