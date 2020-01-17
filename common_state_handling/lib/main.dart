import 'dart:ffi';

import 'package:common_state_handling/architecture/request/BlockingRequest.dart';
import 'package:common_state_handling/request_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ApiService.dart';
import 'ApiService.dart';
import 'architecture/widgets/generic_error.dart';
import 'architecture/widgets/GenericLoading.dart';
import 'fetch_weather_bloc.dart';
import 'architecture/request/in_layout_request.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Common State Handling',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SomeScreen(),
    );
  }
}

class SomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: BlocProvider(
          create: (context) => FetchWeatherBloc(), child: WeatherCard()),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: InLayoutRequestWidget<Weather, FetchWeatherBloc>(
          BlocProvider.of<FetchWeatherBloc>(context),
          builder: (BuildContext context, RequestSnapshot<Weather> weather) {
            if(weather.isLoading){
              return GenericLoading();
            }

            if(weather.hasError){
              return GenericError();
            }


            return Container(
                alignment: Alignment.center,
                child: Text(weather.data.condition + " in " + weather.data.city));
          },
        ),
      ),
    );
  }
}
