
## Request Notifier

`RequestNotifier` helps us handle long-running async operations (requests) by dissecting them into distinct states (`initial`, `loading`, `success`, and `error`).

Often, a request will fetch/send data to the API or write to the database. Note that some requests might consist of multiple steps (a request might fetch data from one source, fetch data from another source, and combine it into a single model).

By listening to `RequestState` changes, the UI can be appropriately updated:

* `RequestState.loading` show loading indicator
* `RequestState.success` show data
* `RequestState.error` show error message

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
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userPresenterProvider).maybeWhen(
          success: (user) => UserWidget(user),
          failure: (error) => GenericError(error),
          orElse: () => GenericLoader(),
        );
  }
}


```

### Modifying the initial state

By default, the first state is `initial`. This can be changed in the constructor.

Changing the first state is useful when presenter starts fetching immediately as soon as it is created.

```dart
class MyRequestPresenter extends RequestNotifier<Data> {
  MyRequestPresenter() : super(initialState: const RequestState.loading()) {
    fetch();
  }
```


### Listening

Sometimes it is useful to listen to the state changes (showing dialogs, navigating to success screen).

```dart
ref.listen(requestPresenter, (_, state) {
  state.whenOrNull(
    success: (_) => Navigator.of(context).push(SuccessScreen.route()),
    failure: (error) => Alerting.of(context).alertOfException(error),
  );
});
```

