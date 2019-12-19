# common_state_handling

This sample contains architecture addition to Bloc that can handle showing of the common application states, loading and error.

In the weather example at bloclibrary.dev they for one request for weather they have Bloc states as following:

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

You can see how for every request you will need to add error and loading states, even though they are same states for every request. And in the widget tree they write something like:

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
          performRequest: () {
            BlocProvider.of<FetchWeatherBloc>(context).add(Void);
          },
          builder: (context, weather) {
            return Text(weather.condition + " in " + weather.city);
          })
```

- And that will result in the following UI:

![](https://media.giphy.com/media/gKxpPQ5JTQsA2yaO9u/giphy.gif)

- In case of error:

![](https://media.giphy.com/media/ZB8LuAr67ViaubCPUx/giphy.gif)

- You can add `retryEnabled` that will call `performRequest` again.

```dart
InLayoutRequest<Weather, FetchWeatherBloc>(
          retryEnabled: true,
          performRequest: () {
            BlocProvider.of<FetchWeatherBloc>(context).add(Void);
          },
          builder: (context, weather) {
            return Text(weather.condition + " in " + weather.city);
          },
        )
```

![](https://media.giphy.com/media/TH6HWYxZiOPdpYUEvO/giphy.gif)

- You have all the same handling but for blocking UI with `BlockingRequest` widget:

![](https://media.giphy.com/media/eKsrN1VnvtBV2oPjKh/giphy.gif)


If you need specific loading or error for some requests, you can do that by overriding `buildLoading` or `buildError` parameters:

```dart
InLayoutRequest<Weather, FetchWeatherBloc>(
          buildLoading: (BuildContext context) {
            return ScreenSpecificLoading()
          },
          ...
```

In same fashion you can build specific error for some requests. If you return `null` the widget will fallback to generic error. That way you can handle just some errors like:

```dart
InLayoutRequest<Weather, FetchWeatherBloc>(
          buildError: (BuildContext context, RequestError error) {
            if (error.code == 403) {
              return UnathorizedInfo();
            }
            
            return null;
          },
          ...
```         

## Dependencies

```
  bloc: ^2.0.0
  flutter_bloc: ^2.0.0
  equatable: ^1.0.1
```

This is built on bloc, so we have default bloc dependencies.

`after_layout`

Since `BlocListener` does not trigger for the initialState, we show loading dialog after the layout (you cannot show dialog during the build phase or initState).

