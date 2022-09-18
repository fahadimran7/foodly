import 'package:stacked_architecture/api/firestore_api.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';

import '../models/application_models.dart';

class RestaurantService {
  final log = getLogger('RestaurantsService');

  final _firestoreApi = locator<FirestoreApi>();

  Stream<List<Restaurant>> streamOfFeaturedRestaurants() {
    return _firestoreApi.getListOfFeaturedRestaurants();
  }

  Stream<List<Restaurant>> streamOfEditorsPickRestaurants() {
    return _firestoreApi.getListOfEditorsPickRestaurants();
  }

  Stream<List<Menu>> streamOfMenuForRestaurant({required String restaurantId}) {
    return _firestoreApi.getMenuForRestaurant(
      restaurantId: restaurantId,
    );
  }
}
