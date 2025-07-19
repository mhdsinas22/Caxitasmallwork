import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _currentindex = 0;
  int get currentindex => _currentindex;
  void changeindex(int newnindex) {
    _currentindex = newnindex;
    notifyListeners();
  }
}
