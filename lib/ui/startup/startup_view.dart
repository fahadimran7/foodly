import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/startup/startup_viewmodel.dart';

import '../shared/ui_helpers.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) =>
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        model.runStartUpLogic();
      }),
      viewModelBuilder: () => StartupViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Foodly',
                style: TextStyle(
                  fontSize: kH2Title,
                  fontWeight: FontWeight.w800,
                ),
              ),
              verticalSpaceSmall,
              Text(
                'Your food partner',
                style: TextStyle(
                  fontSize: kBodyTextLarge1,
                  color: kcMediumGreyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
