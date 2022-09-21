import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/busy_button.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/page_top_bar_secondary.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';
import 'package:stacked_architecture/ui/user_profile/components/update_profile_form.dart';
import 'package:stacked_architecture/ui/user_profile/user_profile_viewmodel.dart';
import 'user_profile_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
])
class UserProfileView extends StatelessWidget with $UserProfileView {
  UserProfileView({Key? key}) : super(key: key);

  void onInitialValues(Map<String, String> data) {
    fullNameController.text = data['fullName']!;
    emailController.text = data['email']!;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
      viewModelBuilder: () => UserProfileViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.listenToInitialValues(
            (Map<String, String> data) => onInitialValues(data));
        model.getUserDetailsFromDb();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: model.isBusy
              ? const AppLoading()
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: globalContentPadding,
                      right: globalContentPadding,
                      bottom: globalContentPadding,
                    ),
                    child: Column(
                      children: [
                        PageTopBarSecondary(
                          title: 'Profile Settings',
                          onBackPressed: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            model.navigateBack();
                          },
                        ),
                        UserProfileForm(
                          fullNameController: fullNameController,
                          emailController: emailController,
                        ),
                        verticalSpaceRegular,
                        if (model.validationMessage != null)
                          Text(
                            model.validationMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: kBodyTextSmall1,
                            ),
                          ),
                        if (model.validationMessage != null)
                          verticalSpaceRegular,
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
