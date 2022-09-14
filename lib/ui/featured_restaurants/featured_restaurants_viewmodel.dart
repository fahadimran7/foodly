import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../api/firestore_api.dart';
import '../../app/app.locator.dart';
import '../../models/application_models.dart';
import '../../services/restaurant_service.dart';
import '../../services/user_service.dart';

const String _featuredRestaurantsStreamKey = 'featured-restaurants-stream';
const String _editorsPickRestaurantsStreamKey =
    'editors-pick-restaurants-stream';

class FeaturedRestaurantsViewModel extends MultipleStreamViewModel {
  final _fireStoreApi = locator<FirestoreApi>();
  final _userService = locator<UserService>();
  final _restaurantService = locator<RestaurantService>();
  final _navigationService = locator<NavigationService>();

  String? _currentLocation;

  Future<void> getLocationForCurrentUser() async {
    setBusy(true);
    final location = await _fireStoreApi
        .getFormattedLocationForUser(_userService.currentUser.id);
    _currentLocation = location;
    notifyListeners();

    setBusy(false);
  }

  get currentLocation => _currentLocation;

  List<FeaturedRestaurant>? get featuredRestaurants =>
      dataMap![_featuredRestaurantsStreamKey];

  List<EditorsPickRestaurant>? get editorsPickRestaurants =>
      dataMap![_editorsPickRestaurantsStreamKey];

  @override
  Map<String, StreamData> get streamsMap => {
        _featuredRestaurantsStreamKey: StreamData<List<FeaturedRestaurant>>(
          _restaurantService.streamOfFeaturedRestaurants(),
        ),
        _editorsPickRestaurantsStreamKey:
            StreamData<List<EditorsPickRestaurant>>(
          _restaurantService.streamOfEditorsPickRestaurants(),
        ),
      };

  navigateToFeaturedRestaurantsListView() {
    _navigationService.navigateTo(
      Routes.restaurantsListView,
      arguments: RestaurantsListViewArguments(
        restaurantsList: featuredRestaurants as List<dynamic>,
      ),
    );
  }

  navigateToEditorsPickRestaurantsListView() {
    _navigationService.navigateTo(
      Routes.restaurantsListView,
      arguments: RestaurantsListViewArguments(
        restaurantsList: editorsPickRestaurants as List<dynamic>,
      ),
    );
  }
}
