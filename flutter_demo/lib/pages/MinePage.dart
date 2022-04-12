import 'package:flutter/material.dart';
import 'package:flutter_demo/UITools/UITools.dart';

class Minepage extends StatefulWidget {
  const Minepage({Key? key}) : super(key: key);

  @override
  _MinepageState createState() => _MinepageState();
}

class _MinepageState extends State<Minepage> {
  @override
  Widget build(BuildContext context) {
    /** 举个🌰, 后续自己修改实现对应 Container */
    return getDefaultWiget('我的', 20.0, Colors.purple);
  }
}
