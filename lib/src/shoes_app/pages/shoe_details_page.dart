import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:flutter_design_practice/src/shoes_app/models/shoe_model.dart';
import 'package:flutter_design_practice/src/shoes_app/widgets/widgets.dart';

class ShoeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              const Hero(
                tag: 'shoes-hero',
                child: ShoeView(
                  fullScreen: true,
                ),
              ),
              Positioned(
                top: 40.0,
                child: IconButton(
                  iconSize: 50.0,
                  color: Colors.white,
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _BuyNow(),
                  _CustomizationArea(),
                  _SettingArea(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0, top: 10.0),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 20.0),
          const Text(
            '\$180.0',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Bounce(
            delay: const Duration(seconds: 1),
            from: 8.0,
            child: ActionButton(
              title: 'Add to cart',
              size: const Size(120.0, 40.0),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
    );
  }
}

class _CustomizationArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: const <Widget>[
                Positioned(
                  left: 90.0,
                  child: _ColorButton(
                    asset: 'assets/images/green.png',
                    color: Color(0xFFC6D642),
                    index: 4,
                  ),
                ),
                Positioned(
                  left: 60.0,
                  child: _ColorButton(
                    asset: 'assets/images/yellow.png',
                    color: Color(0xFFFFAD29),
                    index: 3,
                  ),
                ),
                Positioned(
                  left: 30.0,
                  child: _ColorButton(
                    asset: 'assets/images/blue.png',
                    color: Color(0xFF2099F1),
                    index: 2,
                  ),
                ),
                _ColorButton(
                  asset: 'assets/images/black.png',
                  color: Color(0xFF364D56),
                  index: 1,
                ),
              ],
            ),
          ),
          ActionButton(
            title: 'More related items',
            color: const Color(0xFFFFC675),
            size: const Size(170.0, 30.0),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String asset;
  final VoidCallback onTap;

  const _ColorButton({
    Key key,
    @required this.color,
    @required this.index,
    @required this.asset,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: 100 * index),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          shoeModel.assetImage = asset;
        },
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _SettingArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _CircleButton(
            icon: FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
            ),
          ),
          _CircleButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
          _CircleButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final Widget icon;
  const _CircleButton({
    Key key,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: 56.0,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: icon,
    );
  }
}
