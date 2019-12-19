

import 'dart:convert';
import 'dart:io';

class ApiService {
  static ApiService _instance;
  static ApiService instance() {
    if (_instance == null) {
      _instance = ApiService();
    }

    return _instance;
  }

  Future<Weather> fetchTeam() {
    return Future.delayed(Duration(milliseconds: 3300), (){
      // Uncomment to throw error
//        throw HttpException("No internet connection");
       return Weather("Berlin", "Sunny");
    });
  }

}

class Weather {
  final String city;
  final String condition;

  Weather(this.city, this.condition);
}