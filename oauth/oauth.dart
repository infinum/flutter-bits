import 'package:flutter_appauth/flutter_appauth.dart';

class AuthRepository {
  AuthRepository();

  final _auth = const FlutterAppAuth();

  @override
  Future<Authorization?> authorize() async {
    try {
      final response = _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          '<client_id>',
          '<redirect_url>',
          issuer: '<issuer>',
          clientSecret: '<client_secret>',
          scopes: ['openid', 'profile', 'email', 'offline_access', 'api'],
          preferEphemeralSession: true,
        ),
      );
      return Authorization(
        refreshToken: response.refreshToken!,
        accessToken: response.accessToken!,
      );
    } catch (_) {
      return null; // exception is thrown if user cancels authorization
    }
  }

  @override
  Future<Authorization?> refreshToken(String refreshToken) async {
    final response = await _auth.token(
      TokenRequest(
        '<client_id>',
        '<redirect_url>',
        refreshToken: refreshToken,
        issuer: '<issuer>',
        clientSecret: '<client_secret>',
        scopes: ['<scopes>'],
      ),
    );
    return Authorization(
        refreshToken: response.refreshToken!,
        accessToken: response.accessToken!,
    );
  }
}

class Authorization {
  const Authorization({
    required this.refreshToken,
    required this.accessToken,
  });

  final String refreshToken;
  final String accessToken;
}
