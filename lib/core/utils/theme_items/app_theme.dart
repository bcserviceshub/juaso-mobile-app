import 'package:flutter/material.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';  

ThemeData getAppTheme(bool isDark, BuildContext context){
  final defaultTextStyle = TextStyle(
    color: isDark ? Colors.white: Colors.black,
    fontSize:13,
    height: 1.25,
  );
  return ThemeData(
    colorScheme: isDark
        ? ColorScheme.fromSeed(
          seedColor: const Color(0xff0B192C),
          )
        : ColorScheme.fromSeed(seedColor: AppColors.primary),
      useMaterial3: true,
      cardColor: AppColors(context: context).background(),
      scaffoldBackgroundColor: AppColors(context: context).background(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
      dividerTheme: DividerThemeData(
        color: AppColors(context: context).nutural100(),
        thickness: 5,
        space: 5,
      ),
      bottomNavigationBarTheme:BottomNavigationBarThemeData(
        backgroundColor: isDark ? const Color(0xff0B192C) : Colors.white,
        selectedLabelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: isDark ? Colors.grey : Colors.black,
        unselectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),   
      ),
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.roboto(
          color: isDark ? Colors.white: Colors.black,
          fontSize: 13,
          height: 1.25,
        ),
        titleMedium: GoogleFonts.roboto(
          color: isDark ? Colors.white : Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        titleSmall: GoogleFonts.roboto(
          color: isDark ? Colors.white: Colors.black,
          fontSize: 13,
          height: 1.25,
        ),
        bodySmall: GoogleFonts.roboto(
          color: isDark ?  Colors.white : Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          decoration: TextDecoration.none,
        ),
        bodyLarge: GoogleFonts.roboto(
          color: isDark ? Colors.white : Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 15,
          decoration: TextDecoration.none,
        ),
        labelSmall: GoogleFonts.roboto(
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: isDark ? AppColors.primary : Colors.white,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white : Colors.black,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors(context: context).foreground().withOpacity(0.9),
        ),
      ),
       inputDecorationTheme: InputDecorationTheme(
      labelStyle: defaultTextStyle,
      helperStyle: defaultTextStyle.copyWith(fontSize: 12),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return isDark ? Colors.white : Colors.black;
          }
          return Colors.white;
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    listTileTheme: const ListTileThemeData(),
     appBarTheme: AppBarTheme(
      backgroundColor: isDark ? const Color(0xff0B192C) : AppColors.primary,
      centerTitle: false,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    ),
    iconTheme: IconThemeData(
      color: isDark ? Colors.white : Colors.black,
      applyTextScaling: true
    ),
     dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: defaultTextStyle,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors(context: context).nutural100(),
          hintStyle: TextStyle(
            color: AppColors.nutural500,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
           menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            AppColors(context: context).background(),
          ),
        )),    
      
  );


}
