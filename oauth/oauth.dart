import 'package:flutter_appauth/flutter_appauth.dart';

class AuthRepositoryImpl {
  AuthRepositoryImpl(this._auth);

  final FlutterAppAuth _auth;

  @override
  Future<TokenResponse?> refreshToken(TokenRequest request) async {
    return await _auth.token(request);
  }

  @override
  Future<AuthorizationTokenResponse?> auth() async {
    return await _auth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        '<client_id>',
        '<redirect_url>',
        issuer: '<issuer>',
        clientSecret: '<client_secret>',
        scopes: ['openid', 'profile', 'email', 'offline_access', 'api'],
        preferEphemeralSession: true,
      ),
    );
  }
}
