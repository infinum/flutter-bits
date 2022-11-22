import 'package:flutter/material.dart';
import 'package:look/ui/common/bits_theme/specific_data/colors/neutral_color.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({required this.attentionColor, required this.neutral});

  const CustomColors.getDefault()
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
  CustomColors copyWith({Color? attentionColor, NeutralColor? neutral}) {
    return CustomColors(
      attentionColor: attentionColor ?? this.attentionColor,
      neutral: neutral ?? this.neutral,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }

    return CustomColors(
      attentionColor: Color.lerp(attentionColor, other.attentionColor, t) ?? other.attentionColor,
      neutral: other.neutral,
    );
  }
}

extension CustomColorsData on ThemeData {
  CustomColors get colorLook => extension<CustomColors>()!;
}
