

import 'dart:io';

import 'package:common_state_handling/architecture/RequestBloc.dart';

/// This handles all kinds of exceptions adn returns common RequestError state
///
/// todo: should be expanded with common errors that http client throws
/// e.g. no internet, 400, 403 etc.
class GenericErrorHandler<T> {

  RequestError<T> getError(dynamic err) {
    if (err is HttpException) {
      // this is just example, i don't know what exception http client throws
      return RequestError<T>(message: err.message);
    } else {
      return RequestError<T>(message: "Unexpected error.");
    }
  }

}