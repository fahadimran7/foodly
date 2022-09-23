import 'package:flutter/material.dart';
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

class RestaurantsHomeViewModel extends MultipleStreamViewModel {
  final _fireStoreApi = locator<FirestoreApi>();
  final _userService = locator<UserService>();
  final _restaurantService = locator<RestaurantService>();
  final _navigationService = locator<NavigationService>();

  String? _currentLocation;
  late PageController _pageController;
  String? _currentImage;

  final List<String> _imagesList = [
    'assets/images/banner-top.jpeg',
    'assets/images/banner-top-2.jpeg',
    'assets/images/banner-top-3.jpeg',
  ];

  initialize() async {
    // await _getLocationForCurrentUser();
    _createPageController();
    _setStartingImage();
  }

  // Not using current location for now but keeping the functionality as an optional extra
  Future<void> _getLocationForCurrentUser() async {
    setBusy(true);
    final location = await _fireStoreApi
        .getFormattedLocationForUser(_userService.currentUser.id);
    _currentLocation = location;
    notifyListeners();
    setBusy(false);
  }

  setCurrentPage(page) {
    _currentImage = _imagesList[page];
    notifyListeners();
  }

  void _createPageController() {
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    notifyListeners();
  }

  void _setStartingImage() {
    _currentImage = _imagesList[1];
    notifyListeners();
  }

  get currentLocation => _currentLocation;
  get pageController => _pageController;
  get currentImage => _currentImage;
  get imagesList => _imagesList;
  get featuredRestaurantsStreamKey => _featuredRestaurantsStreamKey;
  get editorsPickRestaurantsStreamKey => _editorsPickRestaurantsStreamKey;

  List<Restaurant>? get featuredRestaurants =>
      dataMap![_featuredRestaurantsStreamKey];

  List<Restaurant>? get editorsPickRestaurants =>
      dataMap![_editorsPickRestaurantsStreamKey];

  @override
  Map<String, StreamData> get streamsMap => {
        _featuredRestaurantsStreamKey: StreamData<List<Restaurant>>(
          _restaurantService.streamOfFeaturedRestaurants(),
        ),
        _editorsPickRestaurantsStreamKey: StreamData<List<Restaurant>>(
          _restaurantService.streamOfEditorsPickRestaurants(),
        ),
      };

  navigateToFeaturedRestaurantsListView() {
    _navigationService.navigateTo(
      Routes.restaurantsListView,
      arguments: RestaurantsListViewArguments(
          restaurantsList: featuredRestaurants as List<dynamic>,
          appBarText: 'Featured Partners'),
    );
  }

  navigateToEditorsPickRestaurantsListView() {
    _navigationService.navigateTo(
      Routes.restaurantsListView,
      arguments: RestaurantsListViewArguments(
          restaurantsList: editorsPickRestaurants as List<dynamic>,
          appBarText: 'Editors Choice'),
    );
  }

  void navigateToRestaurantDetailsView(
      {required Restaurant restaurantDetails}) {
    _navigationService.navigateTo(
      Routes.restaurantDetailsView,
      arguments: RestaurantDetailsViewArguments(
        restaurantDetails: restaurantDetails,
      ),
    );
  }
}
