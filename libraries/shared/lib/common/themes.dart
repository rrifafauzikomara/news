import 'package:flutter/material.dart';
import 'package:shared/common/color_palettes.dart';

class Themes {
  // Styling for light theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'IBMPlexSans',
    backgroundColor: ColorPalettes.lightBG,
    primaryColor: ColorPalettes.lightPrimary,
    accentColor: ColorPalettes.lightAccent,
    cursorColor: ColorPalettes.lightAccent,
    dividerColor: ColorPalettes.darkBG,
    scaffoldBackgroundColor: ColorPalettes.lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorPalettes.lightAccent,
      unselectedItemColor: Colors.grey,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorPalettes.lightAccent,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  );

  // Styling for dark theme
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'IBMPlexSans',
    brightness: Brightness.dark,
    backgroundColor: ColorPalettes.darkBG,
    primaryColor: ColorPalettes.darkPrimary,
    accentColor: ColorPalettes.darkAccent,
    dividerColor: ColorPalettes.lightPrimary,
    scaffoldBackgroundColor: ColorPalettes.darkBG,
    cursorColor: ColorPalettes.darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorPalettes.darkAccent,
      unselectedItemColor: Colors.grey,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorPalettes.darkAccent,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  );
}
