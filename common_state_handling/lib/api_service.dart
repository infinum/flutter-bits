class ApiService {
  ApiService._();

  factory ApiService.instance() {
    _instance ??= ApiService._();
    return _instance;
  }

  static ApiService _instance;

  Future<Weather> fetchTeam() {
    return Future.delayed(Duration(milliseconds: 3300), (){
      // Uncomment to throw error
//        throw HttpException("No internet connection");
       return Weather("Berlin", "Sunny");
    });
  }

}

class Weather {
  Weather(this.city, this.condition);

  final String city;
  final String condition;
}