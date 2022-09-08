import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/ui/startup/startup_viewmodel.dart';

import '../helpers/test_helpers.dart';

StartupViewModel _getModel() => StartupViewModel();

void main() {
  group('StartupViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('runStartupLogic -', () {
      test(
          'When called should check if we have a logged in user on UserService',
          () async {
        final userService = getAndRegisterUserService();
        final model = _getModel();
        await model.runStartUpLogic();

        verify(userService.hasLoggedInUser);
      });

      test(
          'When we have no logged in user, should navigate to the onboarding view',
          () async {
        final navigationService = getAndRegisterNavigationService();
        final model = _getModel();
        await model.runStartUpLogic();

        verify(navigationService.replaceWith(Routes.onboardingView));
      });

      test(
          'When hasLoggedInUser is true, should call syncUserAccount on the UserService',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartUpLogic();

        verify(userService.syncUserAccount());
      });

      test(
          'When hasLoggedInUser is true, should call currentUser from UserService',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartUpLogic();

        verify(userService.currentUser);
      });
    });
  });
}
