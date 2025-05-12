
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDarkMode = false;
  setTheme(bool value){
    isDarkMode = value;
    notifyListeners();
  }
}