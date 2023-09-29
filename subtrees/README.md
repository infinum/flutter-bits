# Subtrees

Subtrees can be thought of as an upgrade to the [Inherited Widget pattern](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html).

We create a subtree to house and manage some shared behavior and then use an `InheritedWidget` to allow other parts of the app to access it.

One such example is Alerting (showing in-app notifications). `AlertingSubtree` contains complex logic of how to show an alert. Other parts of the app can simply indicate that an alert should be shown (`Alerting.of(context).alertOfException`).

Another example is Formatting. `FormattingSubtree` creates the formatters, and using the `Formatting-InheritedWidget` it shares them with the widget tree. To show a formatted text, simply access the formatter (`Formatting.of(context).dateTime.formateDate`).

It is worth noting that a subtree can interact with other layers of the app. For example, `FormattingSubtree` could interact with the domain layer to obtain the users preferred way of displaying the date (`dd.mm.yyyy` or `mm.dd.yyyy`). It would then create an appropriate formatter (`BritishDateTimeFormatter` or `AmericanDateTimeFormatter`).

Since subtrees rely on `InheritedWidget`, they must be inserted into the widget tree. This is usually done in the `MaterialApp.builder`. The order in which subtrees are inserted is important (`AlertingSubtree` might rely on functionality provided by `FormattingSubtee`). 

```dart
@override
Widget build(BuildContext context) {
  return MaterialApp(
    builder: (context, child) {
      return FormattingSubtree(
        child: AlertingSubtree(
          child: child!,
        ),
      );
    },
  );
}
```



