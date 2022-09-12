import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/block_button.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/busy_button.dart';
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
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Column(
                      children: [
                        verticalSpaceRegular,
                        _buildTopRow(onBackPressed: model.navigateBack),
                        verticalSpaceSmall,
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

Widget _buildTopRow({required Function onBackPressed}) {
  return Row(
    children: [
      IconButton(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        onPressed: () => onBackPressed(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      const Spacer(
        flex: 2,
      ),
      const Text(
        'Profile Settings',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      const Spacer(
        flex: 3,
      )
    ],
  );
}
