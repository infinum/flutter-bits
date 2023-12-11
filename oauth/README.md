# OAuth 2.0

For OAuth 2.0 use the [flutter_appauth](https://pub.dev/packages/flutter_appauth) package.

Check the `oauth.dart` for an example of how to use the `flutter_appauth` package. Don't forget to follow the native Android/iOS setup as described in the package readme.

Clients of `AuthRepository` would usually store the refresh token in persistent storage, this way the users don't have to re-login every time they open the app.

Check the `authorization_interceptor.dart` for an example of how to add the access token to network requests, and how to refresh the access token and retry the request when the current access token expires.
