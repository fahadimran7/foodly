import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../enums/basic_dialog_status.dart';
import '../../enums/dialog_type.dart';

class UserProfileViewModel extends BaseViewModel {
  final log = getLogger('UserProfileViewModel');

  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  String? _fullName = '';
  String _email = '';
  final _formKey = GlobalKey<FormState>();
  bool _touched = false;
  bool _buttonBusy = false;

  get fullName => _fullName;
  get email => _email;
  get formKey => _formKey;
  get touched => _touched;
  get buttonBusy => _buttonBusy;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setFullName(String fullName) {
    _fullName = fullName;
    notifyListeners();
  }

  void setTouched() {
    _touched = true;
    notifyListeners();
  }

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
      _email = res.email!;
      _fullName = res.fullName;
      setBusy(false);
      notifyListeners();
    } else {
      setError('Unable to get user details');
      setBusy(false);
      notifyListeners();
    }
  }

  Future<void> updateUserDetails() async {
    if (_formKey.currentState!.validate()) {
      setButtonBusy(true);
      final res = await _userService.updateUserAccountDetails(
        email: _email,
        fullName: _fullName == '' ? null : _fullName,
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
}
