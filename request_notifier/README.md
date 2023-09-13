
## Request Notifier

`RequestNotifier` helps us execute long-running async operations (requests).

It procuces a `RequestState` object by disects the operation into distinct parts (`initial`, `loading`, `success`, and `error`).

`RequestState` can then be used to show the appropriate UI.
E.g., When reqest is in the loading phase (`RequestState.loading`) we show a loading indicator. When request completes (`RequestState.success`) we show the data.

### Usage

```dart
final userPresenterProvider = AutoDisposeNotifierProvider<UserPresenter, RequestState<User>>(
  () => UserPresenter(UserInteractor()),
);

class UserPresenter extends RequestNotifier<User> {
  UserPresenter(this._userInteractor);

  final UserInteractor _userInteractor;

  Future<void> fetch() async {
    executeRequest(requestBuilder: () async {
      return _userInteractor.getUser();
    });
  }
}

// -------------------------------------------------------------------------------------------------------------------

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userPresenterProvider).maybeWhen(
          success: (user) => UserWidget(user),
          failure: (e) => GenericError(e),
          orElse: () => GenericLoader(),
        );
  }
}


```

### Modifying the initial state

By default, the first state is set to `RequestState.initaial`. This can be changed in the consturctor.

This is useful when presenter starts fetching the data as soon as it is created.

```dart
class MyRequestPresenter extends RequestNotifier<Data> {
  MyRequestPresenter() : super(initialState: const RequestState.loading());
```


### Listening

Sometimes it is useful to listen to the presenter states (showing dialogs, navigating to success screen).

```dart
ref.listen(requestPresenter, (_, state) {
  state.whenOrNull(
    success: (_) => Navigator.of(context).push(SuccessScreen.route()),
    failure: (e) => Alerting.of(context).alertOfException(e),
  );
});
```

