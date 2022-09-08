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
          'When called should check if we have a logged in user on userService',
          () async {
        final userService = getAndRegisterUserService();
        final model = _getModel();
        await model.runStartUpLogic();

        verify(userService.hasLoggedInUser);
      });

      test(
          'When we have no logged in user, should navigate to the onboardingView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        final model = _getModel();
        await model.runStartUpLogic();

        verify(navigationService.replaceWith(Routes.onboardingView));
      });

      test(
          'When hasLoggedInUser is true, should call syncUserAccount on the userService',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartUpLogic();

        verify(userService.syncUserAccount());
      });

      test(
          'When hasLoggedInUser is true, should call currentUser from userService',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartUpLogic();

        verify(userService.currentUser);
      });

      test(
          'When currentUser does NOT have a default address, navigate to addressSelectionView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartUpLogic();

        verify(navigationService.navigateTo(Routes.addressSelectionView));
      });
    });
  });
}
