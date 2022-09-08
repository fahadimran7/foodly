import 'package:flutter/material.dart';

import '../shared/styles.dart';
import '../shared/ui_helpers.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: const Text(
                'Filter',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
      title: Column(
        children: const [
          verticalSpaceSmall,
          Text(
            'DELIVERY TO',
            style: TextStyle(
              fontSize: 11,
              color: kcPrimaryColor,
              letterSpacing: 0.45,
              fontWeight: FontWeight.w400,
            ),
          ),
          verticalSpaceTiny,
          Text(
            'San Francisco',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 19,
              letterSpacing: 0.6,
            ),
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
