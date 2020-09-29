// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'request_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RequestStateUnion<T> {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result error(Object error, StackTrace stack),
    @required Result success(T content),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result error(Object error, StackTrace stack),
    Result success(T content),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(InitialState<T> value), {
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
    @required Result success(Content<T> value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(InitialState<T> value), {
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    Result success(Content<T> value),
    @required Result orElse(),
  });
}

class _$RequestStateUnionTearOff {
  const _$RequestStateUnionTearOff();

  InitialState<T> call<T>() {
    return InitialState<T>();
  }

  Loading<T> loading<T>() {
    return Loading<T>();
  }

  ErrorDetails<T> error<T>(Object error, {StackTrace stack}) {
    return ErrorDetails<T>(
      error,
      stack: stack,
    );
  }

  Content<T> success<T>(T content) {
    return Content<T>(
      content,
    );
  }
}

const $RequestStateUnion = _$RequestStateUnionTearOff();

class _$InitialState<T>
    with DiagnosticableTreeMixin
    implements InitialState<T> {
  const _$InitialState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestStateUnion<$T>()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'RequestStateUnion<$T>'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result error(Object error, StackTrace stack),
    @required Result success(T content),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(success != null);
    return $default();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result error(Object error, StackTrace stack),
    Result success(T content),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(InitialState<T> value), {
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
    @required Result success(Content<T> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(success != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(InitialState<T> value), {
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    Result success(Content<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class InitialState<T> implements RequestStateUnion<T> {
  const factory InitialState() = _$InitialState<T>;
}

class _$Loading<T> with DiagnosticableTreeMixin implements Loading<T> {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestStateUnion<$T>.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestStateUnion<$T>.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result error(Object error, StackTrace stack),
    @required Result success(T content),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(success != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result error(Object error, StackTrace stack),
    Result success(T content),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(InitialState<T> value), {
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
    @required Result success(Content<T> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(success != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(InitialState<T> value), {
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    Result success(Content<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements RequestStateUnion<T> {
  const factory Loading() = _$Loading<T>;
}

class _$ErrorDetails<T>
    with DiagnosticableTreeMixin
    implements ErrorDetails<T> {
  const _$ErrorDetails(this.error, {this.stack}) : assert(error != null);

  @override
  final Object error;
  @override
  final StackTrace stack;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestStateUnion<$T>.error(error: $error, stack: $stack)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestStateUnion<$T>.error'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('stack', stack));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails<T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.stack, stack) ||
                const DeepCollectionEquality().equals(other.stack, stack)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(stack);

  @override
  _$ErrorDetails<T> copyWith({
    Object error = freezed,
    Object stack = freezed,
  }) {
    return _$ErrorDetails<T>(
      error == freezed ? this.error : error,
      stack: stack == freezed ? this.stack : stack as StackTrace,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result error(Object error, StackTrace stack),
    @required Result success(T content),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(success != null);
    return error(this.error, stack);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result error(Object error, StackTrace stack),
    Result success(T content),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error, stack);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(InitialState<T> value), {
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
    @required Result success(Content<T> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(success != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(InitialState<T> value), {
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    Result success(Content<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails<T> implements RequestStateUnion<T> {
  const factory ErrorDetails(Object error, {StackTrace stack}) =
      _$ErrorDetails<T>;

  Object get error;
  StackTrace get stack;

  ErrorDetails<T> copyWith({Object error, StackTrace stack});
}

class _$Content<T> with DiagnosticableTreeMixin implements Content<T> {
  const _$Content(this.content) : assert(content != null);

  @override
  final T content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestStateUnion<$T>.success(content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestStateUnion<$T>.success'))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Content<T> &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(content);

  @override
  _$Content<T> copyWith({
    Object content = freezed,
  }) {
    return _$Content<T>(
      content == freezed ? this.content : content as T,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result error(Object error, StackTrace stack),
    @required Result success(T content),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(success != null);
    return success(content);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result error(Object error, StackTrace stack),
    Result success(T content),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(InitialState<T> value), {
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
    @required Result success(Content<T> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(success != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(InitialState<T> value), {
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    Result success(Content<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Content<T> implements RequestStateUnion<T> {
  const factory Content(T content) = _$Content<T>;

  T get content;

  Content<T> copyWith({T content});
}
