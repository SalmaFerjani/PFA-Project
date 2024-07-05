import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

MaterialColor textclr = Colors.indigo;
HexColor edFirstcolor = HexColor('2f71f0');
HexColor edSecondcolor = HexColor('885dfe');

class ThemesApp {
  static final light = ThemeData(
      scaffoldBackgroundColor: HexColor('F9F9F9'),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          height: 1.5,
          fontSize: 18,
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: HexColor('F9F9F9'),
          elevation: 0,
          iconTheme:
              const IconThemeData(color: Colors.indigoAccent, size: 40)));

  static final dark = ThemeData();
}
