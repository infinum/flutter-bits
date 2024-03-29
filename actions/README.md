# Actions

Actions represent communication between presenter and UI in cases where execution of an action does not change the view tree in a declarative way. This includes navigation, showing dialogs, snack bars, etc.

## Action

An action represents an operation that should be executed on the UI side.

Since a presenter can emit multiple types of actions, they are bundled together with the help of `freezed`.

```dart
@freezed
class HomeScreenAction with _$HomeScreenAction {
  const factory HomeScreenAction.showInfoDialog() = _HomeScreenActionShowInfoDialog;
  const factory HomeScreenAction.showErrorSnackBar(Exception e) = _HomeScreenActionShowErrorSnackBar;
}
```

## ActionNotifier and ActionProvider

Add `ActionNotifier` and `ActionProvider` to your project to make managing actions and creating action-providers easier.

```dart
class ActionNotifier<T> extends AutoDisposeNotifier<T?> {
  @override
  T? build() {
    return null;
  }

  void emit(T action) {
    state = action;
  }

  @override
  bool updateShouldNotify(T? previous, T? next) {
    return true;
  }
}

abstract class ActionProvider {
  ActionProvider._();

  static AutoDisposeNotifierProvider<ActionNotifier<T>, T?> autoDispose<T>() =>
      NotifierProvider.autoDispose<ActionNotifier<T>, T?>(() => ActionNotifier<T>());
}
```

## Usage

```dart
class HomeScreenPresenter extends AutoDisposeNotifier<void> {
  @override
  void build() {}

  Future<void> submit() async {
    try {
      // ...
    } on Exception catch (e) {
      ref.read(homeScreenActionProvider.notifier).emit(HomeScreenAction.showErrorSnackBar(e));
    }
  }
}

final homeScreenActionProvider = ActionProvider.autoDispose<HomeScreenAction>();

@freezed
class HomeScreenAction with _$HomeScreenAction {
  const factory HomeScreenAction.showInfoDialog() = _HomeScreenActionShowInfoDialog;
  const factory HomeScreenAction.showErrorSnackBar(Exception e) = _HomeScreenActionShowErrorSnackBar;
}

// ---------------------------------------------------------------------------------------------------------
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(homeScreenActionProvider, (_, action) {
      action?.when(
        showInfoDialog: () => showDialog(...),
        showErrorSnackBar: (e) => ScaffoldMessenger.of(context).showSnackBar(...),
      );
    });
    // ...
  }
}
```

## Returning result back to presenter

Use `Completer` to pass the result of an action, from UI back to the presenter.

```dart
class HomeScreenPresenter extends AutoDisposeNotifier<void> {
  @override
  void build() {}

  Future<void> delete() async {
    final completer = Completer<bool>();
    ref.read(homeScreenActionProvider.notifier).emit(HomeScreenAction.confirmDelete(completer));

    final confirmed = await completer.future;
    if (!confirmed){
      return;
    }
    // ...
  }
}

final homeScreenActionProvider = ActionProvider.autoDispose<HomeScreenAction>();

@freezed
class HomeScreenAction with _$HomeScreenAction {
  const factory HomeScreenAction.confirmDelete(Completer<bool> completer) = _HomeScreenActionConfirmDelete;
}

// ---------------------------------------------------------------------------------------------------------
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(homeScreenActionProvider, (_, action) {
      action?.when(
        confirmDelete: (completer) async {
          final result = await showDialog(...);
          completer.complete(result);
        }
      );
    });
    // ...
  }
}
```