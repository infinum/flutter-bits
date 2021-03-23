
## Loggy for Crashlytics

We want to log useful logs and errors to crashlytics. For this you can use FirebaseLogPrinter
that's part of this.

This kind of logging will help in two ways:

Exception is raised in interactor/repository, let's say unexpected JSON and our parsing breaks, the
request_provider would catch that exception and show it to the user. Although this might be bug
in our code and app will not work, this kind of error will not be registered on crashlytics since
it's caught and handled. FirebaseLogPrinter would submit that error to crashlytics.

When crash happens it's useful to have some more context on what happened. That's why every loggy
log will be reported as Crashlytics log in case crash happens.

### Implementation

1) Add FirebaseLogPrinter from this repo to your project.

2) In Loggy init do two things:
- use FirebaseLogPrinter for release builds
- for release blacklist Loggies that would record a lot of unnecessary or sensitive data, that would
 usually be network traffic (DioLoggy and similar).

```dart
  Loggy.initLoggy(
    logPrinter: (appBuildMode == AppBuildMode.release) ? const FirebaseLogPrinter() : PrettyDeveloperPrinter(),
    blacklist: [
      if (appBuildMode == AppBuildMode.release) DioLoggy,
    ],
```