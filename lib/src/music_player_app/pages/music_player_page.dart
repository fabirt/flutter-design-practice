import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:flutter_design_practice/src/music_player_app/models/music_player_model.dart';
import 'package:flutter_design_practice/src/music_player_app/theme/theme.dart';
import 'package:flutter_design_practice/src/music_player_app/widgets/widgets.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: musicPlayerTheme,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: ChangeNotifierProvider<MusicPlayerModel>(
            create: (_) => MusicPlayerModel(),
            child: Stack(
              children: <Widget>[
                BackgroundGradient(),
                Column(
                  children: <Widget>[
                    CustomAppBar(),
                    _DiscPlayer(),
                    PlayerTitle(),
                    Expanded(
                      child: LyricsView(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DiscPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          DiscImage(),
          PlayerProgress(),
        ],
      ),
    );
  }
}
