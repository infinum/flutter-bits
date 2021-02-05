import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

/// Widget that can be used to listen for streams on provider.
///
/// Listen to widgets in [onListen].
/// For easy canceling add them to disposable:
///
/// ```
/// onListen: (compositeSubscription) {
///   stream.listen().addTo(compositeSubscription)
/// }
/// ```
class DisposableListener extends StatefulWidget {
  const DisposableListener({Key key, this.child, @required this.onListen}) : super(key: key);

  final Widget child;
  final Function(CompositeSubscription) onListen;

  @override
  _DisposableListenerState createState() => _DisposableListenerState();
}

class _DisposableListenerState extends State<DisposableListener> {

  final _compositeSubscription = CompositeSubscription();

  @override
  void initState() {
    super.initState();
    widget.onListen(_compositeSubscription);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox.shrink();
  }

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }
}
