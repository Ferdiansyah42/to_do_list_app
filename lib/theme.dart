import 'package:flutter/material.dart';

const defaultFont = 'Poppins';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: Brightness.light, // <- tambahkan ini
  ),
  useMaterial3: true,
  fontFamily: defaultFont,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark, // <- tambahkan ini
  ),
  useMaterial3: true,
  fontFamily: defaultFont,
);
