import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
var now = DateTime.now();
  var time=DateFormat.j().format(now);
  
class themModel {
  static ThemeData lightMode = ThemeData(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
    ),
    colorScheme: ColorScheme.light(
      background: Colors.white70,
      primary: const Color.fromARGB(224, 6, 9, 14).withAlpha(40),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white30,
      actionsIconTheme: IconThemeData(color: Colors.white24),
    ),
  );

  static ThemeData darkMode = ThemeData(
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
      ),
      colorScheme: ColorScheme.light(
        background: const Color.fromARGB(224, 62, 75, 94),
        primary: const Color.fromARGB(255, 10, 10, 10).withAlpha(40),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(224, 62, 75, 94),
          actionsIconTheme:
              IconThemeData(color: Color.fromARGB(223, 82, 96, 117))));
  static LinearGradient lightThem = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.white30,
      const Color.fromARGB(223, 27, 36, 53).withAlpha(40),
    ],
  );

  static LinearGradient darkThem = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 118, 181, 233),
      Color.fromARGB(225, 25, 34, 47),
    ],
  );
}
