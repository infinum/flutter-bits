import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Default bloc state to pass
/// We needed this because of [RequestState], to allow more different
/// states, all states for building a bloc need to extend [BlocState]
///
/// [BlocState] will handle [Equatable] and [props] and fill them with default
/// data.
@immutable
abstract class BlocState<T> extends Equatable{
  const BlocState([this._props]);

  final List<T> _props;

  @override
  List<T> get props => _props ?? <T>[];
}