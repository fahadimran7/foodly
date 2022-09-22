import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/api/firestore_api.dart';
import 'package:stacked_architecture/services/restaurant_service.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_architecture/ui/address_selection/address_selection_view.dart';
import 'package:stacked_architecture/ui/create_account/create_account_view.dart';
import 'package:stacked_architecture/ui/home/home_view.dart';
import 'package:stacked_architecture/ui/login/login_view.dart';
import 'package:stacked_architecture/ui/onboarding/onboarding_view.dart';
import 'package:stacked_architecture/ui/restaurant_details/restaurant_details_view.dart';
import 'package:stacked_architecture/ui/restaurants_list/restaurants_list_view.dart';
import 'package:stacked_architecture/ui/startup/startup_view.dart';
import 'package:stacked_architecture/ui/update_password/update_password_view.dart';
import 'package:stacked_architecture/ui/user_profile/user_profile_view.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:places_service/places_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartupView, initial: true),
  CupertinoRoute(page: AddressSelectionView),
  CupertinoRoute(page: CreateAccountView),
  CupertinoRoute(page: OnboardingView),
  CupertinoRoute(page: LoginView),
  CupertinoRoute(page: HomeView),
  CupertinoRoute(page: RestaurantsListView),
  CupertinoRoute(page: RestaurantDetailsView),
  CupertinoRoute(page: UserProfileView),
  CupertinoRoute(page: UpdatePasswordView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: FirestoreApi),
  LazySingleton(classType: UserService),
  LazySingleton(classType: PlacesService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: RestaurantService),
  Singleton(classType: FirebaseAuthenticationService)
], logger: StackedLogger())
class AppSetup {}
