import 'package:flutter/material.dart';
import 'package:flutter_demo/UITools/UITools.dart';

class Discoverpage extends StatefulWidget {
  const Discoverpage({Key? key}) : super(key: key);

  @override
  _DiscoverpageState createState() => _DiscoverpageState();
}

class _DiscoverpageState extends State<Discoverpage> {
  @override
  Widget build(BuildContext context) {
    /** 举个🌰, 后续自己修改实现对应 Container */
    return getDefaultWiget('发现', 20.0, Colors.blue);
  }
}
