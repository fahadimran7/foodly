import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    final result = await runBusyFuture(runAuthentication());

    if (!result.hasError) {
      navigationService.replaceWith(successRoute);
    } else {
      setValidationMessage(result.errorMessage);
    }
  }

  Future<FirebaseAuthenticationResult> runAuthentication();
}
