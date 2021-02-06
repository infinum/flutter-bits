
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

### Extra

You'll probably need to use Listener sometimes (to show dialog or for navigation). For this you can
do stateful widget and `provider.addListener` to listen for changes.

Another option is to use `ConsumerListener` widget which is under /extra directory.