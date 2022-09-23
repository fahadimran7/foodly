import 'package:flutter/material.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final Cart cartItem;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  border: Border.all(color: kcLightGreyColor2),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  color: kcPrimaryColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }
}
