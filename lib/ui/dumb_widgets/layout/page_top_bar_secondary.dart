import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

import '../../shared/styles.dart';

class PageTopBarSecondary extends StatelessWidget {
  const PageTopBarSecondary({Key? key, this.onBackPressed, required this.title})
      : super(key: key);
  final void Function()? onBackPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceRegular,
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              onPressed: onBackPressed,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: kBodyTextNormal,
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
        verticalSpaceMedium
      ],
    );
  }
}
