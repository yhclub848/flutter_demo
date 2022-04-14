import 'package:flutter/material.dart';

class Progressindicatorpage extends StatefulWidget {
  const Progressindicatorpage({Key? key, required this.titleStr})
      : super(key: key);

  final String titleStr;

  @override
  _ProgressindicatorpageState createState() => _ProgressindicatorpageState();
}

class _ProgressindicatorpageState extends State<Progressindicatorpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleStr),
      ),
      body: Column(
        children: [
          //模糊进度条 会执行一个动画
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          //进度条显示50%
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),

          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          )
        ],
      ),
    );
  }
}
