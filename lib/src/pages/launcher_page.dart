import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_design_practice/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _canBeDragged;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails details) {
    final isGestureOpenFromLeft =
        _controller.isDismissed && details.globalPosition.dx < 100.0;
    final isGestureCloseFromRight =
        _controller.isCompleted && details.globalPosition.dx > 100.0;
    _canBeDragged = isGestureOpenFromLeft || isGestureCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      final deltaX = details.primaryDelta / 225.0;
      _controller.value += deltaX;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_controller.isCompleted || _controller.isDismissed) {
      return;
    } else if (details.velocity.pixelsPerSecond.dx.abs() >= 360.0) {
      final velocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: velocity);
    } else if (_controller.value < 0.5) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  void _onTap() {
    if (_controller.isCompleted) {
      // _controller.reverse();
    }
  }

  void _closeDrawer() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: Stack(
        children: <Widget>[
          _ThemeSwitcher(),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              final translation = 225.0 * _controller.value;
              final scale = 1 - (_controller.value * 0.3);
              final radius = 30.0 * _controller.value;
              return Transform(
                transform: Matrix4.identity()
                  ..translate(translation)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: Stack(
                    children: <Widget>[
                      Scaffold(
                        appBar: AppBar(
                          title: const Text('Flutter design practice'),
                          leading: IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              if (_controller.isCompleted) {
                                _controller.reverse();
                              } else {
                                _controller.forward();
                              }
                            },
                          ),
                        ),
                        body: _MenuListView(),
                      ),
                      if (_controller.isCompleted)
                        GestureDetector(
                          onTap: _closeDrawer,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.transparent,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MenuListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        final item = pageRoutes[index];
        return ListTile(
          leading: FaIcon(
            item.icon,
            color: appTheme.accentColor,
          ),
          title: Text(item.title),
          trailing: Icon(
            Icons.chevron_right,
            color: appTheme.accentColor,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (context) => item.page),
            );
          },
        );
      },
    );
  }
}

class _ThemeSwitcher extends StatefulWidget {
  @override
  __ThemeSwitcherState createState() => __ThemeSwitcherState();
}

class __ThemeSwitcherState extends State<_ThemeSwitcher>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static const animDuration = Duration(milliseconds: 400);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: animDuration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const maxWidth = 225.0;
    const padding = 50.0;

    final themeChanger = Provider.of<ThemeChanger>(context);
    final bgColor = themeChanger.darkTheme
        ? const Color(0xFF2B2B2B)
        : const Color(0xFFDFE2E8);
    final borderColor = themeChanger.darkTheme
        ? const Color(0xFF414141)
        : const Color(0xFFECEFF3);
    final buttonColor = themeChanger.darkTheme
        ? const Color(0xFF1D1D1D)
        : const Color(0xFFE1E5EB);

    return AnimatedContainer(
      duration: animDuration,
      width: double.infinity,
      height: double.infinity,
      color: bgColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          duration: animDuration,
          margin: const EdgeInsets.only(left: padding),
          height: 360.0,
          width: maxWidth - (2 * padding),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(width: 18.0, color: borderColor),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                final position = Tween<AlignmentGeometry>(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                ));
                return Align(
                  alignment: position.value,
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: () {
                  if (_controller.isCompleted) {
                    _controller.reverse();
                    themeChanger.darkTheme = false;
                  } else {
                    _controller.forward();
                    themeChanger.darkTheme = true;
                  }
                },
                child: AnimatedContainer(
                  duration: animDuration,
                  height: maxWidth - 36 - 100,
                  width: maxWidth - 36 - 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white30,
                          offset: Offset(0.0, -6.0),
                          blurRadius: 10.0,
                        ),
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 10.0),
                          blurRadius: 10.0,
                        ),
                      ],
                      color: buttonColor),
                  child: FaIcon(
                    FontAwesomeIcons.powerOff,
                    size: 30.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final accentColor = themeChanger.currentTheme.accentColor;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 180.0,
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: const Text(
                  'FJ',
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _MenuListView(),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: accentColor,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: themeChanger.darkTheme,
                activeColor: accentColor,
                onChanged: (bool value) {
                  themeChanger.darkTheme = value;
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: accentColor,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: themeChanger.customTheme,
                activeColor: accentColor,
                onChanged: (bool value) {
                  themeChanger.customTheme = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
