import 'package:flutter/material.dart';

Scaffold getDefaultWiget(String kTitle, double fontSizeNum, Color titleColor) {
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
