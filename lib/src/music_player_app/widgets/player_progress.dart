import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_design_practice/src/music_player_app/models/music_player_model.dart';

class PlayerProgress extends StatelessWidget {
  static const _maxHeight = 230.0;

  @override
  Widget build(BuildContext context) {
    final playerModel = Provider.of<MusicPlayerModel>(context);
    final progress = _maxHeight * playerModel.progress;
    return Column(
      children: <Widget>[
        Text(playerModel.totalDuration, style: TextStyle(color: Colors.white38)),
        const SizedBox(height: 8.0),
        Stack(
          children: <Widget>[
            Container(
              width: 3.0,
              height: _maxHeight,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(3.0),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: 3.0,
                height: progress,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(playerModel.currentDuration, style: TextStyle(color: Colors.white38)),
      ],
    );
  }
}
