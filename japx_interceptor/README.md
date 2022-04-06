## Japx Serialization Interceptor

A dio interceptor that automatically encodes request body and decodes response body.

You might need this if the backend API is built with [json:api](https://jsonapi.org/) specification.

### Usage

You'll just need to add the interceptor to your dio client like this:

```
_dio.interceptors.add(JapxSerializationInterceptor());
```

That's it 😀

### What if I need to use `includeList` when decoding?

Sometimes you'll need to add `includeList` argument to wne decoding a json.
Use `IncludeList.toExtra('<includeList,string,here>')` as in the following example:

```
await _dio.post(ApiEndpoints.register, data: registerRequest, options: Options(extra: IncludeList.toExtra('<includeList,string,here>')));
```

