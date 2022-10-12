import 'package:flutter/material.dart';
import 'package:look/ui/common/bits_theme/specific_data/color_data.dart';
import 'package:look/ui/common/bits_theme/specific_data/motion_data.dart';
import 'package:look/ui/common/bits_theme/specific_data/shape_data.dart';

class LookThemeData {
  static ThemeData getThemeData() {
    return ThemeData(
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme(
        primary: Color(0xff005670),
        secondary: Color(0xffAA198D),
        onSecondary: Colors.white,
        surface: Colors.white,
        background: Colors.white,
        error: Color(0xffFB3449),
        onPrimary: Colors.white,
        onSurface: Color(0xff666666),
        onBackground: Color(0xff666666),
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      primaryColor: const Color(0xff005670),
      splashColor: const Color(0xffAA198D),
      errorColor: const Color(0xffFB3449),
      backgroundColor: Colors.white,
      textTheme: ThemeData.light().textTheme.copyWith(
            headline1: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40, letterSpacing: -1),
            headline2: const TextStyle(fontSize: 32, letterSpacing: -0.75),
            headline3: const TextStyle(fontSize: 24, letterSpacing: -0.25),
            headline4: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            bodyText1: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            bodyText2: const TextStyle(fontSize: 15),
            caption: const TextStyle(fontSize: 14),
            button: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
            subtitle1: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            subtitle2: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            overline: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xff666666)),
        labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xff666666)),
        errorStyle: TextStyle(fontSize: 14, color: Color(0xffFB3449)),
        focusColor: Color(0xff005670),
      ),

      /// Add extensions for things that are defined in the design but are not part of material guidelines.
      /// Additional data can be added, (ex. TypographyData)
      extensions: const [
        MotionData.getDefault(),
        ShapeData.getDefault(),
        CustomColors.getDefault(),
      ],
      brightness: Brightness.light,
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
