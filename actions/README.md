# Actions

Actions represent communication between presenter and UI, in cases where execution of actions does not change the view tree in a declarative way. This includes navigation, showing dialog, toasts, etc.

More about actions can be found in [handbook](https://infinum.com/handbook/flutter/architecture/communication-between-ui-and-provider#actions-ui-andlt-provider).

Manually implementing actions using `Streams` is error-prone and requires some boilerplate code. Here you can find some code bits, that will make creating and managing actions easier.

## Action

An action represents an operation that should be done on the Ui side.

Since a presenter can emit multiple types of actions, they are bundled together with the help of `freezed`.

```dart
@freezed
class HomeScreenAction with _$HomeScreenAction {
  const factory HomeScreenAction.showInfoDialog() = HomeScreenActionShowInfoDialog;
  const factory HomeScreenAction.showSuccessToast() = HomeScreenActionShowSuccessToast;
}
```

## Action emitter

Action emitter is any class that emits (gives-out) actions. Actions are emitted as a `Stream` of `Action` objects.

A class that emits actions must implement the `ActionEmitter` interface.

```dart
class HomeScreenPresenter implements ActionEmitter<HomeScreenAction> {
  @override
  Stream<HomeScreenAction> get action => //...
}
```

## Action emitter mixin

The implementation of the `ActionEmitter` can be delegated to an `ActionEmitterMixin`.

`ActionEmitterMixin` will create and manage the action `Stream` and provide a utility method for sending actions down the stream.

There are multiple `ActionEmitterMixin`s, for mixing into different types of host classes.

```dart
class HomeScreenPresenter extends ChangeNotifier with ChangeNotifierActionEmitterMixin<HomeScreenAction> {
  void onInfoPressed() {
    const action = HomeScreenAction.showInfoDialog();
    emitAction(action);
  }
}
```

## Action listener hook

The `useActionListener` hook provides a handy way to listen to the `ActionEmitter`.

```dart
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(homeScreenPresenterProvider);

    useActionListener((CompositeSubscription compositeSubscription) {
      presenter.action.listen((action) {
        action.when(
          showInfoDialog: () => showInfoDialog(context: context),
          showSuccessToast: () => showSuccessToast(context: context),
        );
      }).addTo(compositeSubscription);
    });

    return Container();
  }
}
```
