import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/account_settings.dart/account_settings_viewmodel.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/busy_button.dart';

import '../shared/styles.dart';
import '../shared/ui_helpers.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountSettingsViewModel>.reactive(
      viewModelBuilder: () => AccountSettingsViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceRegular,
              const Text(
                'Account Settings',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              verticalSpaceSmall,
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: screenWidthPercentage(context, percentage: 0.8),
                  child: Text(
                    'Update your settings like notifications, payments, profile edit etc.',
                    style: ktsMediumGreyBodyText.copyWith(fontSize: 15),
                  ),
                ),
              ),
              verticalSpaceMedium,
              verticalSpaceSmall,
              _buildDetailsRow(
                'Profile Information',
                'Change your account information',
                Icons.person,
                model.navigateToProfileView,
              ),
              verticalSpaceMedium,
              _buildDetailsRow(
                'Change Password',
                'Change your password',
                Icons.lock,
                model.navigateToProfileView,
              ),
              verticalSpaceMedium,
              _buildDetailsRow(
                'Payment Methods',
                'Add your debit and credit cards',
                Icons.payment_rounded,
                model.navigateToProfileView,
              ),
              const Spacer(),
              BusyButton(
                onTapped: model.logoutUser,
                busy: model.isBusy,
                title: 'Log out',
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailsRow(
    String title, String subtitle, IconData icon, Function onTap) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Row(
      children: [
        Icon(
          icon,
          color: const Color.fromARGB(188, 0, 0, 0),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpaceTiny,
                Text(
                  subtitle,
                  style: const TextStyle(color: kcMediumGreyColor),
                ),
              ],
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 17,
        )
      ],
    ),
  );
}
