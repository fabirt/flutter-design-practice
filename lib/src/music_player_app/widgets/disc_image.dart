import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_design_practice/src/music_player_app/models/music_player_model.dart';

class DiscImage extends StatefulWidget {
  @override
  _DiscImageState createState() => _DiscImageState();
}

class _DiscImageState extends State<DiscImage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _rotation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final playerModel = Provider.of<MusicPlayerModel>(context);
    if (playerModel.isPlaying) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _rotation.value,
          child: child,
        );
      },
      child: _DiscImageBuilder(),
    );
  }
}

class _DiscImageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 250.0,
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xFF484750),
              Color(0xFF1E1C24),
            ],
          ),
        ),
        child: ClipOval(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              const Image(
                height: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpg'),
              ),
              Container(
                width: 25.0,
                height: 25.0,
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 18.0,
                height: 18.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF1C1C25),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
