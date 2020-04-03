import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenuItem {
  final IconData icon;
  final VoidCallback onPressed;

  PinterestMenuItem({
    @required this.icon,
    @required this.onPressed,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool shouldShow;
  final List<PinterestMenuItem> items;

  const PinterestMenu({
    @required this.items,
    this.shouldShow = true,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_PinterestMenuModel>(
      create: (_) => _PinterestMenuModel(),
      child: AnimatedOpacity(
        opacity: shouldShow ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: _PinterestMenuBackground(
          child: _MenuItems(items: items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            spreadRadius: -5.0,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestMenuItem> items;

  const _MenuItems({@required this.items});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) {
        return _PinterestMenuButton(items.indexOf(item), item);
      }).toList(),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestMenuItem item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_PinterestMenuModel>(context);
    final isActive = index == model.activeIndex;
    final color = isActive ? Colors.black : Colors.blueGrey;
    final size = isActive ? 28.0 : 22.0;
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          model.activeIndex = index;
          item.onPressed();
        },
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            item.icon,
            color: color,
            size: size,
          ),
        ),
      ),
    );
  }
}

class _PinterestMenuModel with ChangeNotifier {
  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  set activeIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
}
