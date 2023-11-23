import 'dart:async';

import 'package:flutter/material.dart';

typedef InputErrorTextDebouncerWidgetBuilder = Widget Function(
    BuildContext context, String? errorText, VoidCallback debounce);

class InputErrorTextDebouncer extends StatefulWidget {
  const InputErrorTextDebouncer({
    super.key,
    this.errorText,
    required this.builder,
  });

  final String? errorText;
  final InputErrorTextDebouncerWidgetBuilder builder;

  @override
  State<InputErrorTextDebouncer> createState() => _InputErrorTextDebouncerState();
}

class _InputErrorTextDebouncerState extends State<InputErrorTextDebouncer> {
  static const _debounceDuration = Duration(milliseconds: 500);

  String? _errorText;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _errorText = widget.errorText;
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant InputErrorTextDebouncer oldWidget) {
    super.didUpdateWidget(oldWidget);
    _didUpdateErrorText(widget.errorText);
  }

  void _didUpdateErrorText(String? newErrorText) {
    final shouldBeShowingErrorText = newErrorText != null;
    if (!shouldBeShowingErrorText) {
      _debounceTimer?.cancel();
      _errorText = null;
      return;
    }

    final alreadyShowingErrorText = _errorText != null;
    if (alreadyShowingErrorText) {
      _debounceTimer?.cancel();
      _errorText = newErrorText;
      return;
    }

    final scheduledToShowErrorText = _debounceTimer?.isActive ?? false;
    if (!scheduledToShowErrorText) {
      _debounceTimer = Timer(_debounceDuration, _onDebounceTimerFinished);
    }
  }

  void _onDebounceTimerFinished() {
    setState(() {
      _errorText = widget.errorText;
    });
  }

  void _debounce() {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
      _debounceTimer = Timer(_debounceDuration, _onDebounceTimerFinished);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _errorText, _debounce);
  }
}
