import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design_practice/src/pages/launcher_page.dart';
import 'package:flutter_design_practice/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(1),
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter design pratice',
            home: LauncherPage(),
            theme: themeChanger.currentTheme,
            builder: (BuildContext context, Widget child) {
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.dark.copyWith(
                  systemNavigationBarIconBrightness: Brightness.light,
                ),
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
