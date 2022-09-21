import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/account_settings.dart/account_settings_viewmodel.dart';
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
          padding: const EdgeInsets.only(
            left: globalContentPadding,
            right: globalContentPadding,
            bottom: globalContentPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                verticalSpaceSmall,
                const Text(
                  'Account Settings',
                  style: TextStyle(
                      fontSize: kH2Title, fontWeight: FontWeight.w500),
                ),
                verticalSpaceSmall,
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: screenWidthPercentage(context, percentage: 0.8),
                    child: const Text(
                      'Update your settings like notifications, payments, profile edit etc.',
                      style: TextStyle(
                        color: kcMediumGreyColor,
                        fontSize: kBodyTextSmall2,
                      ),
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
                verticalSpaceSmall,
                const Divider(),
                verticalSpaceSmall,
                _buildDetailsRow(
                  'Change Password',
                  'Change your password',
                  Icons.lock,
                  model.navigateToUpdatePasswordView,
                ),
                verticalSpaceSmall,
                const Divider(),
                verticalSpaceSmall,
                _buildDetailsRow(
                  'Payment Methods',
                  'Add your debit and credit cards',
                  Icons.payment_rounded,
                  model.navigateToProfileView,
                ),
                verticalSpaceSmall,
                const Divider(),
                verticalSpaceMedium,
                const Text(
                  'MORE',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpaceMedium,
                _buildDetailsRow(
                  'Rate Us',
                  'Rate us on Google Play or App Store',
                  Icons.star_rate_rounded,
                  () {},
                ),
                const Divider(),
                verticalSpaceSmall,
                _buildDetailsRow(
                  'FAQ',
                  'Frequently asked questions',
                  Icons.bookmark_rounded,
                  () {},
                ),
                const Divider(),
                verticalSpaceSmall,
                _buildDetailsRow(
                  'Logout',
                  'Log out from the app',
                  Icons.logout_rounded,
                  model.showLogoutUserDialog,
                )
              ],
            ),
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
          color: kcDarkGreyColor,
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
                    fontSize: kBodyTextLarge1,
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
