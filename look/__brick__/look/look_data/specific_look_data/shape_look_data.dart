import 'package:flutter/material.dart';

class ShapeLookData extends ThemeExtension<ShapeLookData> {
  const ShapeLookData({
    required this.cardBorderRadius,
  });

  const ShapeLookData.getDefault() : cardBorderRadius = const BorderRadius.all(Radius.circular(24));

  // final ShapeBorder buttonShape;
  // final ShapeBorder circleButtonShape;
  final BorderRadius cardBorderRadius;

  @override
  ThemeExtension<ShapeLookData> copyWith({
    BorderRadius? cardBorderRadius,
  }) {
    return ShapeLookData(
      cardBorderRadius: cardBorderRadius ?? this.cardBorderRadius,
    );
  }

  @override
  ThemeExtension<ShapeLookData> lerp(ThemeExtension<ShapeLookData>? other, double t) {
    if (other is! ShapeLookData) {
      return this;
    }

    return ShapeLookData(
      cardBorderRadius: BorderRadius.lerp(cardBorderRadius, other.cardBorderRadius, t) ?? other.cardBorderRadius,
    );
  }
}
