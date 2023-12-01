import 'package:dio/dio.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor(this._tokenStorage, this._authRepository, this._dio);

  final TokenStorage _tokenStorage;
  final AuthRepository _authRepository;
  final Dio _dio;

  Future<void>? _refreshAccessTokenRequest;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer ${_tokenStorage.getAccessToken()}';
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return super.onError(err, handler);
    }

    try {
      await _refreshAccessToken();
    } catch (error) {
      // Refreshing access token failed. At this point the app would usually navigate to login screen.
      return super.onError(err, handler);
    }

    handler.resolve(await _retryRequest(err.requestOptions));
  }

  Future<void> _refreshAccessToken() async {
    // Handling parallel token refreshes.
    var didCreateRequest = false;
    if (_refreshAccessTokenRequest == null) {
      _refreshAccessTokenRequest = _createRefreshAccessTokenRequest();
      didCreateRequest = true;
    }
    try {
      await _refreshAccessTokenRequest;
    } finally {
      if (didCreateRequest) {
        _refreshAccessTokenRequest = null;
      }
    }
  }

  Future<void> _createRefreshAccessTokenRequest() async {
    final newAccessToken = await _authRepository.fetchAccessToken(_tokenStorage.getRefreshToken());
    await _tokenStorage.setAccessToken(newAccessToken);
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) {
    return _dio.fetch<dynamic>(requestOptions);
  }
}

abstract class TokenStorage {
  String getRefreshToken();

  String getAccessToken();
  Future<void> setAccessToken(String accessToken);
}

abstract class AuthRepository {
  Future<String> fetchAccessToken(String refreshToken);
}
