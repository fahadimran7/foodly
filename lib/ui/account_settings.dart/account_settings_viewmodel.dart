import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/ui/shared/setup_dialog_ui.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../enums/basic_dialog_status.dart';
import '../../enums/dialog_type.dart';

class AccountSettingsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<FirebaseAuthenticationService>();
  final _dialogService = locator<DialogService>();

  void navigateToProfileView() {
    _navigationService.navigateTo(Routes.userProfileView);
  }

  void showLogoutUserDialog() async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.basic,
      customData: BasicDialogStatus.warning,
      title: 'Confirm Sign out',
      description:
          'Are you sure you want to sign out from the app. Your data will remain unaffected. You\'ll need to sign in again to access your account.',
      mainButtonTitle: 'Yes',
      secondaryButtonTitle: 'Cancel',
    );

    if (dialogResult!.confirmed) {
      await _logoutUser();
    }
  }

  Future<void> _logoutUser() async {
    await resetLocator();
    await runBusyFuture(_authenticationService.logout());
    _navigationService.replaceWith(Routes.startupView);
  }

  // Need to reset singletons on logout otherwise bad things will happen
  // For instance we will get the old versions of user service and firebase service and
  // the old user account will be synced by the syncOrCreateUserAccount method
  resetLocator() async {
    await locator.reset(dispose: true);
    setupLocator();
    setupDialogUi();
  }
}
