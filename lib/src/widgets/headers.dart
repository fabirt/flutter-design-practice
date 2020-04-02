import 'package:flutter/material.dart';

///* Conventional rectangular header.
class RectHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: const Color(0xFF615AAB),
    );
  }
}

///* Container with rounded borders at the bottom.
class RoundedRectHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: const BoxDecoration(
        color: Color(0xFF615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
        ),
      ),
    );
  }
}

///* Header with diagonal rect.
class DiagonalRectHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _DiagonalRectHeaderPainter(),
      ),
    );
  }
}

class _DiagonalRectHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();

    paint.color = const Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    path.moveTo(0.0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_DiagonalRectHeaderPainter oldDelegate) => true;
}

///* Header with triangle shape.
class TriangularHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _TriangularHeaderPainter(),
      ),
    );
  }
}

class _TriangularHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();

    paint.color = const Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TriangularHeaderPainter oldDelegate) => true;
}

///* Header with a peak at the middle.
class PeakHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _PeakHeaderPainter(),
      ),
    );
  }
}

class _PeakHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();

    paint.color = const Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    path.lineTo(0.0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0.0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_PeakHeaderPainter oldDelegate) => true;
}

///* Header with bezier curve.
class CurveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CurveHeaderPainter(),
      ),
    );
  }
}

class _CurveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();

    paint.color = const Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    path.lineTo(0.0, size.height * 0.20);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.50,
      size.width,
      size.height * 0.20,
    );
    path.lineTo(size.width, 0.0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CurveHeaderPainter oldDelegate) => true;
}

///* Header with a sin wvae shape.
class WavyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WavyHeaderPainter(),
      ),
    );
  }
}

class _WavyHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();

    paint.color = const Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    path.lineTo(0.0, size.height * 0.30);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.40,
      size.width * 0.5,
      size.height * 0.30,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.20,
      size.width,
      size.height * 0.30,
    );
    path.lineTo(size.width, 0.0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_WavyHeaderPainter oldDelegate) => true;
}
