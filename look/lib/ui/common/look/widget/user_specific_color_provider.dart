import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:state_notifier/state_notifier.dart';

import 'look_subtree.dart';

/// This is example of provider that can change theme and colors at runtime. If you don't have this case then you
/// don't need to use this provider or [LookSubtree].
///
/// We use provider to set new primaryVariant color and refresh theme at runtime.
class UserSpecificColorProvider extends StateNotifier<Color> {
  UserSpecificColorProvider() : super(Colors.grey.shade500);

  void setNewColor(Color newColor) {
    state = newColor;
  }
}

final userSpecificColorProvider = StateNotifierProvider<UserSpecificColorProvider>((ref) {
  return UserSpecificColorProvider();
});