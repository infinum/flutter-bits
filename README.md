# Flutter-Bits

A collection of common components and pieces that you can add to your Flutter project.

- [Look](https://github.com/infinum/Flutter-Bits/blob/master/look)
Handle app styling

- [Device Permissions](https://github.com/infinum/flutter-bits/tree/master/device_permissions)
Handle device permissions

- [Loggy for Crashlytics](https://github.com/infinum/flutter-bits/tree/master/loggy_crashlytics)
Loggy addition that logs to crashlytics.

#### Provider and Riverpod

- [Init Provider Hook](https://github.com/infinum/flutter-bits/tree/master/init_provider_hook)
useInitProvider hook that gives callback to initialize providers

- [Request Provider](https://github.com/infinum/flutter-bits/tree/master/request_provider)
Handle API request states

- [ProviderKeepAlive](https://github.com/infinum/flutter-bits/tree/master/provider_keep_alive)
Utility widget to ensure providers are not disposed as long as this widget is in the widget tree.

- [Disposable Listener](https://github.com/infinum/flutter-bits/tree/master/disposable_listener)
Widget for easier stream listening. Useful when controlling navigation and dialogs from provider

#### Gists, snippets and other resources

- [Article: Custom markers for google_maps_flutter](https://infinum.com/the-capsized-eight/creating-custom-markers-on-google-maps-in-flutter-apps)

## Usage

Like some other [collections](https://github.com/gskinnerTeam/flutter_vignettes) this repo is designed to contain multiple flutter projects (one project per sample).

## Contributing

### Small code snippet (one or two files)
- Go to the root of the project and create new directory
- Add README.md and descibe the snippet. Also add link to this README.

### Some feature (full project)
- Go to the root of the project and create new sample by creating new flutter project `flutter create my_new_flutter_bit`
- Write the code inside that project and keep in mind that purpose of that code is to be read by others, so keep it nice and clean.
- Write the README inside your project and explain in short what is it and how everything works. Include the video or screenshot if the feature can be visually represented.
- Reduce your dependencies to minimum. List them all in README and explain why are they needed.
- Go to the root project README and modify it to include your sample.
- Open up a Pull Request.
