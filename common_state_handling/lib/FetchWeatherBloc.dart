
import 'package:common_state_handling/ApiService.dart';

import 'architecture/GenericErrorHandler.dart';
import 'architecture/RequestBloc.dart';

class FetchWeatherBloc extends RequestBloc<Weather> {
  ApiService _apiService = ApiService.instance();

  @override
  RequestBlocStates<Weather> get initialState {
    return Loading();
  }

  @override
  Stream<RequestBlocStates<Weather>> mapEventToState(event) async* {
    yield Loading();
    try {
      final response = await _apiService.fetchTeam();
      yield Content(response);
    } catch (err) {
      yield GenericErrorHandler<Weather>().getError(err);
    }
  }

}

