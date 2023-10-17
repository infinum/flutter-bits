# Oauth 2.0 with AWS Cognito

Amazon Cognito is a versatile identity platform for web and mobile applications. It serves as a user directory, an authentication server, and an authorization service for OAuth 2.0 access tokens and AWS credentials. With Amazon Cognito, you can easily authenticate and authorize users from various sources, including the built-in user directory, your enterprise directory, and popular consumer identity providers like Google and Facebook.

# Setup
To integrate OAuth 2.0 with AWS Cognito in your Flutter application, follow these steps:
### 1. Set Up AWS Amplify
Before you begin, make sure you have AWS Amplify installed and configured. If not, you can follow the official AWS Amplify Flutter setup guide here.

### 2. Add Dependencies
In your project's pubspec.yaml file, add the necessary dependencies for AWS Amplify and Cognito:

```yaml
dependencies:
flutter:
sdk: flutter
amplify_flutter: <latest_version>
amplify_auth_cognito: <latest_version>
# Add other dependencies as needed
```

Make sure to replace <latest_version> with the appropriate version numbers.

### 3. Use Existing Amplify Configuration
Now you'll need to obtain the JSON configuration file generated after the cloud setup process. Save this file somewhere in your project. Create a new Dart file named amplify_config_dev.dart and copy the contents of the JSON file into it.

### 4. Initialize Amplify
In your project's entry point, typically main.dart, ensure that Amplify is initialized before your app runs. Here's an example of how to configure Amplify:

```dart
import 'package:flutter/widgets.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplify_config_dev.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(MyApp());
}

Future<void> configureAmplify() async {
  try {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    print(e);
  }
}
```

### 6. Use Amplify for OAuth 2.0
For practical examples and usage, refer to the oauth.dart file within your project. This is where you'll implement OAuth 2.0 with AWS Cognito in your Flutter application.