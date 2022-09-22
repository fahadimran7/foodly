import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/enums/bottom_sheet_type.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/restaurant_service.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class RestaurantDetailsViewModel extends StreamViewModel {
  final _restaurantService = locator<RestaurantService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

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

  void navigateBack() => _navigationService.back();

  @override
  Stream<List<Menu>> get stream {
    return _restaurantService.streamOfMenuForRestaurant(
      restaurantId: restaurantId,
    );
  }

  void displayMenuDetails({required Menu menuDetails}) async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.floating,
      mainButtonTitle: 'Place order',
      secondaryButtonTitle: 'Cancel',
      data: menuDetails,
      isScrollControlled: true,
    );

    if (sheetResponse != null) {
      if (sheetResponse.confirmed) {
        print('Confirmed');
      }
    }
  }
}
