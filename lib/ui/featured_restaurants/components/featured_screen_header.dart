import 'package:flutter/material.dart';

import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';

class FeaturedScreenHeader extends StatelessWidget {
  const FeaturedScreenHeader({Key? key, required this.location})
      : super(key: key);
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 2,
        ),
        Column(
          children: [
            verticalSpaceSmall,
            const Text(
              'DELIVERY TO',
              style: TextStyle(
                fontSize: kBodyTextCaption,
                color: kcPrimaryColor,
                letterSpacing: 0.45,
                fontWeight: FontWeight.w500,
              ),
            ),
            verticalSpaceTiny,
            Text(
              location,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: kH4Title,
              ),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Filter',
            style: TextStyle(
              color: kcMediumGreyColor,
            ),
          ),
        )
      ],
    );
  }
}
