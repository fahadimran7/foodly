import 'package:stacked/stacked.dart';

import '../../api/firestore_api.dart';
import '../../app/app.locator.dart';
import '../../services/user_service.dart';

class FeaturedRestaurantsViewModel extends BaseViewModel {
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
