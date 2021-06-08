
# useInitProvider


Hook that returns the provider and calls [onInit] exactly once.

This is designed to be used with init method on provider to initialize some runtime dependencies.

#### Example usage

```dart

  @override
  Widget build(BuildContext context) {
    final _testProvider = useInitProvider(testProvider, (TestProvider p) => p.init(id));

    // provider is inited and ready to be used here
    return Container(...);
  }
```