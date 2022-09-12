import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';

class UserProfileViewModel extends BaseViewModel {
  final log = getLogger('UserProfileViewModel');

  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<FirebaseAuthenticationService>();

  String? _fullName = '';
  String _email = '';
  final _formKey = GlobalKey<FormState>();
  bool _touched = false;

  get fullName => _fullName;
  get email => _email;
  get formKey => _formKey;
  get touched => _touched;

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
      final res = await _userService.updateUserAccountDetails(
        email: _email,
        fullName: _fullName == '' ? null : _fullName,
      );

      if (res is bool) {
        log.v('User profile updated successfully');
      }
    } else {
      setError('Invalid name or email address');
    }
  }
}
