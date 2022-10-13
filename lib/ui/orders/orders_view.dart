import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/busy_button.dart';
import 'package:stacked_architecture/ui/orders/components/order_list_item.dart';
import 'package:stacked_architecture/ui/orders/orders_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderViewModel>.reactive(
      viewModelBuilder: () => OrderViewModel(),
      builder: (context, model, child) {
        if (!model.dataReady) {
          return const AppLoading();
        } else {
          final cartItemList = model.data as List<Cart>;

          return SafeArea(
            child: SizedBox(
              height: screenHeightPercentage(context),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: globalContentPadding,
                    right: globalContentPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      verticalSpaceMedium,
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Your Order',
                            style: TextStyle(
                              fontSize: kBodyTextLarge1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceLarge,
                      for (final cartItem in cartItemList)
                        OrderListItem(cartItem: cartItem),
                      if (cartItemList.isEmpty) _buildNoResultsMessage(context),
                      if (cartItemList.isNotEmpty)
                        Column(
                          children: [
                            _buildOrderCalculationRow(
                              name: 'Subtotal',
                              amount: _calculateSubTotal(cartItemList)
                                  .toStringAsFixed(2),
                            ),
                            verticalSpaceSmall,
                            verticalSpaceTiny,
                            _buildOrderCalculationRow(
                                name: 'Delivery', amount: '0'),
                            verticalSpaceSmall,
                            verticalSpaceTiny,
                            _buildOrderCalculationRow(
                              name: 'Total',
                              amount: _calculateTotal(
                                      _calculateSubTotal(cartItemList), 0)
                                  .toStringAsFixed(2),
                              isTotalRow: true,
                            ),
                            verticalSpaceMedium,
                            verticalSpaceSmall,
                            _buildTextLink(
                              text: 'Add more items',
                              color: kcPrimaryColor,
                            ),
                            verticalSpaceSmall,
                            const Divider(),
                            verticalSpaceSmall,
                            _buildTextLink(
                              text: 'Promo code',
                            ),
                            verticalSpaceSmall,
                            const Divider(),
                            verticalSpaceMedium,
                            BusyButton(
                              onTapped: model.showPaymentDialog,
                              busy: model.isBusy,
                              title:
                                  'CHECKOUT (\$${_calculateTotal(_calculateSubTotal(cartItemList), 0).toStringAsFixed(2)})',
                            ),
                            verticalSpaceMedium,
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  SizedBox _buildNoResultsMessage(BuildContext context) {
    return SizedBox(
      height: screenHeightPercentage(context, percentage: 0.75),
      child: const Center(
        child: Text(
          'No items in cart :(',
          style: TextStyle(
            fontSize: kBodyTextNormal,
            color: kcMediumGreyColor,
          ),
        ),
      ),
    );
  }

  Row _buildTextLink({required String text, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color ?? Colors.black,
            fontSize: kBodyTextNormal,
            fontWeight: FontWeight.w500,
          ),
        ),
        horizontalSpaceTiny,
        const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        )
      ],
    );
  }

  Row _buildOrderCalculationRow(
      {required String name, required String amount, bool? isTotalRow}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: kBodyTextNormal,
                fontWeight:
                    isTotalRow != null ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
            if (isTotalRow != null) horizontalSpaceTiny,
            if (isTotalRow != null)
              const Text(
                '(incl. VAT)',
                style: TextStyle(
                  fontSize: kBodyTextNormal,
                ),
              ),
          ],
        ),
        Text(
          '\$$amount',
          style: const TextStyle(
            fontSize: kBodyTextNormal,
          ),
        ),
      ],
    );
  }
}

_calculateSubTotal(cartItemList) {
  double subTotal = 0;
  for (final Cart cartItem in cartItemList) {
    subTotal += (double.parse(cartItem.price) * int.parse(cartItem.quantity));
  }

  return subTotal;
}

_calculateTotal(subTotal, delivery) {
  return subTotal + delivery;
}
