import 'dart:math';

import 'package:flutter/material.dart';

const _items = <Widget>[
  _TaskItem('Orange', Color(0xffF08F66)),
  _TaskItem('Family', Color(0xffF2A38A)),
  _TaskItem('Subscriptions', Color(0xffF7CDD5)),
  _TaskItem('Books', Color(0xffFCEBAF)),
  _TaskItem('Orange', Color(0xffF08F66)),
  _TaskItem('Family', Color(0xffF2A38A)),
  _TaskItem('Subscriptions', Color(0xffF7CDD5)),
  _TaskItem('Books', Color(0xffFCEBAF)),
];

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.white),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _MainScroll(),
            Positioned(
              bottom: -8.0,
              right: 0.0,
              child: _FloatingButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      height: 90.0,
      minWidth: size.width * 0.8,
      padding: EdgeInsets.only(bottom: bottomPadding),
      buttonColor: const Color(0xFFED6762),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0)),
      ),
      child: RaisedButton(
        onPressed: () {},
        textColor: Colors.white,
        child: const Text(
          'CREATE NEW LIST',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _CustomSliverDelegate(
            maxHeight: 200.0,
            minHeight: 170.0,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: Alignment.centerLeft,
              child: _Title(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [..._items, const SizedBox(height: 110.0)],
          ),
        ),
      ],
    );
  }
}

class _CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _CustomSliverDelegate({
    @required this.child,
    @required this.maxHeight,
    @required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => min(maxHeight, minHeight);

  @override
  bool shouldRebuild(_CustomSliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20.0),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: const Text(
            'New',
            style: TextStyle(
              color: Color(0xFF532128),
              fontSize: 50.0,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              width: 120.0,
              height: 8.0,
              color: const Color(0xFFF7CDD5),
            ),
            const Text(
              'List',
              style: TextStyle(
                color: Color(0xFFD93A30),
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}

// class _TaskListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: _items.length,
//       itemBuilder: (BuildContext context, int index) {
//         return _items[index];
//       },
//     );
//   }
// }

class _TaskItem extends StatelessWidget {
  final String title;
  final Color color;

  const _TaskItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(30.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
