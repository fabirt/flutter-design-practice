import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/widgets/radial_progress_indicator.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated CustomPaint'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            RadialProgressIndicator(
              value: random.nextDouble(),
              valueColor: Colors.pink,
            ),
            RadialProgressIndicator(
              value: random.nextDouble(),
              valueColor: Colors.purple,
            ),
            RadialProgressIndicator(
              value: random.nextDouble(),
              valueColor: Colors.blue,
            ),
            RadialProgressIndicator(
              value: random.nextDouble(),
              valueColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
