//Main Color = 0xffb4d5fd
//Secondary kinda similar = 0xffd6d3f3

import 'package:flutter/material.dart';

class ThemeProvider {
  static const Color mainColor = Color(0xffb4d5fd);
  static const Color secondaryColor = Color(0xffd6d3f3);
}

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}
