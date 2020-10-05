import 'package:common_state_handling/architecture/request/request_widget_mixin.dart';
import 'package:common_state_handling/architecture/request_bloc.dart';
import 'package:common_state_handling/architecture/state/bloc_state.dart';
import 'package:common_state_handling/architecture/state/request_bloc_state.dart';
import 'package:common_state_handling/architecture/widgets/generic_loading.dart';
import 'package:common_state_handling/request_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// To use [InLayoutRequestWidget] bloc that we pass [E] as data the bloc [T] returns.
/// [T] has to extend [RequestBloc] and this widget will only listen for
/// [LoadingState], [ErrorState] and [ContentState]
///
/// You can only provide layout to [builder] that will be called when [ContentState] is
/// received to bloc to show the layout.
///
/// Everything else is optional.
///
/// [E] is type you want returned.
/// [MakeRequest] will be called and it needs to parse data to [E], then [ContentState] is called
/// with [E] set as it's content. When this widget gets [ContentState] it will send it to
/// builder with [RequestSnapshot.withData]
class InLayoutRequestWidget<E, T extends RequestBloc<E>> extends StatelessWidget with RequestWidgetMixin<E> {
  const InLayoutRequestWidget(
    this.bloc, {
    Key key,
    @required this.builder,
    this.performRequest,
    this.listener,
    this.buildLoading,
    this.buildInitial,
    this.buildError,
    this.retryEnabled = false,
    this.onRetry,
  }) : super(key: key);

  /// Bloc that will be put in [BlocBuilder] and we will listen to it's state changes
  /// [T] has to extend [RequestBloc]
  final T bloc;

  /// Builder for successful request
  final SuccessRequestWidgetBuilder<E> builder;

  /// What request should be performed when laying out this widget.
  ///
  /// This will usually be action that will change state of [bloc] and send
  /// new state that [BlocBuilder] will listen to
  ///
  /// [performRequest] can be null if the request shouldn't be fired right
  /// when the widget is to appear on the screen.
  final VoidCallback performRequest;

  /// This will enable retry button in case of error which will call either
  /// [onRetry] or [performRequest] if specified.
  final bool retryEnabled;

  /// Called when user clicks onRetry. [retryEnabled] must be set to true.
  final VoidCallback onRetry;

  /// Builder for loading state
  final RequestWidgetBuilder<E> buildLoading;

  /// Builder for initial state, before network request is started
  final RequestWidgetBuilder<E> buildInitial;

  /// Builder for unsuccessful request, all errors will propagate here
  /// or use common error handling
  final ErrorRequestWidgetBuilder<E> buildError;

  /// Just like [BlocConsumer] you can listen to events to do something other
  /// than building the widget, e.g. showing dialog.
  final BlocWidgetListener<BlocState<E>> listener;

  @override
  Widget build(BuildContext context) {
    // If performRequest is not null then execute it
    if (performRequest != null) {
      performRequest();
    }

    return BlocConsumer<T, BlocState<E>>(
      bloc: bloc,
      listenWhen: (previous, current) => listener != null,
      listener: (context, state) => listener(context, state),
      builder: (BuildContext context, BlocState<E> state) {
        if (state is Loading<E>) {
          return (buildLoading != null) ? buildLoading(context) : GenericLoading();
        }

        if (state is ErrorDetails<E>) {
          return getErrorWidget(context, buildError, state, retryEnabled, onRetry, performRequest);
        }

        if (state is Content<E>) {
          return builder(context, state.content);
        }

        assert(state is InitialState<E>, "Received State that is not RequestState");
        return buildInitial(context);
      },
    );
  }
}
