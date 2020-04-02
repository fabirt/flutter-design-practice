import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter design pratice',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter design pratice'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
