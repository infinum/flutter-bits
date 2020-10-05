// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'request_bloc_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RequestEventUnion<T> {
  Future<T> get request;

  RequestEventUnion<T> copyWith({Future<T> request});
}

class _$RequestEventUnionTearOff {
  const _$RequestEventUnionTearOff();

  MakeRequest<T> makeRequest<T>(Future<T> request) {
    return MakeRequest<T>(
      request,
    );
  }
}

const $RequestEventUnion = _$RequestEventUnionTearOff();

class _$MakeRequest<T> with DiagnosticableTreeMixin implements MakeRequest<T> {
  _$MakeRequest(this.request) : assert(request != null);

  @override
  final Future<T> request;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestEventUnion<$T>.makeRequest(request: $request)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestEventUnion<$T>.makeRequest'))
      ..add(DiagnosticsProperty('request', request));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MakeRequest<T> &&
            (identical(other.request, request) ||
                const DeepCollectionEquality().equals(other.request, request)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(request);

  @override
  _$MakeRequest<T> copyWith({
    Object request = freezed,
  }) {
    return _$MakeRequest<T>(
      request == freezed ? this.request : request as Future<T>,
    );
  }
}

abstract class MakeRequest<T> implements RequestEventUnion<T> {
  factory MakeRequest(Future<T> request) = _$MakeRequest<T>;

  @override
  Future<T> get request;

  @override
  MakeRequest<T> copyWith({Future<T> request});
}
