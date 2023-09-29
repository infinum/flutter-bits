import 'package:flutter/material.dart';

class Alerting extends InheritedWidget {
  const Alerting({
    super.key,
    required this.showSuccessAlert,
    required this.showErrorAlert,
    required this.alertOfException,
    required super.child,
  });

  final void Function(String) showSuccessAlert;
  final void Function(String) showErrorAlert;
  final void Function(Object) alertOfException;

  @override
  bool updateShouldNotify(Alerting oldWidget) {
    return false;
  }

  static Alerting of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Alerting>()!;
  }
}
