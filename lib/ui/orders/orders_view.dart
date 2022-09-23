import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
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
