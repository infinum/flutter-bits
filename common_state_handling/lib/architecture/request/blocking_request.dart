import 'package:common_state_handling/architecture/request/in_layout_request.dart';
import 'package:common_state_handling/architecture/request/request_widget_mixin.dart';
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
/// You can only provide layout to [builder] that will be called when [ContentState] is
/// received to bloc to show the layout.
///
/// Everything else is optional. This includes [buildError] and [buildLoading] which
/// are shown inside the dialog.
///
/// [E] is type you want returned.
/// [MakeRequest] will be called and it needs to parse data to [E], then [ContentState] is called
/// with [E] set as it's content. When this widget gets [ContentState] it will send it to
/// builder with [RequestSnapshot.withData]
class BlockingRequestWidget<E, T extends RequestBloc<E>> extends StatefulWidget {

  const BlockingRequestWidget(this.bloc, {
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
  _BlockingRequestWidgetState<E, T> createState() =>
      _BlockingRequestWidgetState<E, T>();
}

class _BlockingRequestWidgetState<E, T extends RequestBloc<E>>
    extends State<BlockingRequestWidget<E, T>> with RequestWidgetMixin<E> {

  bool _dialogShown = false;

  Widget build(BuildContext context) {
    return BlocListener<T, BlocState<E>>(
      listener: (context, state) {
        if (_dialogShown) {
          Navigator.pop(context);
        }

        // Optional listener can be provided to this widget, so we call it here
        if (widget.listener != null) {
          widget.listener(context, state);
        }

        if (state is LoadingState<E>) {
          final loadingWidget = (widget.buildLoading != null) ? widget
              .buildLoading(context) : GenericLoading();
          _showDialog('Loading', loadingWidget);
        }

        if (state is ErrorState<E>) {
          final errorWidget = getErrorWidgetWithButton(
              context, widget.buildError, state, widget.retryEnabled,
              widget.onRetry, widget.performRequest, () {
            Navigator.pop(context);
          });
          _showDialog('Error', errorWidget, dismissible: true);
        }
      },
      child: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    // If performRequest is not null then execute it
    if (widget.performRequest != null) {
      widget.performRequest();
    }

    return BlocBuilder<T, BlocState<E>>(
      bloc: widget.bloc,
      builder: (BuildContext context, BlocState<E> state) {
        if (state is ContentState<E>) {
          return widget.builder(context, state.content);
        }

        if (widget.buildInitial == null) {
          return SizedBox.shrink();
        } else {
          return widget.buildInitial(context);
        }
      },
    );
  }


  Future<T> _showDialog<T>(String title, Widget child, { bool dismissible = false}) async {
    _dialogShown = true;
    final T content = await showInfoDialog<T>(context, title, child, dismissible: dismissible);
    _dialogShown = false;
    return content;
  }

}