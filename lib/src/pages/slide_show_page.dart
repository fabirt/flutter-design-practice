import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/widgets/slide_show.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slideshow'),),
      body: Column(
        children: const <Widget>[
          Expanded(child: _CustomSlideShow()),
          Expanded(child: _CustomSlideShow()),
        ],
      ),
    );
  }
}

class _CustomSlideShow extends StatelessWidget {
  const _CustomSlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      indicatorPosition: IndicatorPosition.bottom,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
      ],
    );
  }
}
