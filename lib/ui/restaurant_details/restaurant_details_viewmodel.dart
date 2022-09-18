import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/restaurant_service.dart';

import '../../app/app.locator.dart';

class RestaurantDetailsViewModel extends StreamViewModel {
  final _restaurantService = locator<RestaurantService>();

  String restaurantId;

  RestaurantDetailsViewModel({
    required this.restaurantId,
  });

  get restaurantMenu => data;

  get menuMap {
    final menuMap = {};

    for (Menu menuItem in data) {
      var menuList = [];
      if (!menuMap.containsKey(menuItem.category)) {
        menuList = [menuItem];
      } else {
        menuList = [...menuMap[menuItem.category], menuItem];
      }

      menuMap[menuItem.category] = menuList;
    }

    return menuMap;
  }

  get featuredItems {
    final featuredItemsList = [];

    for (Menu menuItem in data) {
      if (menuItem.isFeatured) {
        featuredItemsList.add(menuItem);
      }
    }

    return featuredItemsList;
  }

  @override
  Stream<List<Menu>> get stream {
    return _restaurantService.streamOfMenuForRestaurant(
      restaurantId: restaurantId,
    );
  }
}
