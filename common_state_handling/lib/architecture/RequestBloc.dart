

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

/// Bloc that's holds common states for the API call.
///
abstract class RequestBloc<T> extends Bloc<dynamic, RequestBlocStates<T>> {
  @override
  List<Object> get props => [];
}

abstract class RequestBlocStates<T> extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading<T> extends RequestBlocStates<T> {}
class RequestError<T> extends RequestBlocStates<T> {
  final int code;
  final String message;

  RequestError({this.code = 0, this.message});
}
class Content<T> extends RequestBlocStates<T> {
  final T content;

  Content(this.content);
}
