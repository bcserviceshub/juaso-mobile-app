import 'package:flutter/material.dart';
import 'package:juaso_mobile_app/core/utils/theme_items/theme_provider.dart';
import 'package:provider/provider.dart';

class AppColors {
  BuildContext context;
  late bool isDarkMode;
  AppColors({
    required this.context
  }){
      isDarkMode = context.watch<ThemeProvider>().isDarkMode;
  }
  static Color primary = const Color(0xFF007F61);
  static Color secondary = const Color(0xFF5F6369);

  //sucess 
  static Color success100 = const Color(0xFFCCE1CD);
  static Color success200 = const Color(0xFFB2D2B4);
  static Color success300 = const Color(0xFF99C39B);
  static Color success900 = const Color(0xFF006804);

  //nutural 
  Color nutural100() => 
       isDarkMode ? const Color(0xFF333d4d) : const Color(0xFFF5F5F5);
  static Color nutural200 = const Color(0xFFD2D2D2);
  static Color nutural400 = const Color(0xFFA2A2A2);
  static Color nutural500 = const Color(0xFFBABABA);

  Color nutural600() =>
      isDarkMode ? Colors.white.withOpacity(0.85) : const Color(0xFF737373); 
  Color nutural700() => isDarkMode ? Colors.white : const Color(0xFF5B5B5B);
  Color nutural800() =>
      isDarkMode ? const Color.fromARGB(255, 155, 153, 153) : const Color(0xFF303030);
  Color nutural900() => isDarkMode ? Colors.white : const Color(0xFF1f1f1f);
  
  //error 
  static Color error900 = const Color(0xFFD20404);
  static Color error100 = const Color(0xFFFBE6E6);

  //warning
  static Color warning900 = const Color(0xffda9d00);
  static Color warning100 = const Color(0xFFFBF5E5);
   //theme colors
  Color background() => isDarkMode ? const Color(0xff212936) : Colors.white;
  Color appBar() => isDarkMode ? const Color(0xff0B192C) : primary;
  Color logo() => isDarkMode ? primary :primary;
  Color bottomNav() => isDarkMode ? const Color(0xff0B192C) : Colors.white;
  Color tab() => isDarkMode ? const Color(0xff0B192C) : Colors.white;
  Color foreground() => isDarkMode ? Colors.white : Colors.black;
  Color appTextFieldSuccess() =>
      isDarkMode ? Colors.white : const Color(0xFF006804);
}
