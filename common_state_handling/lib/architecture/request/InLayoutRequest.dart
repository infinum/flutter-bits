

import 'package:common_state_handling/architecture/request/BlockingRequest.dart';
import 'package:common_state_handling/architecture/widgets/GenericError.dart';
import 'package:common_state_handling/architecture/widgets/GenericLoading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../RequestBloc.dart';

class InLayoutRequest<T, BLOC extends RequestBloc<T>> extends StatefulWidget {
  final StateBuilder<T> builder;
  final Function performRequest;
  final Widget Function(BuildContext) buildLoading;
  final Widget Function(BuildContext, RequestError) buildError;
  final retryEnabled;

  const InLayoutRequest(
      {Key key, this.builder, this.performRequest, this.buildLoading, this.buildError, this.retryEnabled = false})
      : super(key: key);

  @override
  _InLayoutRequestState<T, BLOC> createState() =>
      _InLayoutRequestState<T, BLOC>();
}

class _InLayoutRequestState<T, BLOC extends RequestBloc<T>>
    extends State<InLayoutRequest<T, BLOC>> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BLOC, RequestBlocStates<T>>(builder: (context, state) {

      if (state is Loading) {
        if (widget.buildLoading != null) {
          return widget.buildLoading(context);
        } else {
          return GenericLoading();
        }
      }
      if (state is RequestError) {
        return getErrorWidget(state as RequestError);
      }
      if (state is Content) {
        final t = (state as Content).content as T;
        return widget.builder(context, t);
      }

      return null;
    });
  }


  Widget getErrorWidget(RequestError<T> state) {
    if (widget.buildError == null) {
      return getGenericError(state);
    } else {
      final w = widget.buildError(context, state);
      return w ?? getGenericError(state);
    }
  }

  Widget getGenericError(RequestError<T> state) {
    return GenericError(error: state, retryEnabled: widget.retryEnabled, onRetry: widget.performRequest);
  }

  @override
  void initState() {
    super.initState();
    if (widget.performRequest != null) {
      widget.performRequest();
    }
  }
}