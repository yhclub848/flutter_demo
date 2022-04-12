import 'package:flutter/material.dart';
import 'package:flutter_demo/UITools/UITools.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    /** 举个🌰, 后续自己修改实现对应 Container */
    return getDefaultWiget('搜索', 20.0, Colors.green);
  }
}
