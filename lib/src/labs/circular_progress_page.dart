import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _currentProgress = 0.0;
  double _nextProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _controller.addListener(() {
      setState(() {
        _currentProgress = lerpDouble(
          _currentProgress,
          _nextProgress,
          _controller.value,
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          child: CustomPaint(
            painter: _RadialProgressPainter(_currentProgress),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _currentProgress = _nextProgress;
          _nextProgress += 10.0;
          if (_nextProgress > 100) {
            _nextProgress = 0.0;
          }
          _controller.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double progress;

  _RadialProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // Background circle
    final circlePaint = Paint()
      ..strokeWidth = 4.0
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final width = size.width / 2;
    final height = size.height / 2;

    final center = Offset(width, height);
    final radius = math.min(width, height);

    canvas.drawCircle(center, radius, circlePaint);

    // Progress arc
    final arcPaint = Paint()
      ..strokeWidth = 10.0
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    final angle = 2 * math.pi * (progress / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      angle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(_RadialProgressPainter oldDelegate) => true;
}
