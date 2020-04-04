import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_design_practice/src/shoes_app/models/shoe_model.dart';

class ShoeView extends StatelessWidget {
  final bool fullScreen;
  final VoidCallback onTap;

  const ShoeView({
    Key key,
    this.fullScreen = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 8.0 : 20.0,
          vertical: 8.0,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 400.0 : 420.0,
          decoration: BoxDecoration(
            color: const Color(0xFFFFCF53),
            borderRadius: BorderRadius.circular(
              fullScreen ? 30.0 : 50.0,
            ),
          ),
          child: Stack(
            children: <Widget>[
              _ShoeView(),
              if (!fullScreen)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: _ShoeSizes(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return Container(
      height: 350,
      width: double.infinity,
      padding: const EdgeInsets.all(40.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20.0,
            right: 0.0,
            child: _ShoeShadow(),
          ),
          Image(
            image: AssetImage(shoeModel.assetImage),
          ),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 250.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: const [
            BoxShadow(color: Color(0xFfEAA14E), blurRadius: 40.0)
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        _ShowSizeBox(
          size: 7.0,
        ),
        _ShowSizeBox(
          size: 7.5,
        ),
        _ShowSizeBox(
          size: 8.0,
        ),
        _ShowSizeBox(
          size: 8.5,
        ),
        _ShowSizeBox(
          size: 9.0,
        ),
        _ShowSizeBox(
          size: 9.5,
        ),
      ],
    );
  }
}

class _ShowSizeBox extends StatelessWidget {
  final double size;
  const _ShowSizeBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    final isSelected = size == shoeModel.shoeSize;
    const yellow = Color(0xFFF1A23A);
    final textColor = isSelected ? Colors.white : yellow;
    final bgColor = isSelected ? yellow : Colors.white;
    return GestureDetector(
      onTap: () {
        shoeModel.shoeSize = size;
      },
      child: Container(
        width: 45.0,
        height: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            if (isSelected)
              const BoxShadow(
                color: yellow,
                blurRadius: 10.0,
                offset: Offset(0.0, 0.5),
              ),
          ],
        ),
        child: Text(
          size.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: textColor,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
