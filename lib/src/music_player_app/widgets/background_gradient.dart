import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.76,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.0)),
        gradient: LinearGradient(
          stops: <double>[0.0, 0.6],
          colors: <Color>[
            Color(0xFF33333E),
            Color(0xFF201E28),
          ],
        ),
      ),
    );
  }
}
