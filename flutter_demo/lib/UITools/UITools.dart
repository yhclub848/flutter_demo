import 'package:flutter/material.dart';

Scaffold getDefaultWiget(String kTitle, double fontSizeNum, Color titleColor) {
  print(123);
  return Scaffold(
    body: Center(
      child: Text(
        kTitle,
        style: TextStyle(
          fontSize: fontSizeNum,
          color: titleColor,
        ),
      ),
    ),
  );
}
