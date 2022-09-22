import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/restaurant_service.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchRestaurantsViewModel extends FormViewModel {
  final log = getLogger('SearchRestaurantsViewModel');

  final _restaurantService = locator<RestaurantService>();
  final _navigationService = locator<NavigationService>();

  List _restaurantList = [];
  final List _searchResults = [];

  get restaurantList => _restaurantList;
  get searchResults => _searchResults;

  Future<void> getDataFromServer() async {
    setBusy(true);
    final res = await _restaurantService.listOfRestaurants();

    if (res is bool) {
      setError('Something went wrong. We are sorry for the inconvinience.');
      throw Exception('An error occured');
    }

    _restaurantList = res;
    setBusy(false);
    notifyListeners();
  }

  void filterResults(String searchText) {
    log.v('formValueMap for search: $formValueMap');
    _searchResults.clear();

    for (var restaurant in _restaurantList) {
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
  void setFormStatus() {}
}
