import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A hook that prevents a provider from being automatically disposed.
///
/// This hook listens to a provider (similarly to [useProvider]), without triggering a rebuild when the provider value changes.
///
/// Example:
///
/// ```dart
/// class Example extends HookWidget {
///   @override
///   Widget build(BuildContext context) {
///     useProviderKeepAlive(counterProvider);
///     return Container();
///   }
/// }
/// ```
///
/// As long as the `Example` widget is in the widget tree, the `counterProvider` will not get disposed.
/// When the `counterProvider` value changes the `Example` widget will not get rebuild.
void useProviderKeepAlive(ProviderListenable provider) {
  final container = ProviderScope.containerOf(useContext());
  use<void>(_ProviderKeepAliveHook(container, provider));
}

class _ProviderKeepAliveHook extends Hook<void> {
  const _ProviderKeepAliveHook(this._container, this._providerListenable);

  final ProviderContainer _container;
  final ProviderListenable _providerListenable;

  @override
  _ProviderKeepAliveHookState createState() => _ProviderKeepAliveHookState();
}

class _ProviderKeepAliveHookState extends HookState<void, _ProviderKeepAliveHook> {
  ProviderSubscription? _link;

  @override
  void initHook() {
    super.initHook();
    _listen();
  }

  void _listen() {
    _link?.close();
    _link = hook._container.listen<dynamic>(
      hook._providerListenable,
    );
  }

  @override
  void build(BuildContext context) {}

  @override
  void didUpdateHook(_ProviderKeepAliveHook oldHook) {
    super.didUpdateHook(oldHook);
    assert(
      oldHook._providerListenable.runtimeType == hook._providerListenable.runtimeType,
      'The provider listened cannot change',
    );

    if (oldHook._container != hook._container) {
      _listen();
    } else if (oldHook._providerListenable != hook._providerListenable) {
      _listen();
    }
  }

  @override
  void dispose() {
    _link!.close();
    super.dispose();
  }
}
