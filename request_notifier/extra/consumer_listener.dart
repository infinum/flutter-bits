import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Consumer + Listener for ChangeNotifierProvider
class ConsumerListener<ProviderNotifier extends ChangeNotifier> extends StatefulWidget {
  const ConsumerListener({Key key, @required this.builder, this.listener}) : super(key: key);
  final Widget Function(BuildContext context, ProviderNotifier provider) builder;
  final Function(BuildContext context, ProviderNotifier provider) listener;

  @override
  _ConsumerListenerState createState() => _ConsumerListenerState<ProviderNotifier>();
}

class _ConsumerListenerState<ProviderNotifier extends ChangeNotifier>
    extends State<ConsumerListener<ProviderNotifier>> {
  ProviderNotifier _notifier;

  void _executeListener() {
    widget.listener(context, _notifier);
  }

  @override
  void initState() {
    super.initState();

    if (widget.listener != null) {
      _notifier = context.read<ProviderNotifier>();
      _notifier.addListener(_executeListener);
    }
  }

  @override
  void dispose() {
    if (widget.listener != null) {
      _notifier.removeListener(_executeListener);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderNotifier>(
      builder: (context, value, _) => widget.builder(context, value),
    );
  }
}

/// Listener for ChangeNotifierProvider
class ProviderListener<ProviderNotifier extends ChangeNotifier> extends StatefulWidget {
  const ProviderListener({Key key, @required this.child, this.listener}) : super(key: key);
  final Widget child;
  final Function(BuildContext context, ProviderNotifier provider) listener;

  @override
  _ProviderListenerState createState() => _ProviderListenerState<ProviderNotifier>();
}

class _ProviderListenerState<ProviderNotifier extends ChangeNotifier>
    extends State<ProviderListener<ProviderNotifier>> {
  ProviderNotifier _notifier;

  void _executeListener() {
    widget.listener(context, _notifier);
  }

  @override
  void initState() {
    super.initState();

    if (widget.listener != null) {
      _notifier = context.read<ProviderNotifier>();
      _notifier.addListener(_executeListener);
    }
  }

  @override
  void dispose() {
    if (widget.listener != null) {
      _notifier.removeListener(_executeListener);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
