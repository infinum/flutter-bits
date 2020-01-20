# common_state_handling

This sample contains architecture addition to Bloc that can handle showing of the common application states, loading and error.

In the weather example at bloclibrary.dev, for one request they have Bloc states as following:

```dart
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({@required this.weather}) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {}

```

You can see how for every request you will need to add error and loading states, even though they are the same states for every request. And in the widget tree they write something like:

```dart
child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherEmpty) {
              return Center(child: Text('Please Select a Location'));
            }
            if (state is WeatherLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoaded) {
              final weather = state.weather;

              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Location(location: weather.location),
                    ),
                  ),
                  Center(
                    child: LastUpdated(dateTime: weather.lastUpdated),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: CombinedWeatherTemperature(
                        weather: weather,
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is WeatherError) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
          },
```

Same here, repeating this for each request doesn't make sense. This is also polluting the widget tree with if-else nesting.

## Solution

So this example is using common states. You write your request blocs by extending `RequestBloc<YourDataClass>`. Inside you can `yield` `Loading`, `RequestError` or `Content<T>`

In the widget tree, everything is simplified. You can use `InLayoutRequest<T, Bloc extends RequestBloc<T>` which is connected to `RequestBloc` to handle these common states. From the `main.dart` you can see we perform the request like:

```dart
InLayoutRequest<Weather, FetchWeatherBloc>(
    BlocProvider.of<FetchWeatherBloc>(context),
    performRequest: () {
      BlocProvider.of<FetchWeatherBloc>(context).makeRequest();
    },
    builder: (BuildContext context, RequestSnapshot<Weather> weather) {
      if(weather.isLoading){
        return GenericLoading();
      }
    
      if(weather.hasError){
        return GenericError();
      }
    
      if(weather.hasData){
        return Container(
          alignment: Alignment.center,
          child: Text(weather.data.condition + " in " + weather.data.city));
      }
    
      return SizedBox.shrink();
    }
);
```

- And that will result in the following UI:

![](https://media.giphy.com/media/gKxpPQ5JTQsA2yaO9u/giphy.gif)

- In case of error:

![](https://media.giphy.com/media/ZB8LuAr67ViaubCPUx/giphy.gif)

- You can customize the widget so it will call request again if error is shown and `retry` is clicked.

```dart
InLayoutRequest<Weather, FetchWeatherBloc>(
    BlocProvider.of<FetchWeatherBloc>(context),
    performRequest: () {
      BlocProvider.of<FetchWeatherBloc>(context).makeRequest();
    },
    builder: (BuildContext context, RequestSnapshot<Weather> weather) {
      if(weather.isLoading){
        return GenericLoading();
      }
    
      if(weather.hasError){
        return Column(
          children: <Widget>[
            GenericError(onRetry: () => BlocProvider.of<FetchWeatherBloc>(context).makeRequest()),
          ]
        );
      }
    
      if(weather.hasData){
        return Container(
          alignment: Alignment.center,
          child: Text(weather.data.condition + " in " + weather.data.city));
      }
    
      return SizedBox.shrink();
    }
);
```

![](https://media.giphy.com/media/TH6HWYxZiOPdpYUEvO/giphy.gif)

- You have all the same handling but for blocking UI with `BlockingRequest` widget:

![](https://media.giphy.com/media/eKsrN1VnvtBV2oPjKh/giphy.gif)


If you need specific loading you need widget for `RequestSnapshot.loading` state, if no
widget is provided default error message will be shown

```dart
InLayoutRequest<Weather, FetchWeatherBloc>(
    builder: (BuildContext context, RequestSnapshot<Weather> weather) {
      if(weather.isLoading){
        return ScreenSpecificLoadingWidget();
      }
    },
          ...
```

In the same fashion, you can build specific errors for some requests. If you return `null` the widget will fallback to generic error. That way you can handle just some error like:

```dart
InLayoutRequest<Weather, FetchWeatherBloc>(
    builder: (BuildContext context, RequestSnapshot<Weather> weather) {
        if(weather.hasError){
            if (weather.error.code == 403) {
              return UnathorizedInfoWidget();
            }
            
            return null;
        }
      },
          ...
```         

## Dependencies

```
  bloc: ^2.0.0
  flutter_bloc: ^2.0.0
  equatable: ^1.0.1
```