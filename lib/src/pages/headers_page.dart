import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/widgets/headers.dart';

/// In this page we used [CustomPaint] to build
/// different headers with custom shapes.
class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header;
    // header = RectHeader();
    // header = DiagonalRectHeader();
    // header = TriangularHeader();
    // header = PeakHeader();
    // header = CurveHeader();
    header = WavyHeader();
    return Scaffold(
      body: header,
    );
  }
}
