import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/create_account/create_account_view.form.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/authentication_layout.dart';

import '../shared/styles.dart';
import '../shared/ui_helpers.dart';
import 'create_account_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class CreateAccountView extends StatelessWidget with $CreateAccountView {
  CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => CreateAccountViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: AuthenticationLayout(
              busy: model.isBusy,
              onMainButtonTapped: model.saveData,
              onBackPressed: model.navigateBack,
              validationMessage: model.validationMessage,
              onSignInWithGoogle: model.useGoogleAuthentication,
              title: 'Create Account',
              subtitle: 'Enter email and password for sign up.',
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
                      labelText: 'Email',
                    ),
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
                      labelText: 'Password',
                    ),
                    controller: passwordController,
                    obscureText: true,
                  ),
                ],
              ),
              mainButtonTitle: 'SIGN UP',
              showTermsText: true,
              onForgotPassword: () {},
            ),
          ),
        );
      },
    );
  }
}
