import 'package:flutter/material.dart';
import 'package:flutter_demo/UITools/UITools.dart';

class Homemainpage extends StatefulWidget {
  const Homemainpage({Key? key}) : super(key: key);

  @override
  _HomemainpageState createState() => _HomemainpageState();
}

class _HomemainpageState extends State<Homemainpage> {
  @override
  Widget build(BuildContext context) {
    /** 举个🌰, 后续自己修改实现对应 Container */
    return getDefaultWiget('首页', 20.0, Colors.orange);
  }
}
