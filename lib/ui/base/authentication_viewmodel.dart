import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/exceptions/firestore_api_exception.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.logger.dart';
import '../../models/application_models.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');

  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();
  final _authenticationService = locator<FirebaseAuthenticationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    log.i('value: $formValueMap');

    try {
      final result = await runBusyFuture(
        runAuthentication(),
        throwException: true,
      );
      await _handleAuthenticationResponse(result);
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> useGoogleAuthentication() async {
    final result = await _authenticationService.signInWithGoogle();
    await _handleAuthenticationResponse(result);
  }

  Future<void> useAppleAuthentication() async {
    final result = await _authenticationService.signInWithApple(
      appleClientId: '',
      appleRedirectUri:
          'https://fir-auth-7b9a8.firebaseapp.com/__/auth/handler',
    );
    await _handleAuthenticationResponse(result);
  }

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future<void> _handleAuthenticationResponse(
      FirebaseAuthenticationResult authResult) async {
    log.v('authResult has error: ${authResult.hasError}');

    if (!authResult.hasError && authResult.user != null) {
      final user = authResult.user;

      await userService.syncOrCreateUserAccount(
        user: User(id: user!.uid, email: user.email),
      );
      navigationService.replaceWith(successRoute);
    } else {
      if (authResult.hasError == false && authResult.user == null) {
        log.wtf(
          'We have no error but the user returned from firebase is null. This should not be happening.',
        );
      }

      log.w('Authentication failed: ${authResult.errorMessage}');

      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
