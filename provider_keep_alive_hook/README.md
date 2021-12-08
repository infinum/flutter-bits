# useProviderKeepAlive

A hook that prevents a provider from being automatically disposed.

This hook listens to a provider (similarly to `useProvider`), without triggering a rebuild when the provider value changes.

#### Example usage

```dart
class Example extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useProviderKeepAlive(counterProvider);
    return Container();
  }
}
```

As long as the `Example` widget is in the widget tree, the `counterProvider` will not get disposed.
When the `counterProvider` value changes, the `Example` widget will not get rebuild.
