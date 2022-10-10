import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';

@freezed
abstract class RequestState<Value> with _$RequestState<Value> {
  const factory RequestState.initial() = RequestStateInitial<Value>;

  const factory RequestState.loading({Value? resultMaybe}) = RequestStateLoading<Value>;

  const factory RequestState.success(Value result) = RequestStateSuccess<Value>;

  const factory RequestState.failure(Object error) = RequestStateFailure<Value>;
}

extension IsLoading<Value> on RequestState<Value> {
  bool get isLoading => maybeMap(orElse: () => false, loading: (value) => true);

  Value? get value => maybeWhen(orElse: () => null, success: (result) => result);

  Object? get error => maybeWhen(orElse: () => null, failure: (error) => error);
}
