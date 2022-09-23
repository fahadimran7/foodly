import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/restaurant_service.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchRestaurantsViewModel extends FutureViewModel<dynamic> {
  final log = getLogger('SearchRestaurantsViewModel');

  final _restaurantService = locator<RestaurantService>();
  final _navigationService = locator<NavigationService>();

  final List _searchResults = [];

  get searchResults => _searchResults;

  Future<dynamic> getDataFromServer() async {
    final res = await _restaurantService.listOfRestaurants();

    log.v('The future is called!');

    if (res is bool) {
      setError('Something went wrong. We are sorry for the inconvinience.');
      throw Exception('An error occured');
    }

    return res;
  }

  void filterResults(String searchText) {
    _searchResults.clear();

    for (var restaurant in data) {
      if (restaurant.name.contains(searchText)) {
        _searchResults.add(restaurant);
      }
    }

    notifyListeners();
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

  @override
  Future<dynamic> futureToRun() => getDataFromServer();

  @override
  void onError(error) {
    log.e('Something went wrong $error');
  }
}
