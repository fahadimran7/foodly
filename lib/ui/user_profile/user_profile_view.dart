import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/busy_button.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/page_top_bar_secondary.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';
import 'package:stacked_architecture/ui/user_profile/components/update_profile_form.dart';
import 'package:stacked_architecture/ui/user_profile/user_profile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
      viewModelBuilder: () => UserProfileViewModel(),
      onModelReady: (model) => model.getUserDetailsFromDb(),
      builder: (context, model, child) {
        return Scaffold(
          body: model.isBusy
              ? const AppLoading()
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: kpscreenPaddingHorizontal,
                        right: kpscreenPaddingHorizontal,
                        bottom: kpscreenPaddingVertical),
                    child: Column(
                      children: [
                        PageTopBarSecondary(
                          title: 'Profile Settings',
                          onBackPressed: () => model.navigateBack(),
                        ),
                        UserProfileForm(
                          formKey: model.formKey,
                          fullName: model.fullName,
                          email: model.email,
                          setFullName: model.setFullName,
                          setEmail: model.setEmail,
                          touched: model.touched,
                          setTouched: model.setTouched,
                        ),
                        const Spacer(),
                        BusyButton(
                          busy: model.buttonBusy,
                          onTapped: () => model.updateUserDetails(),
                          title: 'CHANGE SETTINGS',
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
