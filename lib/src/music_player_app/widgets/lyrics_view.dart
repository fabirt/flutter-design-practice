import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/music_player_app/helpers/helpers.dart';

class LyricsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return ListWheelScrollView(
      itemExtent: 42.0,
      diameterRatio: 1.5,
      physics: const BouncingScrollPhysics(),
      children: lyrics.map((line) {
        return Text(
          line,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white70,
          ),
        );
      }).toList(),
    );
  }
}
