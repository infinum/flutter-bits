import 'package:flutter/material.dart';

import 'colors/neutral_color.dart';

class ColorLookData {
  const ColorLookData({
    required this.brightness,
    required this.primary,
    required this.secondary,
    required this.onPrimary,
    required this.onSecondary,
    required this.background,
    required this.surface,
    required this.onBackground,
    required this.onSurface,
    required this.error,
    required this.onError,
  });

  const ColorLookData.getDefault()
      : brightness = Brightness.light,
        primary = const Color(0xff005670),
        secondary = const Color(0xffAA198D),
        background = Colors.white,
        surface = Colors.white,
        error = const Color(0xffFB3449),
        onError = Colors.white,
        onBackground = const Color(0xff666666),
        onSurface = const Color(0xff666666),
        onPrimary = Colors.white,
        onSecondary = Colors.white,
        neutral = const ProxyNeutralColor(100, {
          100: Color(0xFF12335B),
          80: Color(0xFF415C7C),
          60: Color(0xFF71859D),
          40: Color(0xFFA0ADBD),
          30: Color(0xFFD0D6DE),
          20: Color(0xFFE9ECF0),
          10: Color(0xFFF5F6F7),
          0: Color(0xFFFFFFFF),
        }),
  ;

  // Material color scheme
  final Brightness brightness;
  final Color primary;
  final Color secondary;
  final Color onPrimary;
  final Color onSecondary;
  final Color background;
  final Color surface;
  final Color onBackground;
  final Color onSurface;
  final Color error;
  final Color onError;

  // Custom colors
  final NeutralColor neutral;
}
