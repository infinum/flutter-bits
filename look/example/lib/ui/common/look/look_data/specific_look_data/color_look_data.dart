import 'package:flutter/material.dart';
import 'package:look/ui/common/look/look_data/specific_look_data/colors/neutral_color.dart';

class ColorLookData extends ThemeExtension<ColorLookData> {
  const ColorLookData({required this.attentionColor, required this.neutral});

  const ColorLookData.getDefault()
      : attentionColor = const Color(0xfffdbf2f),
        neutral = const NeutralColor(0xFF12335B, {
          100: Color(0xFF12335B),
          80: Color(0xFF415C7C),
          60: Color(0xFF71859D),
          40: Color(0xFFA0ADBD),
          30: Color(0xFFD0D6DE),
          20: Color(0xFFE9ECF0),
          10: Color(0xFFF5F6F7),
          0: Color(0xFFFFFFFF),
        });

  // Color not in material scheme
  final Color attentionColor;

  // Custom color swatch not in material scheme
  final NeutralColor neutral;

  @override
  ColorLookData copyWith({Color? attentionColor, NeutralColor? neutral}) {
    return ColorLookData(
      attentionColor: attentionColor ?? this.attentionColor,
      neutral: neutral ?? this.neutral,
    );
  }

  @override
  ThemeExtension<ColorLookData> lerp(ThemeExtension<ColorLookData>? other, double t) {
    if (other is! ColorLookData) {
      return this;
    }

    return ColorLookData(
      attentionColor: Color.lerp(attentionColor, other.attentionColor, t) ?? other.attentionColor,
      neutral: other.neutral,
    );
  }
}
