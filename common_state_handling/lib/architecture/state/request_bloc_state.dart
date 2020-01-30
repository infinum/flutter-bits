import 'package:common_state_handling/architecture/state/bloc_state.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RequestState<T> extends BlocState<T>{
  const RequestState([List<T> props]) : super(props);
}

@immutable
class InitialState<T> extends RequestState<T>{
  const InitialState({List<T> props}) : super(props);
}

@immutable
class LoadingState<T> extends RequestState<T>{
  const LoadingState({List<T> props}) : super(props);
}

@immutable
class ErrorState<T> extends RequestState<T>{
  const ErrorState(this.error, this.stackTrace) : super();

  final Object error;
  final StackTrace stackTrace;
}

@immutable
class ContentState<T> extends RequestState<T>{
  ContentState(this.content) : super(<T>[content]);

  final T content;
}