import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color beginColor;
  final Color endColor;
  final VoidCallback onPressed;

  const EmergencyButton({
    Key key,
    @required this.title,
    @required this.icon,
    this.beginColor,
    this.endColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          _EmergencyButtonBackground(
            icon: icon,
            beginColor: beginColor,
            endColor: endColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 20.0,
                height: 100.0,
              ),
              FaIcon(
                icon ?? FontAwesomeIcons.carCrash,
                color: Colors.white,
                size: 40.0,
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 20.0),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmergencyButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color beginColor;
  final Color endColor;

  const _EmergencyButtonBackground({
    Key key,
    this.icon,
    this.beginColor,
    this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: const Offset(4.0, 6.0),
            blurRadius: 10.0,
          )
        ],
        gradient: LinearGradient(
          colors: <Color>[
            beginColor ?? Colors.grey,
            endColor ?? Colors.blueGrey,
            // Color(0xFF6989F5),
            // Color(0xFF906EF5),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -20.0,
              right: -20.0,
              child: FaIcon(
                icon ?? FontAwesomeIcons.carCrash,
                size: 150.0,
                color: Colors.white12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
