import 'package:flutter/material.dart';

class Progressindicator extends StatefulWidget {
  const Progressindicator({Key? key}) : super(key: key);

  @override
  _ProgressindicatorState createState() => _ProgressindicatorState();
}

class _ProgressindicatorState extends State<Progressindicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
