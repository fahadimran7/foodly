import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/authentication_layout.dart';
import 'package:stacked_architecture/ui/login/login_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';
import 'login_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: AuthenticationLayout(
              busy: model.isBusy,
              onCreateAccountTapped: model.navigateToCreateAccount,
              onMainButtonTapped: model.saveData,
              validationMessage: model.validationMessage,
              title: 'Welcome to',
              subtitle:
                  'Enter your Email Address or Phone Number to sign in, enjoy your food :)',
              form: Column(
                children: [
                  verticalSpaceRegular,
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              style: BorderStyle.solid, color: kcPrimaryColor),
                        ),
                        fillColor: kcLightGreyColor,
                        filled: true,
                        labelText: 'Email'),
                    controller: emailController,
                  ),
                  verticalSpaceRegular,
                  TextField(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              style: BorderStyle.solid, color: kcPrimaryColor),
                        ),
                        fillColor: kcLightGreyColor,
                        filled: true,
                        labelText: 'Password'),
                    controller: passwordController,
                    obscureText: true,
                  ),
                ],
              ),
              mainButtonTitle: 'SIGN IN',
              onSignInWithGoogle: model.useGoogleAuthentication,
              onSignInWithApple: model.useAppleAuthentication,
              onForgotPassword: () {},
            ),
          ),
        );
      },
    );
  }
}
