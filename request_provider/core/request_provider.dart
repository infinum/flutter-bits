import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:loggy/loggy.dart';

import 'request_state.dart';

abstract class RequestProvider<Value> with ChangeNotifier, NetworkLoggy {
  RequestProvider({RequestState<Value, Exception> initial = const RequestState.initial()}) {
    _requestState = initial;
  }

  RequestState<Value, Exception> _requestState;

  RequestState<Value, Exception> get state => _requestState;

  bool _mounted = true;

  set _state(RequestState<Value, Exception> state) {
    _requestState = state;

    if (_mounted) {
      notifyListeners();
    }
  }

  Future<void> executeRequest({
    @required ValueGetter<Future<Value>> requestBuilder,
    ValueChanged<Value> valueHandler,
    ValueChanged<Exception> errorHandler,
  }) async {
    try {
      _state = _requestState.maybeMap(
          success: (r) => RequestState.loading(resultMaybe: r.value), orElse: () => const RequestState.loading());

      final value = await requestBuilder();
      if (value == null) {
        _state = RequestState.success(Void as Value);
      } else {
        _state = RequestState.success(value);
      }

      valueHandler?.call(value);
    } catch (error, st) {
      loggy.error('Request error', error, st);
      final exception = (error is Exception) ? error : Exception();
      _state = RequestState.failure(exception);
      errorHandler?.call(exception);
    }
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  void reset() => _state = const RequestState.initial();
}
