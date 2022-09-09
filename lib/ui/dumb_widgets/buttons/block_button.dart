import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';

class BlockButton extends StatelessWidget {
  const BlockButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: kBodyTextSmall,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
