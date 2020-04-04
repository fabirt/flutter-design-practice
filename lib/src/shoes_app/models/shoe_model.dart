import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _assetImage = 'assets/images/blue.png';
  double _shoeSize = 9.0;

  String get assetImage => _assetImage;

  double get shoeSize => _shoeSize;

  set assetImage(String value) {
    _assetImage = value;
    notifyListeners();
  }

  set shoeSize(double value) {
    _shoeSize = value;
    notifyListeners();
  }
}
