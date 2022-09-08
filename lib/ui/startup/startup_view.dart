import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/startup/startup_viewmodel.dart';

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
      builder: (context, model, child) => const Scaffold(
        body: Center(child: Text('Startup View')),
      ),
    );
  }
}
