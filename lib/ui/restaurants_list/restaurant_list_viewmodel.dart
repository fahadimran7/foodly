import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../models/application_models.dart';

class RestaurantListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }

  void navigateToDetailsView({required Restaurant restaurantDetails}) {
    _navigationService.navigateTo(Routes.restaurantDetailsView,
        arguments: RestaurantDetailsViewArguments(
            restaurantDetails: restaurantDetails));
  }
}
