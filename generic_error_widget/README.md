
# Generic Error Widget

In your app you will usually have a widget that can visually show errors in the app.

One example can be found here:
https://github.com/infinum/flutter-bits/tree/master/generic_error_widget/generic_error_widget_example.dart

Note that design can be very different depending on the project. There could even be different
designs and icons for some specific errors, but that all can be abstracted and have one error
that handles it.

There will always be common and unexpected errors that are not handled specially. One of them is when
exception is thrown during the build method. In that case Flutter is unable to show widget on the
screen and it will show ErrorWidget instead. So we want in this case also use GenericError widget:

```dart
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxHeight == MediaQuery.of(context).size.height) {
            /// Fullscreen error. Modify the design and include the back button
            return Scaffold(appBar: AppBar(), body: GenericError(exception: errorDetails.exception));
          } else {
            return Card(margin: const EdgeInsets.all(16), child: GenericError(exception: errorDetails.exception));
          }
        }
      );
    };
```

