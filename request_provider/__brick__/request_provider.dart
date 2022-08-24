import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loggy/loggy.dart';

import 'request_state.dart';

abstract class RequestProvider<Value> extends StateNotifier<RequestState<Value, Exception>> with NetworkLoggy {
  RequestProvider({RequestState<Value, Exception> initial = const RequestState.initial()}) : super(initial);

  Future<void> executeRequest({
    required ValueGetter<Future<Value>> requestBuilder,
    Exception? Function(Exception)? errorHandler,
  }) async {
    try {
      state = state.maybeMap(
        success: (result) => RequestState.loading(resultMaybe: result.value),
        orElse: () => RequestState<Value, Exception>.loading(),
      );

      final value = await requestBuilder();
      state = RequestState.success(value);
    } catch (error, st) {
      loggy.error('Request Error', error, st);
      final exception = (error is Exception) ? error : Exception();
      final stateException = errorHandler != null ? errorHandler(exception) : exception;
      if (stateException != null) {
        state = RequestState.failure(stateException);
      } else {
        state = const RequestState.initial();
      }
    }
  }

  void reset() => state = const RequestState.initial();
}
