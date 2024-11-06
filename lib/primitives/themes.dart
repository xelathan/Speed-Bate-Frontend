import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.orange,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.black,
    ),
  ),
  buttonTheme: ButtonThemeData(
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
    hintStyle: TextStyle(color: Colors.black),
    filled: true, // Enables the background color
    fillColor: Colors.grey[250], // Background color for TextField
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide.none, // Default border color
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
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
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.orange,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.orange,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey[400]),
    filled: true, // Enables the background color
    fillColor: Colors.grey[850], // Background color for TextField
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide.none, // Default border color
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide.none, // No border on focus
    ),
    contentPadding: const EdgeInsets.only(
        right: 48, left: 16, bottom: 16, top: 16), // Adds padding
  ),
);
