import 'package:flutter/foundation.dart';

class BottomNavigationNotifier extends ChangeNotifier {
  int _selectNav = 1;
  int get selectNav => _selectNav;

  void select(int slc) {
    _selectNav = slc;
    notifyListeners();
  }
}
