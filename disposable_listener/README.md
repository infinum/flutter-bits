
## disposable_listener

Widget that can be used to listen for streams on provider.

Listen to provider in [onListen] and for easy canceling add them to disposable:

```dart
onListen: (compositeSubscription) {
  stream.listen(() {...}).addTo(compositeSubscription)
}
```

### When we use this

One way to control navigation from provider is using streams. You can have code like this in
provider:

```dart
  final PublishSubject<NavigateToPermissionData> _navigateToPermissionSubject = PublishSubject();
  Stream<NavigateToPermissionData> get navigateToPermission => _navigateToPermissionSubject;
```

And UI can use disposable_listener to listen and navigate to proper screen.

*Extra*: you can return navigation result back to provider using completer. Make provider
instantiate completer and send it to UI, the UI can await navigation and return result:

```dart
 Future<void> _onPermissionDenied() async {
    final completer = Completer<bool>();
    _navigateToPermissionSubject.add(NavigateToPermissionData(completer));

    final result = await completer.future;

    // do something with result e.g.:
    if (result == true) {
      _handleGetContacts();
    }
  }
```

Full example is available at /device_permission/lib/ui/home.