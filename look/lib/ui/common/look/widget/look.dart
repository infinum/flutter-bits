import 'package:flutter/material.dart';

import '../look_data/look_data.dart';

/// Simple inherited widget that allows us to do Look.of(context) just like theme works
class Look extends InheritedWidget {
  const Look({
    required this.lookData,
    required Widget child,
  }) : super(child: child);

  final LookData lookData;

  @override
  bool updateShouldNotify(Look oldWidget) {
    return lookData != oldWidget.lookData;
  }

  static LookData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Look>()!.lookData;
  }
}
