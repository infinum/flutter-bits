import 'package:common_state_handling/architecture/state/bloc_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_bloc_state.freezed.dart';

@freezed
abstract class RequestStateUnion<T> extends BlocState<T> with _$RequestStateUnion<T> {
  const factory RequestStateUnion() = InitialState<T>;
  const factory RequestStateUnion.loading() = Loading<T>;
  const factory RequestStateUnion.error(Object error, {StackTrace stack}) = ErrorDetails<T>;
  const factory RequestStateUnion.success(T content) = Content<T>;
}
