import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_design_practice/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter design practice'),
      ),
      drawer: _Drawer(),
      body: _MenuListView(),
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
