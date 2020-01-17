
import 'package:common_state_handling/ApiService.dart';
import 'package:common_state_handling/architecture/event/bloc_event.dart';
import 'package:common_state_handling/architecture/event/request_event.dart';
import 'package:common_state_handling/architecture/state/bloc_state.dart';

import 'ApiService.dart';
import 'architecture/request_bloc.dart';

class FetchWeatherBloc extends RequestBloc<Weather> {
  final ApiService _apiService = ApiService.instance();

  Future<Weather> _makeRequest() async {
    final Weather weather = await _apiService.fetchTeam();
    return weather;
  }

  /// Make request and send [MakeRequest] to [LoginBloc]
  void makeRequest(String username, String password) => add(MakeRequest<Weather>(_makeRequest()));

  @override
  Stream<BlocState<Weather>> mapEvent(BlocEvent<Weather> event) {
    // TODO: implement mapEvent
    throw UnimplementedError();
  }
}

