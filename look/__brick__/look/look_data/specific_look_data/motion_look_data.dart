import 'package:flutter/material.dart';

class MotionLookData extends ThemeExtension<MotionLookData> {
  const MotionLookData({
    required this.durationVeryFast,
    required this.durationFast,
    required this.durationNormal,
    required this.durationSlow,
  });

  const MotionLookData.getDefault()
      : durationVeryFast = const Duration(milliseconds: 100),
        durationFast = const Duration(milliseconds: 200),
        durationNormal = const Duration(milliseconds: 300),
        durationSlow = const Duration(milliseconds: 500);

  final Duration durationVeryFast;
  final Duration durationFast;
  final Duration durationNormal;
  final Duration durationSlow;

  @override
  ThemeExtension<MotionLookData> copyWith({
    Duration? durationVeryFast,
    Duration? durationFast,
    Duration? durationNormal,
    Duration? durationSlow,
  }) {
    return MotionLookData(
      durationVeryFast: durationVeryFast ?? this.durationVeryFast,
      durationFast: durationFast ?? this.durationFast,
      durationNormal: durationNormal ?? this.durationNormal,
      durationSlow: durationSlow ?? this.durationSlow,
    );
  }

  @override
  ThemeExtension<MotionLookData> lerp(ThemeExtension<MotionLookData>? other, double t) {
    if (other is! MotionLookData) {
      return this;
    }

    return MotionLookData(
      durationVeryFast: other.durationVeryFast,
      durationFast: other.durationFast,
      durationNormal: other.durationNormal,
      durationSlow: other.durationSlow,
    );
  }
}
