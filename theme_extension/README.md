# Theme extension

Example of using theme extensions in apps.

[Theme extensions docs](https://api.flutter.dev/flutter/material/ThemeExtension-class.html)

#### Usage

Unlike look we don't have to map or wrap anything with custom classes. We just have to provide
the custom class in `themeExtension` part of Theme setup in MaterialApp

```dart
ThemeData(
...
extensions: const [
  MotionData.getDefault(),
],
...
);
```

There is no brick for this example since it is project dependent and setup is not that big.