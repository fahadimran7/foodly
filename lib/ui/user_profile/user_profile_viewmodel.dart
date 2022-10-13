import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_architecture/ui/shared/validators.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../enums/basic_dialog_status.dart';
import '../../enums/dialog_type.dart';

class UserProfileViewModel extends FormViewModel {
  final log = getLogger('UserProfileViewModel');
  void Function(Map<String, String> data)? _onInitialValues;

  listenToInitialValues(
      void Function(Map<String, String> data)? onInitialValues) {
    _onInitialValues = onInitialValues;
  }

  getInitialValues(Map<String, String> data) {
    _onInitialValues?.call(data);
  }

  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  bool _buttonBusy = false;

  get buttonBusy => _buttonBusy;

  void setButtonBusy(bool value) {
    _buttonBusy = value;
    notifyListeners();
  }

  void navigateBack() {
    _navigationService.back();
  }

  Future<void> getUserDetailsFromDb() async {
    setBusy(true);

    final res = await _userService.getUserAccountDetails();

    if (res != null) {
      getInitialValues.call({'fullName': res.fullName!, 'email': res.email!});
      setBusy(false);
      notifyListeners();
    } else {
      setError('Unable to get user details');
      setBusy(false);
      notifyListeners();
    }
  }

  Future<void> updateUserDetails() async {
    setButtonBusy(true);

    final nameValid =
        InputValidators.validateFullName(formValueMap['fullName']);
    final emailValid =
        InputValidators.validateEmailAddress(formValueMap['email']);

    if (!nameValid || !emailValid) {
      setValidationMessage('Enter a valid email address and full name.');
      setButtonBusy(false);
      notifyListeners();
    } else {
      final res = await _userService.updateUserAccountDetails(
        email: formValueMap['email'],
        fullName: formValueMap['fullName'],
      );

      if (res is bool) {
        log.v('User profile updated successfully');
        setButtonBusy(false);

        await _dialogService.showCustomDialog(
          variant: DialogType.basic,
          customData: BasicDialogStatus.success,
          title: 'Profile Update Success',
          description:
              'Your profile information has been updated successfully in our records. You can continue using the app as before.',
          mainButtonTitle: 'Got it',
          secondaryButtonTitle: 'Cancel',
        );
      } else {
        setButtonBusy(false);

        await _dialogService.showCustomDialog(
          variant: DialogType.basic,
          customData: BasicDialogStatus.error,
          title: 'Profile Update Failed',
          description: res.toString(),
          mainButtonTitle: 'Got it',
          secondaryButtonTitle: 'Cancel',
        );
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  void setFormStatus() {}
}
