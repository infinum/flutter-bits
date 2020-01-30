// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:common_state_handling/api_service.dart';
import 'package:common_state_handling/architecture/event/bloc_event.dart';
import 'package:common_state_handling/architecture/state/bloc_state.dart';
import 'package:common_state_handling/architecture/state/request_bloc_state.dart';
import 'package:common_state_handling/architecture/widgets/generic_error.dart';
import 'package:common_state_handling/fetch_weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:common_state_handling/main.dart';


void main() {

  testWidgets('GenericError should show exception message and call onRetry', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        WidgetToTest(builder: (BuildContext context) =>
            GenericError(error: ErrorState(HttpException("No internet connection"), null)),
        ));

    // Verify that error is shown
    expect(find.text("HttpException: No internet connection"), findsOneWidget);
  });

  testWidgets('GenericError should throw error when onRetry function is not provided for retryEnable true', (WidgetTester tester) async {
    try {
      await tester.pumpWidget(
          WidgetToTest(builder: (BuildContext context) =>
              GenericError(
                error: ErrorState(
                    HttpException("No internet connection"), null),
                retryEnabled: true,
              ),
          ));
    } on dynamic catch (error) {
      expect(error, isAssertionError);
    }
  });

  testWidgets('GenericError should show call onRetry', (WidgetTester tester) async {
    final mockFn = MockFn();
    await tester.pumpWidget(
        WidgetToTest(builder: (BuildContext context) =>
            GenericError(
              error: ErrorState(HttpException("No internet connection"), null),
              retryEnabled: true,
              onRetry: mockFn.fn,
      ),
    ));

    // Verify that error is shown
    expect(find.text("HttpException: No internet connection"), findsOneWidget);

    // Verify that onRetry is called when clicked on RETRY
    await tester.tap(find.text("RETRY"));
    expect(mockFn.callCount, 1);
  });


  testWidgets('WeatherCard should show initial state and after click weather text', (WidgetTester tester) async {
    final bloc = MockWeatherBloc();

    await tester.pumpWidget(WidgetToTest(builder: (BuildContext context) =>
        BlocProvider(
          create: (context) => bloc as FetchWeatherBloc,
          child: Builder(
            builder: (BuildContext context) => WeatherCard(),
          ),
        ),
    ));

    // Verify that error is not shown and initial state is shown
    expect(find.text("HttpException: No internet connection"), findsNothing);
    expect(find.text("Click here to get weather"), findsOneWidget);

    bloc.enqueue(ContentState(Weather("Berlin", "Sunny")));
    await tester.tap(find.text("Click here to get weather"));
    await tester.pumpAndSettle();

    expect(find.text("Sunny in Berlin"), findsOneWidget);
  });
}






class WidgetToTest extends StatelessWidget {
  final WidgetBuilder builder;

  const WidgetToTest({Key key, this.builder}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Builder(builder: builder)
        )
    );
  }
}









class MockFn {
  var callCount = 0;

  dynamic fn() {
    callCount++;
  }

  dynamic fn1(dynamic arg) {
    callCount++;
  }

  dynamic fn2(dynamic arg1, dynamic arg2) {
    callCount++;
  }
}










class MockWeatherBloc extends FetchWeatherBloc {
  BlocState<Weather> _enqueuedState;

  // not really and enqueue but ok
  void enqueue(BlocState<Weather> state) {
    _enqueuedState = state;
  }

  BlocState<Weather> enqueuedState() {
    if (_enqueuedState == null) {
      print("ERROR: Nothing was enqueued, but mapEvent was called.");
      // Can't fail test here since they get caught by the RequestBloc :/
      fail("Nothing was enqueued, but mapEvent was called.");
    }
    return _enqueuedState;
  }

  @override
  void makeRequest() {
    add(MockEvent("showData"));
  }

  @override
  Stream<BlocState<Weather>> mapEvent(BlocEvent<Weather> event) async* {
    if (event is MockEvent) {
      switch ((event as MockEvent).action) {
        case "showData":
          {
            yield enqueuedState();
          }
      }
    }
  }
}

class MockEvent<T> extends BlocEvent<T> {
  final String action;

  MockEvent(this.action);
}
