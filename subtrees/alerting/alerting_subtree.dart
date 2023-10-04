import 'package:flutter/material.dart';

class AlertingSubtree extends StatefulWidget {
  const AlertingSubtree({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AlertingSubtree> createState() => _AlertingSubtreeState();
}

class _AlertingSubtreeState extends State<AlertingSubtree> {
  void _showSuccessAlert(String text) {
    _showAlert(
      SuccessAlert(text),
    );
  }

  void _showErrorAlert(String text) {
    _showAlert(
      ErrorAlert(text),
    );
  }

  void _alertOfException(Object exception) {
    _showErrorAlert(
      ExceptionFormatter.format(exception, context: context),
    );
  }

  void _showAlert(Widget alert) {
    // Complex logic for showing an alert
  }

  @override
  Widget build(BuildContext context) {
    return Alerting(
      showSuccessAlert: _showSuccessAlert,
      showErrorAlert: _showErrorAlert,
      alertOfException: _alertOfException,
      child: widget.child,
    );
  }
}
