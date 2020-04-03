import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/models/slider_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// 00BFA6

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<SliderModel>(
          create: (_) => SliderModel(),
          child: Column(
            children: <Widget>[
              Expanded(
                child: _Slides(),
              ),
              _DotsIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final _controller = PageController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final provider = Provider.of<SliderModel>(context, listen: false);
      provider.currentPage = _controller.page;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: const <Widget>[
        _Slide('assets/svg/slide-1.svg'),
        _Slide('assets/svg/slide-2.svg'),
        _Slide('assets/svg/slide-3.svg'),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String asset;
  const _Slide(
    this.asset, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SvgPicture.asset(asset),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    final color = (pageViewIndex.round() == index)
        ? Theme.of(context).accentColor
        : Theme.of(context).disabledColor;
    return AnimatedContainer(
      width: 10.0,
      height: 10.0,
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
