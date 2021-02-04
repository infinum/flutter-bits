// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RequestStateTearOff {
  const _$RequestStateTearOff();

// ignore: unused_element
  RequestStateInitial<Value, Error> initial<Value, Error extends Exception>() {
    return RequestStateInitial<Value, Error>();
  }

// ignore: unused_element
  RequestStateLoading<Value, Error> loading<Value, Error extends Exception>(
      {Value resultMaybe}) {
    return RequestStateLoading<Value, Error>(
      resultMaybe: resultMaybe,
    );
  }

// ignore: unused_element
  RequestStateSuccess<Value, Error> success<Value, Error extends Exception>(
      Value result) {
    return RequestStateSuccess<Value, Error>(
      result,
    );
  }

// ignore: unused_element
  RequestStateFailure<Value, Error> failure<Value, Error extends Exception>(
      Error error) {
    return RequestStateFailure<Value, Error>(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RequestState = _$RequestStateTearOff();

/// @nodoc
mixin _$RequestState<Value, Error extends Exception> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(Value resultMaybe),
    @required Result success(Value result),
    @required Result failure(Error error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(Value resultMaybe),
    Result success(Value result),
    Result failure(Error error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(RequestStateInitial<Value, Error> value),
    @required Result loading(RequestStateLoading<Value, Error> value),
    @required Result success(RequestStateSuccess<Value, Error> value),
    @required Result failure(RequestStateFailure<Value, Error> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(RequestStateInitial<Value, Error> value),
    Result loading(RequestStateLoading<Value, Error> value),
    Result success(RequestStateSuccess<Value, Error> value),
    Result failure(RequestStateFailure<Value, Error> value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $RequestStateCopyWith<Value, Error extends Exception, $Res> {
  factory $RequestStateCopyWith(RequestState<Value, Error> value,
          $Res Function(RequestState<Value, Error>) then) =
      _$RequestStateCopyWithImpl<Value, Error, $Res>;
}

/// @nodoc
class _$RequestStateCopyWithImpl<Value, Error extends Exception, $Res>
    implements $RequestStateCopyWith<Value, Error, $Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  final RequestState<Value, Error> _value;
  // ignore: unused_field
  final $Res Function(RequestState<Value, Error>) _then;
}

/// @nodoc
abstract class $RequestStateInitialCopyWith<Value, Error extends Exception,
    $Res> {
  factory $RequestStateInitialCopyWith(RequestStateInitial<Value, Error> value,
          $Res Function(RequestStateInitial<Value, Error>) then) =
      _$RequestStateInitialCopyWithImpl<Value, Error, $Res>;
}

/// @nodoc
class _$RequestStateInitialCopyWithImpl<Value, Error extends Exception, $Res>
    extends _$RequestStateCopyWithImpl<Value, Error, $Res>
    implements $RequestStateInitialCopyWith<Value, Error, $Res> {
  _$RequestStateInitialCopyWithImpl(RequestStateInitial<Value, Error> _value,
      $Res Function(RequestStateInitial<Value, Error>) _then)
      : super(_value, (v) => _then(v as RequestStateInitial<Value, Error>));

  @override
  RequestStateInitial<Value, Error> get _value =>
      super._value as RequestStateInitial<Value, Error>;
}

/// @nodoc
class _$RequestStateInitial<Value, Error extends Exception>
    with DiagnosticableTreeMixin
    implements RequestStateInitial<Value, Error> {
  const _$RequestStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestState<$Value, $Error>.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'RequestState<$Value, $Error>.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestStateInitial<Value, Error>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(Value resultMaybe),
    @required Result success(Value result),
    @required Result failure(Error error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(Value resultMaybe),
    Result success(Value result),
    Result failure(Error error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(RequestStateInitial<Value, Error> value),
    @required Result loading(RequestStateLoading<Value, Error> value),
    @required Result success(RequestStateSuccess<Value, Error> value),
    @required Result failure(RequestStateFailure<Value, Error> value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(RequestStateInitial<Value, Error> value),
    Result loading(RequestStateLoading<Value, Error> value),
    Result success(RequestStateSuccess<Value, Error> value),
    Result failure(RequestStateFailure<Value, Error> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RequestStateInitial<Value, Error extends Exception>
    implements RequestState<Value, Error> {
  const factory RequestStateInitial() = _$RequestStateInitial<Value, Error>;
}

/// @nodoc
abstract class $RequestStateLoadingCopyWith<Value, Error extends Exception,
    $Res> {
  factory $RequestStateLoadingCopyWith(RequestStateLoading<Value, Error> value,
          $Res Function(RequestStateLoading<Value, Error>) then) =
      _$RequestStateLoadingCopyWithImpl<Value, Error, $Res>;
  $Res call({Value resultMaybe});
}

/// @nodoc
class _$RequestStateLoadingCopyWithImpl<Value, Error extends Exception, $Res>
    extends _$RequestStateCopyWithImpl<Value, Error, $Res>
    implements $RequestStateLoadingCopyWith<Value, Error, $Res> {
  _$RequestStateLoadingCopyWithImpl(RequestStateLoading<Value, Error> _value,
      $Res Function(RequestStateLoading<Value, Error>) _then)
      : super(_value, (v) => _then(v as RequestStateLoading<Value, Error>));

  @override
  RequestStateLoading<Value, Error> get _value =>
      super._value as RequestStateLoading<Value, Error>;

  @override
  $Res call({
    Object resultMaybe = freezed,
  }) {
    return _then(RequestStateLoading<Value, Error>(
      resultMaybe:
          resultMaybe == freezed ? _value.resultMaybe : resultMaybe as Value,
    ));
  }
}

/// @nodoc
class _$RequestStateLoading<Value, Error extends Exception>
    with DiagnosticableTreeMixin
    implements RequestStateLoading<Value, Error> {
  const _$RequestStateLoading({this.resultMaybe});

  @override
  final Value resultMaybe;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestState<$Value, $Error>.loading(resultMaybe: $resultMaybe)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestState<$Value, $Error>.loading'))
      ..add(DiagnosticsProperty('resultMaybe', resultMaybe));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestStateLoading<Value, Error> &&
            (identical(other.resultMaybe, resultMaybe) ||
                const DeepCollectionEquality()
                    .equals(other.resultMaybe, resultMaybe)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(resultMaybe);

  @override
  $RequestStateLoadingCopyWith<Value, Error, RequestStateLoading<Value, Error>>
      get copyWith => _$RequestStateLoadingCopyWithImpl<Value, Error,
          RequestStateLoading<Value, Error>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(Value resultMaybe),
    @required Result success(Value result),
    @required Result failure(Error error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading(resultMaybe);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(Value resultMaybe),
    Result success(Value result),
    Result failure(Error error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(resultMaybe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(RequestStateInitial<Value, Error> value),
    @required Result loading(RequestStateLoading<Value, Error> value),
    @required Result success(RequestStateSuccess<Value, Error> value),
    @required Result failure(RequestStateFailure<Value, Error> value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(RequestStateInitial<Value, Error> value),
    Result loading(RequestStateLoading<Value, Error> value),
    Result success(RequestStateSuccess<Value, Error> value),
    Result failure(RequestStateFailure<Value, Error> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RequestStateLoading<Value, Error extends Exception>
    implements RequestState<Value, Error> {
  const factory RequestStateLoading({Value resultMaybe}) =
      _$RequestStateLoading<Value, Error>;

  Value get resultMaybe;
  $RequestStateLoadingCopyWith<Value, Error, RequestStateLoading<Value, Error>>
      get copyWith;
}

/// @nodoc
abstract class $RequestStateSuccessCopyWith<Value, Error extends Exception,
    $Res> {
  factory $RequestStateSuccessCopyWith(RequestStateSuccess<Value, Error> value,
          $Res Function(RequestStateSuccess<Value, Error>) then) =
      _$RequestStateSuccessCopyWithImpl<Value, Error, $Res>;
  $Res call({Value result});
}

/// @nodoc
class _$RequestStateSuccessCopyWithImpl<Value, Error extends Exception, $Res>
    extends _$RequestStateCopyWithImpl<Value, Error, $Res>
    implements $RequestStateSuccessCopyWith<Value, Error, $Res> {
  _$RequestStateSuccessCopyWithImpl(RequestStateSuccess<Value, Error> _value,
      $Res Function(RequestStateSuccess<Value, Error>) _then)
      : super(_value, (v) => _then(v as RequestStateSuccess<Value, Error>));

  @override
  RequestStateSuccess<Value, Error> get _value =>
      super._value as RequestStateSuccess<Value, Error>;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(RequestStateSuccess<Value, Error>(
      result == freezed ? _value.result : result as Value,
    ));
  }
}

/// @nodoc
class _$RequestStateSuccess<Value, Error extends Exception>
    with DiagnosticableTreeMixin
    implements RequestStateSuccess<Value, Error> {
  const _$RequestStateSuccess(this.result) : assert(result != null);

  @override
  final Value result;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestState<$Value, $Error>.success(result: $result)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestState<$Value, $Error>.success'))
      ..add(DiagnosticsProperty('result', result));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestStateSuccess<Value, Error> &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  $RequestStateSuccessCopyWith<Value, Error, RequestStateSuccess<Value, Error>>
      get copyWith => _$RequestStateSuccessCopyWithImpl<Value, Error,
          RequestStateSuccess<Value, Error>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(Value resultMaybe),
    @required Result success(Value result),
    @required Result failure(Error error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(result);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(Value resultMaybe),
    Result success(Value result),
    Result failure(Error error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(RequestStateInitial<Value, Error> value),
    @required Result loading(RequestStateLoading<Value, Error> value),
    @required Result success(RequestStateSuccess<Value, Error> value),
    @required Result failure(RequestStateFailure<Value, Error> value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(RequestStateInitial<Value, Error> value),
    Result loading(RequestStateLoading<Value, Error> value),
    Result success(RequestStateSuccess<Value, Error> value),
    Result failure(RequestStateFailure<Value, Error> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RequestStateSuccess<Value, Error extends Exception>
    implements RequestState<Value, Error> {
  const factory RequestStateSuccess(Value result) =
      _$RequestStateSuccess<Value, Error>;

  Value get result;
  $RequestStateSuccessCopyWith<Value, Error, RequestStateSuccess<Value, Error>>
      get copyWith;
}

/// @nodoc
abstract class $RequestStateFailureCopyWith<Value, Error extends Exception,
    $Res> {
  factory $RequestStateFailureCopyWith(RequestStateFailure<Value, Error> value,
          $Res Function(RequestStateFailure<Value, Error>) then) =
      _$RequestStateFailureCopyWithImpl<Value, Error, $Res>;
  $Res call({Error error});
}

/// @nodoc
class _$RequestStateFailureCopyWithImpl<Value, Error extends Exception, $Res>
    extends _$RequestStateCopyWithImpl<Value, Error, $Res>
    implements $RequestStateFailureCopyWith<Value, Error, $Res> {
  _$RequestStateFailureCopyWithImpl(RequestStateFailure<Value, Error> _value,
      $Res Function(RequestStateFailure<Value, Error>) _then)
      : super(_value, (v) => _then(v as RequestStateFailure<Value, Error>));

  @override
  RequestStateFailure<Value, Error> get _value =>
      super._value as RequestStateFailure<Value, Error>;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(RequestStateFailure<Value, Error>(
      error == freezed ? _value.error : error as Error,
    ));
  }
}

/// @nodoc
class _$RequestStateFailure<Value, Error extends Exception>
    with DiagnosticableTreeMixin
    implements RequestStateFailure<Value, Error> {
  const _$RequestStateFailure(this.error) : assert(error != null);

  @override
  final Error error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestState<$Value, $Error>.failure(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestState<$Value, $Error>.failure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestStateFailure<Value, Error> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $RequestStateFailureCopyWith<Value, Error, RequestStateFailure<Value, Error>>
      get copyWith => _$RequestStateFailureCopyWithImpl<Value, Error,
          RequestStateFailure<Value, Error>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(Value resultMaybe),
    @required Result success(Value result),
    @required Result failure(Error error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(Value resultMaybe),
    Result success(Value result),
    Result failure(Error error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(RequestStateInitial<Value, Error> value),
    @required Result loading(RequestStateLoading<Value, Error> value),
    @required Result success(RequestStateSuccess<Value, Error> value),
    @required Result failure(RequestStateFailure<Value, Error> value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(RequestStateInitial<Value, Error> value),
    Result loading(RequestStateLoading<Value, Error> value),
    Result success(RequestStateSuccess<Value, Error> value),
    Result failure(RequestStateFailure<Value, Error> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class RequestStateFailure<Value, Error extends Exception>
    implements RequestState<Value, Error> {
  const factory RequestStateFailure(Error error) =
      _$RequestStateFailure<Value, Error>;

  Error get error;
  $RequestStateFailureCopyWith<Value, Error, RequestStateFailure<Value, Error>>
      get copyWith;
}
