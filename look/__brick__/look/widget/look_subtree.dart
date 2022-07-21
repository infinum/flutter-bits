import 'package:flutter/material.dart';

import '../look_data/look_data.dart';
import '../look_data/specific_look_data/color_look_data.dart';
import '../look_data/specific_look_data/motion_look_data.dart';
import '../look_data/specific_look_data/shape_look_data.dart';
import '../look_data/specific_look_data/typography_look_data.dart';
import 'look.dart';

class LookSubtree extends StatelessWidget {
  const LookSubtree({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Look(
      lookData: _createLookData(),
      child: child,
    );
  }

  LookData _createLookData() {
    return LookData(
      color: const ColorLookData.getDefault(),
      motion: const MotionLookData.getDefault(),
      shape: ShapeLookData.getDefault(),
      typography: const TypographyLookData.getDefault(),
    );
  }
}
