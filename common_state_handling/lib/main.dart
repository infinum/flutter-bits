import 'package:common_state_handling/request_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_service.dart';
import 'architecture/request/blocking_request.dart';
import 'architecture/request/in_layout_request.dart';
import 'architecture/widgets/generic_error.dart';
import 'architecture/widgets/generic_loading.dart';
import 'fetch_weather_bloc.dart';

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
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: <Widget>[
          Card(
            child: Container(
              margin: const EdgeInsets.all(12.0),
              height: 180.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Inline with click'),
                  Expanded(
                    child: BlockingRequestWidget<Weather, FetchWeatherBloc>(
                      BlocProvider.of<FetchWeatherBloc>(context),
                      builder: (context, weather) {
                        return Container(
                            alignment: Alignment.center,
                            child: Text(weather.condition + " in " + weather.city));
                      },
                      buildInitial: (context) {
                        return InkWell(
                          onTap: (){
                            BlocProvider.of<FetchWeatherBloc>(context).makeRequest();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              child: Text('Click here to get weather')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
