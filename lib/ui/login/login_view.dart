import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/dumb_widgets/authentication_layout.dart';
import 'package:stacked_architecture/ui/login/login_viewmodel.dart';
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
        return Scaffold(
          body: AuthenticationLayout(
            busy: model.isBusy,
            onCreateAccountTapped: model.navigateToCreateAccount,
            onMainButtonTapped: model.saveData,
            validationMessage: model.validationMessage,
            title: 'Welcome',
            subtitle: 'Enter your email address to sign in. Enjoy your food.',
            form: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  controller: emailController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Password'),
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
        );
      },
    );
  }
}
