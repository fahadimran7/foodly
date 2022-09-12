import 'package:stacked_architecture/ui/base/authentication_viewmodel.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'login_view.form.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class LoginViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  LoginViewModel() : super(successRoute: Routes.startupView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() {
    return _firebaseAuthenticationService.loginWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );
  }

  void navigateToCreateAccount() {
    navigationService.navigateTo(Routes.createAccountView);
  }
}
