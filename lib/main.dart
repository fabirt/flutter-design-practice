import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/pages/emergency_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter design pratice',
      home: EmergencyPage(),
    );
  }
}
