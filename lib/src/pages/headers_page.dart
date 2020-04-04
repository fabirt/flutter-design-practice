import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/widgets/headers.dart';

/// In this page we used [CustomPaint] to build
/// different headers with custom shapes.
class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = theme.accentColor;
    // header = RectHeader();
    // header = DiagonalRectHeader();
    // header = TriangularHeader();
    // header = PeakHeader();
    // header = CurveHeader();
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              RectHeader(
                backgroundColor: accentColor,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              RoundedRectHeader(
                backgroundColor: accentColor,
              ),
            ],
          ),
          DiagonalRectHeader(
            backgroundColor: accentColor,
          ),
          TriangularHeader(
            backgroundColor: accentColor,
          ),
          PeakHeader(
            backgroundColor: accentColor,
          ),
          CurveHeader(
            backgroundColor: accentColor,
          ),
          WavyHeader(
            backgroundColor: accentColor,
          ),
        ],
      ),
    );
  }
}
