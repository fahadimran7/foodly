import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
      ),
    );
  }
}
