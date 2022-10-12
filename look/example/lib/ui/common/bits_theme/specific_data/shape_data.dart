import 'package:flutter/material.dart';

class ShapeData extends ThemeExtension<ShapeData> {
  const ShapeData({
    required this.cardBorderRadius,
  });

  const ShapeData.getDefault() : cardBorderRadius = const BorderRadius.all(Radius.circular(24));

  // final ShapeBorder buttonShape;
  // final ShapeBorder circleButtonShape;
  final BorderRadius cardBorderRadius;

  @override
  ShapeData copyWith({
    BorderRadius? cardBorderRadius,
  }) {
    return ShapeData(
      cardBorderRadius: cardBorderRadius ?? this.cardBorderRadius,
    );
  }

  @override
  ShapeData lerp(ThemeExtension<ShapeData>? other, double t) {
    if (other is! ShapeData) {
      return this;
    }

    return ShapeData(
      cardBorderRadius: BorderRadius.lerp(cardBorderRadius, other.cardBorderRadius, t) ?? other.cardBorderRadius,
    );
  }
}

extension ShapeDataExtension on ThemeData {
  ShapeData get colorLook => extension<ShapeData>()!;
}
