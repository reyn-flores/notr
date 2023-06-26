import 'package:flutter/material.dart';

class Themings {
  static final ThemeData lightTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.grey,
      selectionHandleColor: Colors.black,
    ),
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.grey,
      selectionHandleColor: Colors.white,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const ColorScheme.dark().background,
    ),
  );
}
