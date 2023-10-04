import 'package:flutter/material.dart';

class FormattingSubtree extends StatefulWidget {
  const FormattingSubtree({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<FormattingSubtree> createState() => _FormattingSubtreeState();
}

class _FormattingSubtreeState extends State<FormattingSubtree> {
  late DateTimeFormatter _dateTimeFormatter;
  late UserFormatter _userFormatter;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dateTimeFormatter = DateTimeFormatter(Localizations.localeOf(context));
    _userFormatter = UserFormatter(Strings.of(context));
  }

  @override
  Widget build(BuildContext context) {
    return Formatting(
      dateTime: _dateTimeFormatter,
      user: _userFormatter,
      child: widget.child,
    );
  }
}
