
## Request Provider

Request Provider is addition that helps us execute any long-running async operation, with states:
_initial_, _loading_, _success_ and _error_.

Most often that will be API requests. We make each use case of data fetch into single provider that
extends RequestProvider. And we can listen for changes and show appropriate UI:

- _success_ show data
- _loading_ show loading indicator
- _error_ show error message

This does not mean that one request = one provider, because use case can be doing several
connected requests (parallel or sequential) that will at the end produce one data class which UI
needs.
These all requests would be part of one provider.

If you don't need to watch for _error_ or _loading_ states for some reason, then you can do request
without RequestProvider (but I think this will be very rare).

### Usage

Extend the request provider

```dart

class FetchTranslationsProvider extends RequestProvider<void> {
  FetchTranslationsProvider(this.translationsInteractor);

  final TranslationsInteractor translationsInteractor;

  Future<void> fetch() async {
    executeRequest(requestBuilder: () async {
      await translationsInteractor.fetch();
    });
  }
}

```

On the UI side, you can listen for state changes:

```dart

      Consumer<FetchTranslationsProvider>(
        builder: (context, provider) {
          return provider.state.when(
            success: (response) => _buildForm(context),
            loading: (_) => GenericLoader(),
            failure: (e) => GenericError(ErrorHandlingManager.toMessage(e)),
          );
        }
      )

```

### Modifying the initial state

If you are starting request right after the constructor, for example by using the [init provider hook](https://github.com/infinum/flutter-bits/tree/master/init_provider_hook) you'll notice that Flutter complains that you've called setState during the build. This happens because RequestProvider will indeed change from Initial to Loading during the build.

For this case you can manually set the initial state in the constructor.

```dart
class MyRequestProvider extends RequestProvider<Data> {
  MyRequestProvider(this._someInteractor): super(initial: RequestState.loading());
```

### Extra

You'll probably need to use Listener sometimes (to show dialog or for navigation on success, error or loading). For this you can use:
```
    ref.listen<MyPresenter>(myPresenter, (_, presenter) {
      presenter.state.whenOrNull(success: (_) {
        Navigator.of(context).pushReplacement<void, void>(SomeNewScreen.route());
      });
    });
```

