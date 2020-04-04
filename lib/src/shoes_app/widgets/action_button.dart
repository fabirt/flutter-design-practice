import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final Size size;
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    Key key,
    @required this.title,
    this.onPressed,
    this.color = Colors.orange,
    this.size = const Size(150.0, 50.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: (){},
        customBorder: const StadiumBorder(),
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
