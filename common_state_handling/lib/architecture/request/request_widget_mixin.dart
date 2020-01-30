import 'package:common_state_handling/architecture/state/request_bloc_state.dart';
import 'package:common_state_handling/architecture/widgets/generic_error.dart';
import 'package:flutter/material.dart';
import 'package:common_state_handling/request_snapshot.dart';

abstract class RequestWidgetMixin<E> {
  Widget getErrorWidgetWithButton(
      BuildContext context,
      ErrorRequestWidgetBuilder<E> buildError,
      ErrorState<E> state,
      bool retryEnabled,
      VoidCallback onRetry,
      VoidCallback performRequest,
      VoidCallback onPressed
      ) {
    return Column(children: <Widget>[
      getErrorWidget(context, buildError, state, retryEnabled, onRetry, performRequest),
      SizedBox(height: 16,),
      FlatButton(child: Text("OK"), onPressed: onPressed,)
    ],);
  }

  Widget getErrorWidget(
      BuildContext context,
      ErrorRequestWidgetBuilder<E> buildError,
      ErrorState<E> state,
      bool retryEnabled,
      VoidCallback onRetry,
      VoidCallback performRequest) {
    if (buildError == null) {
      return GenericError(
        error: state,
        retryEnabled: retryEnabled,
        onRetry: _getRetryCallback(retryEnabled, onRetry, performRequest),
      );
    } else {
      final w = buildError(context, state);
      return w ??
          GenericError(
            error: state,
            retryEnabled: retryEnabled,
            onRetry: _getRetryCallback(retryEnabled, onRetry, performRequest),
          );
    }
  }

  VoidCallback _getRetryCallback(
      bool retryEnabled, VoidCallback onRetry, VoidCallback performRequest) {
    if (retryEnabled) {
      assert(onRetry != null || performRequest != null,
          "Retry is enabled, but both onRetry and performRequest are null!");
      return (onRetry != null) ? onRetry : performRequest;
    }
  }
}
