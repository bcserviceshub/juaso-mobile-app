import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDarkMode = false;
  setTheme(bool value){
    print("ThemeProvider setTheme called with value: $value");
    isDarkMode = value;
    print("ThemeProvider isDarkMode is now: $isDarkMode");
    notifyListeners();
  }
}
