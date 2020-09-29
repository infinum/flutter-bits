import 'package:common_state_handling/architecture/event/bloc_event.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_bloc_event.freezed.dart';

@freezed
abstract class RequestEventUnion<T> extends BlocEvent<T> with _$RequestEventUnion<T> {
  factory RequestEventUnion.makeRequest(Future<T> request) = MakeRequest<T>;
}
