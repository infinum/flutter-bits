import 'dart:ffi';

import 'package:common_state_handling/architecture/request/BlockingRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ApiService.dart';
import 'FetchWeatherBloc.dart';
import 'architecture/request/InLayoutRequest.dart';

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
        child: InLayoutRequest<Weather, FetchWeatherBloc>(
          performRequest: () {
            BlocProvider.of<FetchWeatherBloc>(context).add(Void);
          },
          builder: (context, weather) {
            return Container(
                alignment: Alignment.center,
                child: Text(weather.condition + " in " + weather.city));
          },
        ),
      ),
    );
  }
}
