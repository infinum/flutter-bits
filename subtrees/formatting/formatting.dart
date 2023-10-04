import 'package:flutter/material.dart';

class Formatting extends InheritedWidget {
  const Formatting({
    super.key,
    required this.dateTime,
    required this.user,
    required super.child,
  });

  final DateTimeFormatter dateTime;
  final UserFormatter user;

  @override
  bool updateShouldNotify(Formatting oldWidget) {
    return dateTime != oldWidget.dateTime || user != oldWidget.user;
  }

  static Formatting of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Formatting>()!;
  }
}
