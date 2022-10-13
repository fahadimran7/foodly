import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/enums/basic_dialog_status.dart';
import 'package:stacked_architecture/enums/dialog_type.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/cart_service.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderViewModel extends StreamViewModel<List<Cart>> {
  final _cartService = locator<CartService>();
  final _dialogService = locator<DialogService>();

  @override
  Stream<List<Cart>> get stream => _cartService.getCartItemsAsStream();

  void showPaymentDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.basic,
      customData: BasicDialogStatus.error,
      title: 'Payments not supported',
      description:
          'At the moment we do not support payments through the app. The functionality will be available soon. We are sorry for the inconvenience.',
      mainButtonTitle: 'Got it',
      secondaryButtonTitle: 'Back',
    );
  }
}
