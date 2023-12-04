import 'package:dio/dio.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor(this._authStorage, this._authRepository, this._dio);

  final AuthStorage _authStorage;
  final AuthRepository _authRepository;
  final Dio _dio;

  Future<void>? _refreshAuthRequest;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer ${_authStorage.getAccessToken()}';
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return super.onError(err, handler);
    }

    try {
      await _refreshAuth();
    } catch (error) {
      // Refreshing has failed. At this point the app would usually navigate to login screen.
      return super.onError(err, handler);
    }

    handler.resolve(await _retryRequest(err.requestOptions));
  }

  Future<void> _refreshAuth() async {
    // Handling parallel refreshes.
    var didCreateRequest = false;
    if (_refreshAuthRequest == null) {
      _refreshAuthRequest = _createRefreshAuthRequest();
      didCreateRequest = true;
    }
    try {
      await _refreshAuthRequest;
    } finally {
      if (didCreateRequest) {
        _refreshAuthRequest = null;
      }
    }
  }

  Future<void> _createRefreshAuthRequest() async {
    final newAuthorization = await _authRepository.refresh(_authStorage.getRefreshToken());
    await _authStorage.save(newAuthorization);
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) {
    return _dio.fetch<dynamic>(requestOptions);
  }
}

abstract class AuthStorage {
  String getRefreshToken();
  String getAccessToken();

  Future<void> save(Authorization authorization);
}

abstract class AuthRepository {
  Future<Authorization> refresh(String refreshToken);
}

class Authorization {
  const Authorization({
    required this.refreshToken,
    required this.accessToken,
  });

  final String refreshToken;
  final String accessToken;
}
