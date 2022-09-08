import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  Future<void> runStartUpLogic() async {
    if (_userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile...');
      await _userService.syncUserAccount();

      final currentUser = _userService.currentUser;
      log.v('User sync complete. User profile $currentUser');

      if (!currentUser.hasAddress) {
        _navigationService.navigateTo(Routes.addressSelectionView);
      }
    } else {
      log.v('No user on disk, navigate to onboarding view');
      _navigationService.replaceWith(Routes.onboardingView);
    }
  }
}
