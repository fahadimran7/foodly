import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/enums/basic_dialog_status.dart';
import 'package:stacked_architecture/enums/dialog_type.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/cart_service.dart';
import 'package:stacked_architecture/services/restaurant_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomSheetViewModel extends BaseViewModel {
  final _cartService = locator<CartService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  final Map<String, dynamic> choices;
  final Map<String, dynamic> _choiceList = {};
  int _cartCount = 1;

  get choiceList => _choiceList;
  get cartCount => _cartCount;

  BottomSheetViewModel({required this.choices});

  void setDefaultChoice() {
    choices.forEach((key, value) {
      _choiceList[key] = value[0];
    });
  }

  void setChoiceOption(choiceGroup, value) {
    _choiceList[choiceGroup] = value;
    notifyListeners();
  }

  void incrementCount() {
    _cartCount++;
    notifyListeners();
  }

  void decrementCount() {
    if (cartCount > 1) {
      _cartCount--;
    }
    notifyListeners();
  }

  void addItemToCart(
      {required Menu menuDetails, required String restaurantName}) async {
    setBusy(true);
    final Cart cartItem = Cart(
      id: menuDetails.id,
      name: menuDetails.name,
      decription: menuDetails.description,
      price: menuDetails.price,
      quantity: _cartCount.toString(),
      restaurant: restaurantName,
      choices: menuDetails.choices != null ? _choiceList : null,
    );
    final userId = _firebaseAuthenticationService.currentUser!.uid;

    final res = await _cartService.addItemToCart(
      cartItem: cartItem,
      userId: userId,
    );

    setBusy(false);

    if (res == true) {
      final dialogResult = await _dialogService.showCustomDialog(
        variant: DialogType.basic,
        customData: BasicDialogStatus.success,
        title: 'Menu Added to Cart',
        description:
            'The order has been added to your cart successfully. You can continue browsing or view your cart to complete your order.',
        mainButtonTitle: 'View Cart',
        secondaryButtonTitle: 'Back',
      );

      if (dialogResult!.confirmed) {
        _navigationService.navigateTo(Routes.homeView);
      }
    } else {
      final dialogResult = await _dialogService.showCustomDialog(
        variant: DialogType.basic,
        customData: BasicDialogStatus.error,
        title: 'Menu Not Added',
        description:
            'The order could not be added to your cart. Please try again later. We are sorry for the inconvenience.',
        mainButtonTitle: 'View Menu',
        secondaryButtonTitle: 'Back',
      );

      if (dialogResult!.confirmed) {
        _navigationService.navigateTo(Routes.homeView);
      }
    }
  }
}
