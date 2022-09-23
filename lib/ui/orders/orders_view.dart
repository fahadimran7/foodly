import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/busy_button.dart';
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: kcLightGreyColor2),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Text(
                                    cartItem.quantity,
                                    style: const TextStyle(
                                      color: kcPrimaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItem.name,
                                          style: const TextStyle(
                                            fontSize: kBodyTextLarge2,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        verticalSpaceSmall,
                                        Text(
                                          cartItem.decription,
                                          style: const TextStyle(
                                            color: kcMediumGreyColor,
                                            fontSize: kBodyTextSmall2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  'USD ${cartItem.price}',
                                  style: const TextStyle(
                                      color: kcPrimaryColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            verticalSpaceRegular,
                            const Divider(),
                            verticalSpaceRegular,
                          ],
                        ),
                      if (cartItemList.isEmpty)
                        SizedBox(
                          height:
                              screenHeightPercentage(context, percentage: 0.75),
                          child: const Center(
                            child: Text(
                              'No items in cart :(',
                              style: TextStyle(
                                fontSize: kBodyTextNormal,
                                color: kcMediumGreyColor,
                              ),
                            ),
                          ),
                        ),
                      if (cartItemList.isNotEmpty)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Subtotal',
                                  style: TextStyle(
                                    fontSize: kBodyTextNormal,
                                  ),
                                ),
                                Text(
                                  '\$${_calculateSubTotal(cartItemList).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: kBodyTextNormal,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceSmall,
                            verticalSpaceTiny,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Delivery',
                                  style: TextStyle(
                                    fontSize: kBodyTextNormal,
                                  ),
                                ),
                                Text(
                                  '\$0',
                                  style: TextStyle(
                                    fontSize: kBodyTextNormal,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceSmall,
                            verticalSpaceTiny,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                          fontSize: kBodyTextNormal,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    horizontalSpaceTiny,
                                    Text(
                                      '(incl. VAT)',
                                      style: TextStyle(
                                        fontSize: kBodyTextNormal,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${_calculateTotal(_calculateSubTotal(cartItemList), 0).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: kBodyTextNormal,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceMedium,
                            verticalSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add more items',
                                  style: TextStyle(
                                      color: kcPrimaryColor,
                                      fontSize: kBodyTextNormal,
                                      fontWeight: FontWeight.w500),
                                ),
                                horizontalSpaceTiny,
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                )
                              ],
                            ),
                            verticalSpaceSmall,
                            Divider(),
                            verticalSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Promo code',
                                  style: TextStyle(
                                      fontSize: kBodyTextNormal,
                                      fontWeight: FontWeight.w500),
                                ),
                                horizontalSpaceTiny,
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                )
                              ],
                            ),
                            verticalSpaceSmall,
                            Divider(),
                            verticalSpaceMedium,
                            BusyButton(
                              onTapped: () {},
                              busy: model.isBusy,
                              title:
                                  'CHECKOUT (\$${_calculateTotal(_calculateSubTotal(cartItemList), 0)})',
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
