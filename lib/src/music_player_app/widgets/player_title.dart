import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter_design_practice/src/music_player_app/models/music_player_model.dart';

class PlayerTitle extends StatefulWidget {
  @override
  _PlayerTitleState createState() => _PlayerTitleState();
}

class _PlayerTitleState extends State<PlayerTitle>
    with SingleTickerProviderStateMixin {
  bool _shouldOpenAudio;
  AnimationController _playController;
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _shouldOpenAudio = true;
    _playController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _playController.dispose();
    super.dispose();
  }

  void _openAudio() {
    final playerModel = Provider.of<MusicPlayerModel>(context, listen: false);
    _assetsAudioPlayer.open('assets/audio/music.mp3');

    _assetsAudioPlayer.currentPosition.listen((Duration duration) {
      playerModel.current = duration;
    });

    _assetsAudioPlayer.current.listen((data) {
      playerModel.songDuration = data.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerModel = Provider.of<MusicPlayerModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Far Away',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white70,
                ),
              ),
              Text(
                '- Breaking Benjamin -',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            splashColor: Colors.transparent,
            backgroundColor: const Color(0xFFF8CB51),
            onPressed: () {
              if (_playController.isCompleted) {
                _playController.reverse();
                playerModel.isPlaying = false;
              } else {
                _playController.forward();
                playerModel.isPlaying = true;
              }

              if (_shouldOpenAudio) {
                _openAudio();
                _shouldOpenAudio = false;
              } else {
                _assetsAudioPlayer.playOrPause();
              }
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _playController,
            ),
          )
        ],
      ),
    );
  }
}
