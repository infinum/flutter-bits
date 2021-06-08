import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Hook that returns the provider and calls [onInit] exactly once.
///
/// This is designed to be used with init method on provider to initialize some runtime dependencies.
T useInitProvider<T>(ProviderListenable<T> provider, Function(T) onInit) {
  final T _provider = useProvider<T>(provider);
  return use(_InitProviderHook<T>(_provider, onInit));
}

class _InitProviderHook<T> extends Hook<T> {
  const _InitProviderHook(this.provider, this._onInit);

  final Function(T) _onInit;
  final T provider;

  @override
  _InitProviderHookState<T> createState() => _InitProviderHookState();
}

class _InitProviderHookState<T> extends HookState<T, _InitProviderHook<T>> {
  bool inited = false;

  @override
  void initHook() {
    super.initHook();

    if (!inited) {
      inited = true;
      hook._onInit.call(hook.provider);
    }
  }

  @override
  void didUpdateHook(_InitProviderHook<T> oldHook) {
    super.didUpdateHook(oldHook);
  }

  @override
  T build(BuildContext context) {
    return hook.provider;
  }

  @override
  String get debugLabel => 'useInitProvider';

  @override
  bool get debugSkipValue => true;
}
