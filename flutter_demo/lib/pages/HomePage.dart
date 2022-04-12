import 'package:flutter/material.dart';
import 'package:flutter_demo/UITools/UITools.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    /** 举个🌰, 后续自己修改实现对应 Container */
    return getDefaultWiget('首页', 20.0, Colors.orange);
  }
}
