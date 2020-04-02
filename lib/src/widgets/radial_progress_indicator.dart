import 'dart:math' as math;

import 'package:flutter/material.dart';

class RadialProgressIndicator extends StatefulWidget {
  /// [value] goes from `0.0` to `1.0`.
  final double value;
  final Color valueColor;
  final Color backgroundColor;

  const RadialProgressIndicator({
    Key key,
    this.value = 0.0,
    this.valueColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _RadialProgressIndicatorState createState() =>
      _RadialProgressIndicatorState();
}

class _RadialProgressIndicatorState extends State<RadialProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static const _duration = Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );

    if (widget.value > 0.0 && widget.value <= 1.0) {
      _controller.animateTo(
        widget.value,
        curve: Curves.easeOut,
        duration: _duration,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(RadialProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value <= 1.0 && widget.value >= 0.0) {
        _controller.animateTo(
          widget.value,
          curve: Curves.easeOut,
          duration: _duration,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final valueColor = widget.valueColor ?? theme.accentColor;
    final backgroundColor = widget.backgroundColor ?? theme.disabledColor;

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          final progress = _controller.value;
          return CustomPaint(
            painter: _RadialProgressPainter(
              progress,
              valueColor: valueColor,
              backgroundColor: backgroundColor,
            ),
          );
        },
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double progress;
  final Color valueColor;
  final Color backgroundColor;

  _RadialProgressPainter(
    this.progress, {
    @required this.valueColor,
    @required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Background circle
    final circlePaint = Paint()
      ..strokeWidth = 4.0
      ..color = backgroundColor
      ..style = PaintingStyle.stroke;

    final width = size.width / 2;
    final height = size.height / 2;

    final center = Offset(width, height);
    final radius = math.min(width, height);

    canvas.drawCircle(center, radius, circlePaint);

    // Progress arc
    final arcPaint = Paint()
      ..strokeWidth = 10.0
      ..color = valueColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final angle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      angle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(_RadialProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
