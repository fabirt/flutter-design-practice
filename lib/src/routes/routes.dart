import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_design_practice/src/pages/slide_show_page.dart';
import 'package:flutter_design_practice/src/pages/animations_page.dart';
import 'package:flutter_design_practice/src/pages/circular_progress_page.dart';
import 'package:flutter_design_practice/src/pages/emergency_page.dart';
import 'package:flutter_design_practice/src/pages/headers_page.dart';
import 'package:flutter_design_practice/src/pages/pinterest_page.dart';
import 'package:flutter_design_practice/src/pages/sliver_list_page.dart';
import 'package:flutter_design_practice/src/shoes_app/pages/shoes_page.dart';

final List<_Route> pageRoutes = <_Route>[
  _Route(
    icon: FontAwesomeIcons.shopify,
    title: 'Shoes App',
    page: ShoesPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.slideshare,
    title: 'Slideshow',
    page: SlideShowPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.ambulance,
    title: 'Emergency',
    page: EmergencyPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers',
    page: HeadersPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.waveSquare,
    title: 'Animated Square',
    page: AnimationsPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.circleNotch,
    title: 'Circular Progress',
    page: CircularProgressPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.pinterest,
    title: 'Pinterest',
    page: PinterestPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.mobile,
    title: 'Slivers',
    page: SliverListPage(),
  ),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route({
    @required this.icon,
    @required this.title,
    @required this.page,
  });
}
