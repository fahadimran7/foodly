import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';

class AppLoadingWithScaffold extends StatelessWidget {
  const AppLoadingWithScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
        ),
      ),
    );
  }
}
