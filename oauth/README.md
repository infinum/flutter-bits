# Oauth 2.0

For OAuth 2.0 we will use flutter_appauth package:
[Package](https://pub.dev/packages/flutter_appauth)

# Use OAuth 2.0
To integrate OAuth 2.0 in your Flutter application, follow these steps:
### 1. Initialize FlutterAppAuth
```dart
FlutterAppAuth appAuth = FlutterAppAuth();
```

### 2. Use for login
```dart
Future<bool> loginUser() async {
  final response = await _authRepository.auth(); // Use [FlutterAppAuth.authorizeAndExchangeCode] in repository to get response

  // If response is null, something went wrong
  if (response == null) {
    loggy.error('Missing AuthorizationTokenRequest');
    return false;
  }

  // Save token to persistence manager
  _tokenPersistenceManager.saveToken(response);

  return true;
}
```

### 3. Use for refresh token
```dart
Future<void> _refreshTokenRequest() async {
  // Get refresh token from persistence manager
  final refreshToken = _tokenPersistenceManager.getRefreshToken();
    
  final authRepository = null; // Get auth repository
  final response = await authRepository.refreshToken(TokenRequest(
    '<client_id>',
    '<redirect_url>',
    refreshToken: refreshToken,
    issuer: '<issuer>',
    clientSecret: '<client_secret>',
    scopes: ['<scopes>'],
  ));
  
  if (response != null) {
    _tokenPersistenceManager.saveToken(response);
  }
}
```