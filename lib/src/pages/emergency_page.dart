import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_design_practice/src/widgets/emergency_button.dart';
import 'package:flutter_design_practice/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 140.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 120.0, bottom: 20.0),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int i) {
                return SlideInLeft(
                  duration: const Duration(milliseconds: 400),
                  child: EmergencyButton(
                    title: items[i].title,
                    icon: items[i].icon,
                    beginColor: items[i].beginColor,
                    endColor: items[i].endColor,
                  ),
                );
              },
            ),
          ),
          const _PageHeader(),
        ],
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        EmergencyHeader(
          title: 'Haz solicitado',
          subtitle: 'Asistencia Médica',
          icon: FontAwesomeIcons.plus,
        ),
        Positioned(
          right: 6.0,
          top: 26.0,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              customBorder: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmergencyItem {
  final IconData icon;
  final String title;
  final Color beginColor;
  final Color endColor;

  const EmergencyItem(this.icon, this.title, this.beginColor, this.endColor);
}

const items = <EmergencyItem>[
  EmergencyItem(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  EmergencyItem(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  EmergencyItem(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  EmergencyItem(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  EmergencyItem(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  EmergencyItem(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  EmergencyItem(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  EmergencyItem(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  EmergencyItem(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  EmergencyItem(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  EmergencyItem(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  EmergencyItem(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
];
