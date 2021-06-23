// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Utility to ensure providers are not disposed as long as this widget is in the widget tree.
///
/// To ensure provider is kept alive, pass it to the [providers] list.
///
/// ```dart
/// ProviderKeepAlive(
///   providers: [
///     myProvider,
///   ],
///   child: Container(),
/// );
/// ```
class ProviderKeepAlive extends StatelessWidget {
  const ProviderKeepAlive({
    @required this.providers,
    @required this.child,
  });

  final List<ProviderBase> providers;
  final Widget child;

  void _watchProviders(ScopedReader watch) {
    // ignore: prefer_foreach
    for (final provider in providers) {
      watch<dynamic>(provider);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        _watchProviders(watch);
        return child;
      },
      child: child,
    );
  }
}
