import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            _AppBarIconButton(
              icon: FontAwesomeIcons.chevronLeft,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Spacer(),
            _AppBarIconButton(
              icon: FontAwesomeIcons.commentAlt,
              onPressed: () {},
            ),
            const SizedBox(width: 2.0),
            _AppBarIconButton(
              icon: FontAwesomeIcons.headphonesAlt,
              onPressed: () {},
            ),
            const SizedBox(width: 2.0),
            _AppBarIconButton(
              icon: FontAwesomeIcons.externalLinkAlt,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _AppBarIconButton({
    Key key,
    @required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FaIcon(icon),
        ),
      ),
    );
  }
}
