import 'include_list.dart';
import 'package:dio/dio.dart';
import 'package:japx/japx.dart';

const String jsonApiContentType = 'application/vnd.api+json';

class JapxSerializationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_isJsonApiContent(options.contentType) && options.data != null) {
      options.data = Japx.encode(options.data);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_isJsonApiContent(response.headers['content-type'].toString()) && response.data != null) {
      response.data = Japx.decode(response.data, includeList: IncludeList.fromExtra(response.requestOptions.extra));
    }
    super.onResponse(response, handler);
  }

  bool _isJsonApiContent(String? contentType) {
    return contentType != null && contentType.contains(jsonApiContentType);
  }
}
