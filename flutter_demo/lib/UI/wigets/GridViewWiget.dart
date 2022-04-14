import 'package:flutter/material.dart';

class GridviewWiget extends StatefulWidget {
  const GridviewWiget({Key? key, required this.titleStr}) : super(key: key);
  final String titleStr;
  @override
  _GridviewwigetState createState() => _GridviewwigetState();
}

class _GridviewwigetState extends State<GridviewWiget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleStr),
      ),
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            /** 横向3个widge */
            crossAxisCount: 3,
            /** 子widge 宽高比例为1 */
            childAspectRatio: 1.0,
          ),
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
            Icon(Icons.boy),
            Icon(Icons.girl_outlined),
          ],
        ),
      ),
    );
  }
}
