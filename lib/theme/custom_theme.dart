// import 'package:flutter/material.dart';

// final darkTheme = ThemeData(
//   primaryColor: Colors.black,
//   brightness: Brightness.dark,
//   backgroundColor: const Color(0xFF212121),
//   // accentIconTheme: IconThemeData(color: Colors.black),
//   dividerColor: Colors.black12,
//   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
//       .copyWith(secondary: Colors.white),
// );

// final lightTheme = ThemeData(
//   primaryColor: Colors.white,
//   brightness: Brightness.light,
//   backgroundColor: const Color(0xFFE5E5E5),
//   // accentIconTheme: IconThemeData(color: Colors.white),
//   dividerColor: Colors.white54,
//   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
//       .copyWith(secondary: Colors.black),
// );

import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  // brightness: Brightness.light,
  colorScheme: const ColorScheme.dark().copyWith(
    secondary: Colors.redAccent,
    primary: Colors.white,
  ),
  // colorSchemeSeed: Colors.green,
  // accentColor: Colors.pink,
  // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),

  // scaffoldBackgroundColor: Color(0xfff1f1f1),
);

ThemeData light = ThemeData(
  // brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Color.fromARGB(255, 9, 209, 109),
    primary: Colors.teal,
  ),
  // primarySwatch: Colors.indigo,
  // accentColor: Colors.pink,
);
