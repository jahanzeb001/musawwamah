import 'package:flutter/material.dart';

import '../colors/colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: cScaffoldBackground,
    fontFamily: "Tajawal",
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent[400]),

  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    fontFamily: "Tajawal",
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: cPrimaryColor),
  );
}
