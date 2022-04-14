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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            /** 横向3个widge */
            crossAxisCount: 3,
            /** 子widge 宽高比例为1 */
            childAspectRatio: 1.0,
          ),
          children: const [
            Icon(
              Icons.ac_unit,
              color: Colors.green,
            ),
            Icon(
              Icons.airport_shuttle,
              color: Colors.purple,
            ),
            Icon(
              Icons.all_inclusive,
              color: Colors.pink,
            ),
            Icon(
              Icons.beach_access,
              color: Colors.orange,
            ),
            Icon(
              Icons.cake,
              color: Colors.blueGrey,
            ),
            Icon(
              Icons.free_breakfast,
              color: Colors.limeAccent,
            ),
            Icon(
              Icons.boy,
              color: Colors.blue,
            ),
            Icon(
              Icons.girl_outlined,
              color: Colors.brown,
            ),
          ],
        ),
      ),
    );
  }
}
