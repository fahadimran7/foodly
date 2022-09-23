import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/cart_service.dart';

class OrderViewModel extends StreamViewModel<List<Cart>> {
  final _cartService = locator<CartService>();

  @override
  Stream<List<Cart>> get stream => _cartService.getCartItemsAsStream();
}
