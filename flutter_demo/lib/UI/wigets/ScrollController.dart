// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';

/**
 * 
 * ScrollController构造函数如下：

  ScrollController({
    double initialScrollOffset = 0.0, //初始滚动位置
    this.keepScrollOffset = true,//是否保存滚动位置
    ...
  })
  我们介绍一下ScrollController常用的属性和方法：

  offset：可滚动组件当前的滚动位置。
  jumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，它们不同之处在于，后者在跳转时会执行一个动画，而前者不会。
  ScrollController还有一些属性和方法，我们将在后面原理部分解释。

  #滚动监听
  ScrollController间接继承自Listenable，我们可以根据ScrollController来监听滚动事件，如：

  controller.addListener(()=>print(controller.offset))
 */

class ScrollcontrollerTestRute extends StatefulWidget {
  const ScrollcontrollerTestRute({Key? key, required this.titleStr})
      : super(key: key);

  final String titleStr;

  @override
  _ScrollcontrollerState createState() => _ScrollcontrollerState();
}

class _ScrollcontrollerState extends State<ScrollcontrollerTestRute> {
  final ScrollController _controller = ScrollController();
  bool showToTopBtn = false; //是否显示回到顶部按钮
  String _progress = "0%";
  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置

      if (_controller.offset > 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset > 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    //为避免内存泄漏，需要调用_controller.dispose()
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleStr),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemExtent: 50,
        controller: _controller,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("--->$index"),
          );
        },
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              },
            ),
    );
  }
}
