import 'package:common_state_handling/architecture/request_bloc.dart';
import 'package:common_state_handling/architecture/state/bloc_state.dart';
import 'package:common_state_handling/architecture/state/request_bloc_state.dart';
import 'package:common_state_handling/architecture/widgets/generic_error.dart';
import 'package:common_state_handling/architecture/widgets/generic_loading.dart';
import 'package:common_state_handling/request_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// To use [InLayoutRequestWidget] bloc that we pass as [T] has to extend [RequestBloc]
/// because this layout will only listen for [LoadingState], [ErrorState] and [ContentState]
///
/// It will send [RequestSnapshot] to the builder, builder should figure out what it
/// wants to do with that data.
///
/// [E] is type you want returned.
/// [MakeRequest] will be called and it needs to parse data to [E], then [ContentState] is called
/// with [E] set as it's content. When this widget gets [ContentState] it will send it to
/// builder with [RequestSnapshot.withData]
class InLayoutRequestWidget<E, T extends RequestBloc<E>> extends StatelessWidget{
  const InLayoutRequestWidget(this.bloc, {Key key,
    @required this.builder,
    this.performRequest,
  }) : super(key: key);

  /// Bloc that will be put in [BlocBuilder] and we will listen to it's state changes
  /// [T] has to extend [RequestBloc]
  final T bloc;

  /// What request should be performed when laying out this widget
  /// [performRequest] can be null and won't do anything if it is null
  ///
  /// This will usually be action that will change state of [bloc] and send
  /// new state that [BlocBuilder] will listen to
  final VoidCallback performRequest;

  /// [RequestWidgetBuilder] will send [RequestSnapshot] that is like [AsyncSnapshot]
  /// with one more state. Useful for handling multiple widget states in same widget.
  final RequestWidgetBuilder<E> builder;

  @override
  Widget build(BuildContext context) {
    // If performRequest is not null then execute it
    if(performRequest != null){
      performRequest();
    }

    return BlocBuilder<T, BlocState<E>>(
      bloc: bloc,
      builder: (BuildContext context, BlocState<E> state){
        if(state is LoadingState<E>){
          return builder(context, RequestSnapshot<E>.loading()) ?? GenericLoading();
        }

        if(state is ErrorState<E>){
          return builder(context, RequestSnapshot<E>.withError(state.error)) ?? GenericError(error: state.error);
        }

        if(state is ContentState<E>){
          return builder(context, RequestSnapshot<E>.withData(state.content));
        }

        return builder(context, RequestSnapshot<E>.nothing());
      },
    );
  }
}