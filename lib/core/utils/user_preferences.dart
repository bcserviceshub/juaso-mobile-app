import 'package:flutter/material.dart';
import 'package:juaso_mobile_app/core/utils/theme_items/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';


class PrefsKeys {
  static String theme = "theme";
  static String fullName = "fullName";
  static String email = "email";
  static String password = "password";
}

class UserPreferences {

  static Future setTheme(String theme) async {
    print("Setting theme in UserPreferences to: $theme");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(PrefsKeys.theme, theme);
  }

  static Future<String?> getTheme(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString(PrefsKeys.theme) ?? "system";
    print("Retrieved theme from SharedPreferences: $theme");
    
    if (context.mounted) {
      if (theme == "dark") {
        print("Setting ThemeProvider to dark mode");
        context.read<ThemeProvider>().setTheme(true);
      } else if (theme == "light") {
        print("Setting ThemeProvider to light mode");
        context.read<ThemeProvider>().setTheme(false);
      } else if (theme == "system") {
        var brightness = MediaQuery.of(context).platformBrightness;
        bool isDarkMode = brightness == Brightness.dark;
        print("System theme detected: ${isDarkMode ? 'dark' : 'light'}");
        context.read<ThemeProvider>().setTheme(isDarkMode);
      }
    }

    return prefs.getString(PrefsKeys.theme);
  }

  static Future setFullName(String fullName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(PrefsKeys.fullName, fullName);
  }

  static Future<String?> getFullName(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fullName = prefs.getString(PrefsKeys.fullName) ?? "";
    return fullName;
  }
  
  static Future setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(PrefsKeys.email, email);
  }

  static Future<String?> getEmail(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString(PrefsKeys.email) ?? "";
    return email;
  }

  static Future setPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(PrefsKeys.password, password);
  }

  static Future<String?> getPassword(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String password = prefs.getString(PrefsKeys.password) ?? "";
    return password;
  }
  


}

