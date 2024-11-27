import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const cursorColor = Color.fromRGBO(0, 122, 255, 1);
const paddingSmall = 8.0;
const paddingMedium = 16.0;
const paddingLarge = 32.0;
const paddingXLarge = 64.0;

const borderRadiusMedium = 16.0;
const borderRadiusVeryRound = 36.0;

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.orange,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.black,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.orange,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.orange,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.black),
    filled: true, // Enables the background color
    fillColor: Colors.grey[250], // Background color for TextField
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadiusVeryRound)),
      borderSide: BorderSide.none, // Default border color
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadiusVeryRound)),
      borderSide: BorderSide.none, // No border on focus
    ),
    contentPadding: const EdgeInsets.only(
        right: 48, left: 16, bottom: 16, top: 16), // Adds padding
  ),
);

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[850],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.dark(
        primary: Colors.orange,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color.fromARGB(135, 0, 123, 255),
      selectionHandleColor: Colors.white,
      cursorColor: cursorColor,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: cursorColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue, // Blue text color
        backgroundColor: Colors.transparent, // No background
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.orange,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.grey[400]),
      filled: true, // Enables the background color
      fillColor: Colors.grey[850], // Background color for TextField
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadiusVeryRound)),
        borderSide: BorderSide.none, // Default border color
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadiusVeryRound)),
        borderSide: BorderSide.none, // No border on focus
      ),
      contentPadding: const EdgeInsets.only(
          right: 48, left: 16, bottom: 16, top: 16), // Adds padding
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.black,
    ));
