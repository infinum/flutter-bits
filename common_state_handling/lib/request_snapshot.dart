import 'package:common_state_handling/architecture/state/request_bloc_state.dart';
/// This is copy of AsyncSnapshot and AsyncWidgetBuilder with
/// little modification to make it work better with bloc and with requests
///
/// This has 4 states instead of 3 from [AsyncSnapshot]
/// [RequestSnapshot..initial] - nothing has happened, request was not sent and we don't have any data
/// [RequestSnapshot.loading] - request has been sent and we are waiting for result
/// [RequestSnapshot.withData] - request completed successfully and has data
/// [RequestSnapshot.withError] - request completed unsuccessfully and has error

import 'package:flutter/material.dart';

//typedef RequestWidgetBuilder<T> = Widget Function(BuildContext context, RequestSnapshot<T> snapshot);
typedef SuccessRequestWidgetBuilder<T> = Widget Function(BuildContext context, T data);
typedef RequestWidgetBuilder<T> = Widget Function(BuildContext context);
typedef ErrorRequestWidgetBuilder<T> = Widget Function(BuildContext context, ErrorState errorState);

/// From [data], [error] only one can have something, and [isLoading] can
/// be true only if both [data] and [error] are empty
class RequestSnapshot<T> {
  /// Creates an [RequestSnapshot] with the specified [connectionState],
  /// and optionally either [data] or [error] (but not both).
  const RequestSnapshot._(this.data, this.error, this.isLoading, this.isInitial) :
      assert(!(data != null && error != null));

  /// Creates an [RequestSnapshot] in [ConnectionState.none] with null data and error.
  const RequestSnapshot.initial() : this._(null, null, false, true);

  const RequestSnapshot.loading() : this._(null, null, true, false);

  /// Creates an [RequestSnapshot] in the specified [state] and with the specified [data].
  const RequestSnapshot.withData(T data) : this._(data, null, false, false);

  /// Creates an [RequestSnapshot] in the specified [state] and with the specified [error].
  const RequestSnapshot.withError(Object error) : this._(null, error, false, false);

  /// The latest data received by the asynchronous computation.
  ///
  /// If this is non-null, [hasData] will be true.
  ///
  /// If [error] is not null, this will be null. See [hasError].
  ///
  /// If the asynchronous computation has never returned a value, this may be
  /// set to an initial data value specified by the relevant widget. See
  /// [FutureBuilder.initialData] and [StreamBuilder.initialData].
  final T data;

  /// Initial state before event for request is triggered.
  final bool isInitial;

  final bool isLoading;

  /// Returns latest data received, failing if there is no data.
  ///
  /// Throws [error], if [hasError]. Throws [StateError], if neither [hasData]
  /// nor [hasError].
  T get requireData {
    if (hasData)
      return data;
    if (hasError)
      throw error;
    throw StateError('Snapshot has neither data nor error');
  }

  /// The latest error object received by the asynchronous computation.
  ///
  /// If this is non-null, [hasError] will be true.
  ///
  /// If [data] is not null, this will be null.
  final Object error;

  /// Returns whether this snapshot contains a non-null [data] value.
  ///
  /// This can be false even when the asynchronous computation has completed
  /// successfully, if the computation did not return a non-null value. For
  /// example, a [Future<void>] will complete with the null value even if it
  /// completes successfully.
  bool get hasData => data != null;

  /// Returns whether this snapshot contains a non-null [error] value.
  ///
  /// This is always true if the asynchronous computation's last result was
  /// failure.
  bool get hasError => error != null;

  @override
  String toString() => 'Request snapshot: $isLoading - $data - $error';

  @override
  bool operator ==(Object other) {
    if (identical(this, other))
      return true;
    return other is RequestSnapshot<T>
      && other.isLoading == isLoading
      && other.data == data
      && other.error == error;
  }

  @override
  int get hashCode => hashValues(data, error, isLoading);
}