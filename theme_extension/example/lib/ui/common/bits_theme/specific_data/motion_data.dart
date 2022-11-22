import 'package:flutter/material.dart';

class MotionData extends ThemeExtension<MotionData> {
  const MotionData({
    required this.durationVeryFast,
    required this.durationFast,
    required this.durationNormal,
    required this.durationSlow,
  });

  const MotionData.getDefault()
      : durationVeryFast = const Duration(milliseconds: 100),
        durationFast = const Duration(milliseconds: 200),
        durationNormal = const Duration(milliseconds: 300),
        durationSlow = const Duration(milliseconds: 500);

  final Duration durationVeryFast;
  final Duration durationFast;
  final Duration durationNormal;
  final Duration durationSlow;

  @override
  MotionData copyWith({
    Duration? durationVeryFast,
    Duration? durationFast,
    Duration? durationNormal,
    Duration? durationSlow,
  }) {
    return MotionData(
      durationVeryFast: durationVeryFast ?? this.durationVeryFast,
      durationFast: durationFast ?? this.durationFast,
      durationNormal: durationNormal ?? this.durationNormal,
      durationSlow: durationSlow ?? this.durationSlow,
    );
  }

  @override
  MotionData lerp(ThemeExtension<MotionData>? other, double t) {
    if (other is! MotionData) {
      return this;
    }

    return other;
  }
}

extension MotionDataExtension on ThemeData {
  MotionData get colorLook => extension<MotionData>()!;
}
