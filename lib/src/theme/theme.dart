import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

  ThemeChanger([int value = 1]) {
    switch (value) {
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _setLightMode();
        break;
      case 2: // dark
        _darkTheme = true;
        _customTheme = false;
        _setDarkMode();
        break;
      case 3: // dark
        _darkTheme = false;
        _customTheme = true;
        _setCustomMode();
        break;
      default:
        _setLightMode();
    }
  }

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;

  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    if (value) {
      _setDarkMode();
    } else {
      _setLightMode();
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;
    if (value) {
      _setCustomMode();
    } else {
      _setLightMode();
    }
    notifyListeners();
  }

  void _setDarkMode() {
    const accentColor = Color(0xFFB91ABB);
    const surfaceColor = Color(0xFF04030B);
    const canvasColor = Color(0xFF390D56);
    _currentTheme = ThemeData.dark().copyWith(
      accentColor: accentColor,
      scaffoldBackgroundColor: surfaceColor,
      canvasColor: canvasColor,
      appBarTheme: const AppBarTheme(
        color: surfaceColor,
        elevation: 0.0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentColor,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  void _setLightMode() {
    const accentColor = Color(0xFF00BFA6);
    _currentTheme = ThemeData.light().copyWith(
      accentColor: accentColor,
      primaryColorDark: Colors.black,
      appBarTheme: const AppBarTheme(
        color: accentColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentColor,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  void _setCustomMode() {
    const accentColor = Color(0xFF48A0EB);
    const surfaceColor = Color(0xFF162028);
    const primaryColor = Color(0xFF14171A);
    _currentTheme = ThemeData.dark().copyWith(
      accentColor: accentColor,
      scaffoldBackgroundColor: surfaceColor,
      canvasColor: primaryColor,
      primaryColorLight: Colors.white,
      appBarTheme: const AppBarTheme(
        color: primaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentColor,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
