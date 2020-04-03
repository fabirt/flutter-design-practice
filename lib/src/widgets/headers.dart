import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class EmergencyHeader extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;

  final _textColor = Colors.white.withOpacity(0.7);

  EmergencyHeader({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const _EmergencyHeaderComtainer(),
        Positioned(
          top: -50.0,
          left: -50.0,
          child: FaIcon(
            icon,
            size: 200,
            color: Colors.white12,
          ),
        ),
        Column(
          children: <Widget>[
            const SizedBox(
              height: 60.0,
              width: double.infinity,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20.0, color: _textColor),
            ),
            const SizedBox(height: 10.0),
            Text(
              subtitle,
              style: TextStyle(
                color: _textColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            FaIcon(
              icon,
              size: 80.0,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _EmergencyHeaderComtainer extends StatelessWidget {
  const _EmergencyHeaderComtainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(90.0),
        ),
        gradient: LinearGradient(
          colors: const <Color>[
            Color(0xFF526BF6),
            Color(0xFF67ACF2),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
