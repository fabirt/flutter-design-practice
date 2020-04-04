import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations')),
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            AnimatedRectangle(),
            AnimatedCicleRectangle(),
          ],
        ),
      ),
    );
  }
}

class AnimatedRectangle extends StatefulWidget {
  @override
  _AnimatedRectangleState createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _rotation;
  Animation<double> _opacity;
  Animation<double> _opacityOut;
  Animation<Offset> _offset;
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    _rotation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.25, curve: Curves.easeOut),
    ));

    _opacityOut = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.75, 1.0, curve: Curves.easeOut),
    ));

    _offset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(250.0, math.pi),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _scale = Tween<double>(
      begin: 0.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // _controller.addListener(() {
    //   if (_controller.status == AnimationStatus.completed) {
    //     _controller.reverse();
    //   } else if (_controller.status == AnimationStatus.dismissed) {
    //     _controller.forward();
    //   }
    // });

    _controller.repeat(reverse: true);
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
        return Transform.translate(
          offset: Offset(
            _offset.value.dx,
            math.sin(_offset.value.dy) * 300,
          ),
          child: Transform.rotate(
            angle: _rotation.value,
            child: Opacity(
              opacity: _opacity.value - _opacityOut.value,
              child: Transform.scale(
                scale: _scale.value,
                child: child,
              ),
            ),
          ),
        );
      },
      child: _Rectangle(),
    );
  }
}

class AnimatedCicleRectangle extends StatefulWidget {
  @override
  _AnimatedCicleRectangleState createState() => _AnimatedCicleRectangleState();
}

class _AnimatedCicleRectangleState extends State<AnimatedCicleRectangle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _translationRight;
  Animation<double> _translationLeft;
  Animation<double> _translationUp;
  Animation<double> _translationDown;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    _translationRight = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.25, curve: Curves.bounceOut),
    ));
    
    _translationUp = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.25, 0.5, curve: Curves.bounceOut),
    ));

    _translationLeft = Tween<double>(
      begin: 0.0,
      end: -1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 0.75, curve: Curves.bounceOut),
    ));
    
    _translationDown = Tween<double>(
      begin: 0.0,
      end: -1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
    ));

    _controller.repeat();
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
        return Align(
          alignment: FractionalOffset(
            _translationRight.value + _translationLeft.value,
            _translationUp.value + _translationDown.value,
          ),
          child: child,
        );
      },
      child: _Rectangle(),
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
