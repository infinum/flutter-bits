import 'package:flutter/material.dart';

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
        onSecondary = Colors.white;

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
}
