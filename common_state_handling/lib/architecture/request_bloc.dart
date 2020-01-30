import 'package:bloc/bloc.dart';
import 'package:common_state_handling/architecture/event/bloc_event.dart';
import 'package:common_state_handling/architecture/event/request_event.dart';
import 'package:common_state_handling/architecture/request/blocking_request.dart';
import 'package:common_state_handling/architecture/state/bloc_state.dart';
import 'package:common_state_handling/architecture/state/request_bloc_state.dart';

import '../api_service.dart';
import '../api_service.dart';

/// Request bloc that has default functionality to call api, parse result
/// and show error or content after it is finished.
///
/// These request states are:
/// - [InitialState]
/// - [LoadingState]
/// - [ErrorState]
/// - [ContentState]
///
/// This is designed to be used with [InLayoutRequestWidget] or
/// [BlockingRequestWidget] to make whole thing automatic
abstract class RequestBloc<T> extends Bloc<BlocEvent<T>, BlocState<T>> {

  /// Initial state, everything is null and loading is set to false
  @override
  BlocState<T> get initialState => InitialState<T>();

  /// Automatically handles only [MakeRequest] event
  /// all other events are being forwarded to method that has to be overridden  [mapEvent]
  @override
  Stream<BlocState<T>> mapEventToState(BlocEvent<T> event) async* {
    if(event is MakeRequest<T>){
      yield LoadingState<T>();

      try{
        final T content = await event.request;
        yield ContentState<T>(content);
      }catch(error, stackTrace){
        yield ErrorState<T>(error, stackTrace);
      }
    }else{
       yield* mapEvent(event);
    }
  }

  /// Events that could not be handled by this [RequestBloc] are forwarded here
  Stream<BlocState<T>> mapEvent(BlocEvent<T> event);
}