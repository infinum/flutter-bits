# OAuth 2.0

For OAuth 2.0 use the [flutter_appauth](https://pub.dev/packages/flutter_appauth) package.

Check the `oauth.dart` file for an example of how to use the `flutter_appauth` package. Don't forget to follow the native Android/iOS setup as described in the package readme.

Clients of `AuthRepository` would usually store the refresh token in persistent storage, this way the user doesn't have to re-login everytime he opens the app.
