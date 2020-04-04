import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<_ViewModel>(
        create: (_) => _ViewModel(),
        child: Stack(
          children: <Widget>[
            _PinterestGridView(),
            _PinterestMenuBuilder(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Consumer<_ViewModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: PinterestMenu(
                shouldShow: model.shouldShowMenu,
                items: [
                  PinterestMenuItem(icon: Icons.pie_chart, onPressed: () {}),
                  PinterestMenuItem(icon: Icons.search, onPressed: () {}),
                  PinterestMenuItem(
                      icon: Icons.notifications, onPressed: () {}),
                  PinterestMenuItem(
                      icon: Icons.supervised_user_circle, onPressed: () {}),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestGridView extends StatefulWidget {
  @override
  __PinterestGridViewState createState() => __PinterestGridViewState();
}

class __PinterestGridViewState extends State<_PinterestGridView> {
  final List<int> items = List.generate(200, (i) => i);
  final _scrollController = ScrollController();
  double _prevOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final model = Provider.of<_ViewModel>(context, listen: false);
      if ((_prevOffset - _scrollController.offset).abs() > 100) {
        if (_prevOffset < _scrollController.offset &&
            _scrollController.offset > 150.0) {
          model.shouldShowMenu = false;
        } else {
          model.shouldShowMenu = true;
        }

        _prevOffset = _scrollController.offset;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top + 10.0;
    return StaggeredGridView.countBuilder(
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      crossAxisCount: 4,
      itemCount: items.length,
      padding: EdgeInsets.fromLTRB(5.0, topPadding, 5.0, 100.0),
      itemBuilder: (BuildContext context, int index) {
        return _PinterestItem(index);
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(2, index.isEven ? 2 : 3);
      },
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem(
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _ViewModel with ChangeNotifier {
  bool _shouldShowMenu = true;

  bool get shouldShowMenu => _shouldShowMenu;

  set shouldShowMenu(bool shouldShow) {
    _shouldShowMenu = shouldShow;
    notifyListeners();
  }
}
