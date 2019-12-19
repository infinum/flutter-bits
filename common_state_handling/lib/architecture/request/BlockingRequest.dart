import 'package:after_layout/after_layout.dart';
import 'package:common_state_handling/architecture/widgets/GenericError.dart';
import 'package:common_state_handling/architecture/widgets/GenericLoading.dart';
import 'package:common_state_handling/architecture/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../RequestBloc.dart';

typedef StateBuilder<T> = Widget Function(BuildContext context, T state);

class BlockingRequest<T, BLOC extends RequestBloc<T>> extends StatefulWidget {
  final StateBuilder<T> builder;
  final Function performRequest;
  final Widget Function(BuildContext) buildLoading;
  final Widget Function(BuildContext, RequestError) buildError;
  final retryEnabled;

  const BlockingRequest(
      {Key key,
      this.builder,
      this.performRequest,
      this.buildLoading,
      this.buildError,
      this.retryEnabled = false})
      : super(key: key);

  @override
  _BlockingRequestState<T, BLOC> createState() =>
      _BlockingRequestState<T, BLOC>();
}

class _BlockingRequestState<T, BLOC extends RequestBloc<T>>
    extends State<BlockingRequest<T, BLOC>> with AfterLayoutMixin {
  var initialLoad = true;
  var dialogShown = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BLOC, RequestBlocStates<T>>(
      listener: (context, state) {
        if (dialogShown) {
          Navigator.pop(context);
        }

        if (state is Loading) {
          Widget loading = getGenericLoading(context);
          dialogShown = true;
          // Delaying because it takes ~30ms to close the old dialog
          Future.delayed(Duration(milliseconds: 30), () {
            showInfoDialog(context, "Loading", loading, dismissible: false);
          });
        }

        if (state is RequestError) {
          dialogShown = true;
          Future.delayed(Duration(milliseconds: 30), () {
            showInfoDialog(
                context, "Error", getErrorWidget(state as RequestError),
                dismissible: false);
          });
        }
      },
      child: BlocBuilder<BLOC, RequestBlocStates<T>>(builder: (context, state) {
        if (state is Content) {
          final t = (state as Content).content as T;
          return widget.builder(context, t);
        } else {
          return Container();
        }
      }),
    );
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
    return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: GenericError(
            error: state,
            retryEnabled: widget.retryEnabled,
            onRetry: widget.performRequest));
  }

  Widget getGenericLoading(BuildContext context) {
    Widget loading;
    if (widget.buildLoading != null) {
      loading = widget.buildLoading(context);
    } else {
      loading = Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: GenericLoading());
    }
    return loading;
  }

  @override
  void initState() {
    super.initState();
    if (widget.performRequest != null) {
      widget.performRequest();
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    final bloc = BlocProvider.of<BLOC>(context).initialState;
    if (bloc is Loading) {
      Widget loading = getGenericLoading(context);
      dialogShown = true;
      showInfoDialog(context, "Loading", loading, dismissible: false);
    }
  }
}
