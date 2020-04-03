import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum IndicatorPosition { top, bottom }

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final IndicatorPosition indicatorPosition;
  final Color activeColor;
  final Color inactiveColor;
  final double activeSize;
  final double inactiveSize;

  const SlideShow({
    Key key,
    @required this.slides,
    this.indicatorPosition = IndicatorPosition.bottom,
    this.activeColor,
    this.activeSize,
    this.inactiveColor,
    this.inactiveSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (indicatorPosition == IndicatorPosition.bottom) {
      children.addAll([
        _buildSlides(context),
        _buildDots(context),
      ]);
    } else {
      children.addAll([
        _buildDots(context),
        _buildSlides(context),
      ]);
    }
    return ChangeNotifierProvider<_SlideShowModel>(
      create: (_) => _SlideShowModel(
        activeColor: activeColor,
        activeSize: activeSize,
        inactiveColor: inactiveColor,
        inactiveSize: inactiveSize,
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildSlides(BuildContext context) {
    return Expanded(
      child: _Slides(slides),
    );
  }

  Widget _buildDots(BuildContext context) {
    return _DotsIndicator(
      length: slides.length,
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final _controller = PageController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final provider = Provider.of<_SlideShowModel>(context, listen: false);
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
      children: widget.slides.map((child) {
        return _Slide(child: child);
      }).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget child;
  const _Slide({
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: child,
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int length;

  const _DotsIndicator({
    Key key,
    @required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (int i) => _Dot(i)),
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
    final theme = Theme.of(context);
    final slideShow = Provider.of<_SlideShowModel>(context);
    final isCurrentPage = slideShow.currentPage.round() == index;
    final color = isCurrentPage
        ? slideShow.activeColor ?? theme.accentColor
        : slideShow.inactiveColor ?? theme.disabledColor;

    final size = isCurrentPage
        ? slideShow.activeSize ?? 10.0
        : slideShow.inactiveSize ?? 6.0;

    return AnimatedContainer(
      width: size,
      height: size,
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  final Color activeColor;
  final Color inactiveColor;
  final double activeSize;
  final double inactiveSize;

  _SlideShowModel({
    @required this.activeColor,
    @required this.inactiveColor,
    this.activeSize,
    this.inactiveSize,
  });

  double get currentPage => _currentPage;

  set currentPage(double index) {
    _currentPage = index;
    notifyListeners();
  }
}
