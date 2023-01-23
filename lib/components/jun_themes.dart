import 'package:flutter/material.dart';
import 'package:jun/components/jun_colors.dart';

class JunThemes {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: JunColors.primaryMeterialColor,
        fontFamily: 'GmarketSansTTF',
        backgroundColor: Colors.white,
        splashColor: Colors.white,
        textTheme: _textTheme,
        appBarTheme: _appBarTheme,
        brightness: Brightness.light,
      );

  static ThemeData get darkTheme => ThemeData(
        primarySwatch: JunColors.primaryMeterialColor,
        fontFamily: 'GmarketSansTTF',
        // backgroundColor: Colors.white,
        splashColor: Colors.white,
        textTheme: _textTheme,
        brightness: Brightness.dark,
      );

  static const AppBarTheme _appBarTheme = AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: JunColors.primaryColor,
      ),
      elevation: 0);
  static const TextTheme _textTheme = TextTheme(
    headline4: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      // color: JunColors.primaryColor,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      // color: JunColors.primaryColor,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      // color: JunColors.primaryColor,
    ),
    bodyText1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      // color: JunColors.primaryColor,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      // color: JunColors.primaryColor,
    ),
    button: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      // color: JunColors.primaryColor,
    ),
  );
}
