import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vecna/bloc/event/request_event.dart';

/// Default bloc event to pass
/// We needed this because of [RequestEvent], to allow more different
/// events, all events for building a bloc need to extend [BlocEvent]
///
/// [BlocEvent] will handle [Equatable] and [props] and fill them with default
/// data.
@immutable
abstract class BlocEvent<T> extends Equatable{
  const BlocEvent([this._props]);

  final List<T> _props;

  @override
  List<T> get props => _props ?? <T>[];
}