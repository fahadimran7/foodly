import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/services/user_service.dart';

import '../../api/firestore_api.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _fireStoreApi = locator<FirestoreApi>();
  final _userService = locator<UserService>();

  String? _currentLocation;

  Future<void> getLocationForCurrentUser() async {
    setBusy(true);
    final location = await _fireStoreApi
        .getFormattedLocationForUser(_userService.currentUser);
    _currentLocation = location;
    notifyListeners();

    setBusy(false);
  }

  get currentLocation => _currentLocation;
}
