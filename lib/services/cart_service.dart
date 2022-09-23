import 'package:stacked_architecture/api/firestore_api.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class CartService {
  final log = getLogger('CartService');

  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  Future<dynamic> addItemToCart({
    required Cart cartItem,
    required String userId,
  }) {
    return _firestoreApi.addMenuItemToCart(cartItem: cartItem, userId: userId);
  }

  Stream<List<Cart>> getCartItemsAsStream() {
    final userId = _firebaseAuthenticationService.currentUser!.uid;
    return _firestoreApi.fetchCartItemsAsStream(userId: userId);
  }
}
