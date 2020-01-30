
import 'package:bloc/bloc.dart';
import 'package:common_state_handling/api_service.dart';
import 'package:common_state_handling/architecture/event/bloc_event.dart';
import 'package:common_state_handling/architecture/event/request_event.dart';
import 'package:common_state_handling/architecture/state/bloc_state.dart';
import 'package:common_state_handling/request_snapshot.dart';
import 'package:flutter/material.dart';

import 'api_service.dart';
import 'architecture/request_bloc.dart';

class FetchWeatherBloc extends RequestBloc<Weather> {
  final ApiService _apiService = ApiService.instance();

  Future<Weather> _makeRequest() async {
    final Weather weather = await _apiService.fetchTeam();
    return weather;
  }

  /// Make request and send [MakeRequest] to [LoginBloc]
  /// [MakeRequest] event will be caught in [RequestBloc] and handled there
  void makeRequest() {
    add(MakeRequest<Weather>(_makeRequest()));
  }

  /// Any new events that should be mapped by [FetchWeatherBloc], events that
  /// are not parsed by [RequestBloc] are passed here so that any bloc can use and map their
  /// own events
  @override
  Stream<BlocState<Weather>> mapEvent(BlocEvent<Weather> event) {
    // TODO: implement mapEvent
    throw UnimplementedError();
  }
}


