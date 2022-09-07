import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final _authenticationService = locator<FirebaseAuthenticationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    final result = await runBusyFuture(runAuthentication());
    _handleAuthenticationResponse(result);
  }

  Future<void> useGoogleAuthentication() async {
    final result = await _authenticationService.signInWithGoogle();
    _handleAuthenticationResponse(result);
  }

  Future<void> useAppleAuthentication() async {
    final result = await _authenticationService.signInWithApple(
      appleClientId: '',
      appleRedirectUri:
          'https://fir-auth-7b9a8.firebaseapp.com/__/auth/handler',
    );
    _handleAuthenticationResponse(result);
  }

  Future<FirebaseAuthenticationResult> runAuthentication();

  void _handleAuthenticationResponse(FirebaseAuthenticationResult authResult) {
    if (!authResult.hasError) {
      navigationService.replaceWith(successRoute);
    } else {
      setValidationMessage(authResult.errorMessage);
    }
  }
}
