import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  const AuthenticationLayout(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.mainButtonTitle,
      required this.form,
      this.showTermsText = false,
      this.onMainButtonTapped,
      this.onCreateAccountTapped,
      this.onForgotPassword,
      this.onBackPressed,
      this.validationMessage,
      this.busy = false,
      this.onSignInWithApple,
      this.onSignInWithGoogle})
      : super(key: key);
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final bool showTermsText;
  final void Function()? onMainButtonTapped;
  final void Function()? onCreateAccountTapped;
  final void Function()? onForgotPassword;
  final void Function()? onBackPressed;
  final void Function()? onSignInWithApple;
  final void Function()? onSignInWithGoogle;
  final String? validationMessage;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  onPressed: onBackPressed,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  'Sign up',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const Spacer(
                  flex: 3,
                )
              ],
            ),
          verticalSpaceSmall,
          Text(
            title,
            style: const TextStyle(
                fontSize: kH1Title, fontWeight: FontWeight.w500),
          ),
          verticalSpaceSmall,
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: screenWidthPercentage(context, percentage: 0.8),
              child: Text(
                subtitle,
                style:
                    ktsMediumGreyBodyText.copyWith(fontSize: kBodyTextSmall2),
              ),
            ),
          ),
          verticalSpaceRegular,
          form,
          verticalSpaceRegular,
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: onForgotPassword,
                child: Text(
                  'Forget Password?',
                  style: ktsMediumGreyBodyText.copyWith(
                    fontSize: kBodyTextSmall1,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          verticalSpaceRegular,
          if (validationMessage != null)
            Text(
              validationMessage!,
              style:
                  const TextStyle(color: Colors.red, fontSize: kBodyTextSmall1),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          GestureDetector(
            onTap: onMainButtonTapped,
            child: Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: busy
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : Text(
                      mainButtonTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: kBodyTextCaption,
                      ),
                    ),
            ),
          ),
          verticalSpaceRegular,
          if (onCreateAccountTapped != null)
            GestureDetector(
              onTap: onCreateAccountTapped,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.black54),
                  ),
                  horizontalSpaceTiny,
                  Text(
                    'Create an account',
                    style: TextStyle(
                      color: kcPrimaryColor,
                    ),
                  )
                ],
              ),
            ),
          verticalSpaceSmall,
          if (showTermsText)
            Text(
              'By signing up you agree to our terms, conditions and privacy policy.',
              style: ktsMediumGreyBodyText.copyWith(fontSize: kBodyTextSmall2),
              textAlign: TextAlign.center,
            ),
          verticalSpaceRegular,
          Align(
            alignment: Alignment.center,
            child: Text(
              'Or',
              style: ktsMediumGreyBodyText.copyWith(fontSize: kBodyTextSmall1),
            ),
          ),
          if (Platform.isIOS) verticalSpaceRegular,
          if (Platform.isIOS)
            AppleAuthButton(
              onPressed: onSignInWithApple ?? () {},
              text: 'CONTINUE WITH APPLE',
              style: const AuthButtonStyle(
                buttonType: AuthButtonType.secondary,
                iconBackground: Colors.black,
                iconColor: Colors.white,
                textStyle: TextStyle(
                    fontSize: kBodyTextSmall1, fontWeight: FontWeight.w600),
                iconSize: 24,
                height: 50,
              ),
            ),
          verticalSpaceRegular,
          GoogleAuthButton(
            onPressed: onSignInWithGoogle ?? () {},
            text: 'CONTINUE WITH GOOGLE',
            style: const AuthButtonStyle(
              buttonType: AuthButtonType.secondary,
              textStyle: TextStyle(
                  fontSize: kBodyTextSmall1, fontWeight: FontWeight.w600),
              iconSize: 24,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
