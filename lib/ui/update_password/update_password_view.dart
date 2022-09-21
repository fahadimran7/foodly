import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/busy_button.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/page_top_bar_secondary.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';
import 'package:stacked_architecture/ui/update_password/components/update_password_form.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: globalContentPadding,
            right: globalContentPadding,
            bottom: globalContentPadding,
          ),
          child: Column(
            children: [
              PageTopBarSecondary(
                title: 'Change Password',
                onBackPressed: () {},
              ),
              const UpdatePasswordForm(),
              verticalSpaceRegular,
              const Spacer(),
              BusyButton(
                busy: false,
                onTapped: () {},
                title: 'UPDATE PASSWORD',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
