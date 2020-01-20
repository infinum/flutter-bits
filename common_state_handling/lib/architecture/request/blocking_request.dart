import 'package:common_state_handling/architecture/request/in_layout_request.dart';
import 'package:common_state_handling/architecture/request_bloc.dart';
import 'package:common_state_handling/architecture/show_dialog.dart';
import 'package:common_state_handling/architecture/state/bloc_state.dart';
import 'package:common_state_handling/architecture/state/request_bloc_state.dart';
import 'package:common_state_handling/architecture/widgets/generic_error.dart';
import 'package:common_state_handling/architecture/widgets/generic_loading.dart';
import 'package:common_state_handling/request_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// To use [BlockingRequest] bloc that we pass as [T] has to extend [RequestBloc]
/// because this layout will only listen for [LoadingState], [ErrorState] and [ContentState]
///
/// It will send [RequestSnapshot] to the builder, builder should figure out what it
/// wants to do with that data. Unlike [InLayoutRequestWidget] this widget will block rest of the views behind
/// dialog that can't be dismissed.
///
/// Custom layout for dialog can be passed with [RequestWidgetBuilder].
/// Loading and error widgets can be passed as null and they will then be replaced by generic widgets [GenericError] and [GenericLoading]
///
/// [E] is type you want returned.
/// [MakeRequest] will be called and it needs to parse data to [E], then [ContentState] is called
/// with [E] set as it's content. When this widget gets [ContentState] it will send it to
/// builder with [RequestSnapshot.withData]
class BlockingRequest<E, T extends RequestBloc<E>> extends StatefulWidget{
  const BlockingRequest(this.bloc, {Key key,
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
  _BlockingRequestState<E, T> createState() => _BlockingRequestState<E, T>();
}

class _BlockingRequestState<E, T extends RequestBloc<E>> extends State<BlockingRequest<E, T>> {
  bool _dialogShown = false;

  @override
  Widget build(BuildContext context) {
    // If performRequest is not null then execute it
    if(widget.performRequest != null){
      widget.performRequest();
    }

    return BlocListener<T, BlocState<E>>(
      bloc: widget.bloc,
      listener: (BuildContext context, BlocState<E> state){
        // Close any existing dialogs
        if(_dialogShown){
          Navigator.pop(context);
          _dialogShown = false;
        }

        if(state is LoadingState<E>){
          _showDialog('Loading', widget.builder(context, RequestSnapshot<E>.loading()) ?? GenericLoading());
        }

        if(state is ErrorState<E>){
          _showDialog('Error', widget.builder(context, RequestSnapshot<E>.withError(state.error)) ?? GenericError(error: state.error,));
        }
      },
      child: BlocBuilder<T, BlocState<E>>(
        bloc: widget.bloc,
        builder: (BuildContext context, BlocState<E> state){
          if(state is ContentState<E>){
            return widget.builder(context, RequestSnapshot<E>.withData(state.content));
          }

          return widget.builder(context, RequestSnapshot<E>.nothing());
        },
      ),
    );
  }

  Future<T> _showDialog<T>(String title, Widget child) async {
    _dialogShown = true;
    final T content = await showInfoDialog<T>(context, title, child, dismissible: false);
    _dialogShown = false;
    return content;
  }
}