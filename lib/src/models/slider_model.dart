import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => _currentPage;

  set currentPage(double index) {
    _currentPage = index;
    notifyListeners();
  }
}
