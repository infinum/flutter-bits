
# ProviderKeepAlive


Utility widget to ensure providers are not disposed as long as this widget is in the widget tree.

To ensure provider is kept alive, pass it to the [providers] list.

```dart
  ProviderKeepAlive(
     providers: [
       myProvider,
     ],
     child: Container(),
   );
```