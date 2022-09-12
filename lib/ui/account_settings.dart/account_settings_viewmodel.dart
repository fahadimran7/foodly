import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class AccountSettingsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<FirebaseAuthenticationService>();

  void navigateToProfileView() {
    _navigationService.navigateTo(Routes.userProfileView);
  }

  Future<void> logoutUser() async {
    await runBusyFuture(_authenticationService.logout());
    _navigationService.clearStackAndShow(Routes.onboardingView);
  }
}
