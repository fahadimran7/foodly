import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/api/firestore_api.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_architecture/ui/address_selection/address_selection_view.dart';
import 'package:stacked_architecture/ui/create_account/create_account_view.dart';
import 'package:stacked_architecture/ui/login/login_view.dart';
import 'package:stacked_architecture/ui/onboarding/onboarding_view.dart';
import 'package:stacked_architecture/ui/startup/startup_view.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartupView, initial: true),
  CupertinoRoute(page: AddressSelectionView),
  CupertinoRoute(page: CreateAccountView),
  CupertinoRoute(page: OnboardingView),
  CupertinoRoute(page: LoginView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: FirestoreApi),
  LazySingleton(classType: UserService),
  Singleton(classType: FirebaseAuthenticationService)
], logger: StackedLogger())
class AppSetup {}
