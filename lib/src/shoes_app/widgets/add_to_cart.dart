import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/shoes_app/widgets/widgets.dart';

class AddToCart extends StatelessWidget {
  final double value;

  const AddToCart({
    Key key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.10),
        borderRadius: BorderRadius.circular(100.0)
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 20.0),
          Text(
            '\$$value',
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold, 
            ),
          ),
          const Spacer(),
          const ActionButton(
            title: 'Add to cart',
          ),
          const SizedBox(width: 20.0),
        ],
      ),
    );
  }
}
