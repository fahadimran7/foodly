import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class BusyButton extends StatelessWidget {
  const BusyButton(
      {Key? key,
      required this.onTapped,
      required this.busy,
      required this.title})
      : super(key: key);
  final void Function() onTapped;
  final bool busy;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kcPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: busy
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: kBodyTextTiny,
                ),
              ),
      ),
    );
  }
}
