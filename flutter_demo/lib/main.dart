import 'package:flutter/material.dart';
import 'package:flutter_demo/navigator/tab_navigator.dart';
import 'package:flutter_demo/pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '旭东 Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "Home_Page",
      routes: {
        "Home_Page": (context) => TabNavigator(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
