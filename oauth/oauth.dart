import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:loggy/loggy.dart';

class AuthRepositoryImpl {
  AuthRepositoryImpl(this._auth);

  final AuthCategory _auth;

  Future<void> login(String username, String password) async {
    try {
      final response = await _auth.signIn(username: username, password: password);

      if (response.isSignedIn) {
        final session = await _auth.fetchAuthSession(
                options: const FetchAuthSessionOptions(pluginOptions: CognitoFetchAuthSessionPluginOptions()))
            as CognitoAuthSession;

        // Get tokens and save to secure storage
        final userSession = session.userPoolTokensResult.value;
        //  userSession.accessToken.raw,
        //  userSession.refreshToken,
        //  userSession.idToken.raw,
      } else {
        throw Exception('Implement when isSignedIn is false');
      }
    } catch (e) {
      if (e is AuthException) {
        // Handle exception from Auth
        throw Exception(e);
      } else {
        rethrow;
      }
    }
  }

  Future<void> isUserLoggedIn() async {
    try {
      final session = await _auth.fetchAuthSession(
          options: const FetchAuthSessionOptions(
        pluginOptions: CognitoFetchAuthSessionPluginOptions(),
      ));

      if (session is! CognitoAuthSession || session.isSignedIn == false) {
        return null;
      }

      logDebug('User is logged in. Id: ${session.userSubResult.value}');

      // Update tokens
      final userSession = session.userPoolTokensResult.value;
      //  userSession.accessToken.raw,
      //  userSession.refreshToken,
      //  userSession.idToken.raw,
    } catch (e) {
      if (e is SignedOutException) {
        return;
      }

      rethrow;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> register(String username, String email, String password, DateTime dateOfBirth) async {
    // ...
    final response = await _auth.signUp(
      username: username,
      password: password,
      options: SignUpOptions(
        userAttributes: {
          // Custom key
          const CognitoUserAttributeKey.custom('display_username'): username,

          // Cognito keys
          CognitoUserAttributeKey.email: email,
          CognitoUserAttributeKey.birthdate: dateOfBirth.toIso8601String(),
        },
        pluginOptions: CognitoSignUpPluginOptions(),
      ),
    );
    // ...
  }

  Future<void> verifyEmail(String username, String password, String code) async {
    // ...
    final response = await _auth.confirmSignUp(username: username, confirmationCode: code);
    // ...
  }

  Future<void> resendVerificationMail(String username) async {
    // ...
    await _auth.resendSignUpCode(username: username);
    // ...
  }

  Future<void> changePassword({required String oldPassword, required String newPassword}) async {
    // ...
    await _auth.updatePassword(oldPassword: oldPassword, newPassword: newPassword);
    // ...
  }

  Future<void> resetPassword(String usernameOrEmail) async {
    // ...
    final result = await _auth.resetPassword(
      username: usernameOrEmail,
      options: ResetPasswordOptions(
        pluginOptions: CognitoResetPasswordPluginOptions(),
      ),
    );
    // ...
  }

  Future<void> verifyPasswordReset(String usernameOrEmail, String newPassword, String code) async {
    // ...
    await _auth.confirmResetPassword(username: usernameOrEmail, newPassword: newPassword, confirmationCode: code);
    // ...
  }
}
