import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';

import '../../shared/ui_helpers.dart';
import '../../shared/validators.dart';

class UserProfileForm extends StatelessWidget {
  const UserProfileForm({
    Key? key,
    this.fullNameController,
    this.emailController,
  }) : super(key: key);
  final TextEditingController? fullNameController;
  final TextEditingController? emailController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: fullNameController,
            validator: (value) => InputValidators.validateFullName(value),
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kcLightGreyColor3,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kcLightGreyColor3,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kcLightGreyColor3,
                ),
              ),
              labelText: 'FULL NAME',
              hintText: 'John Doe',
              hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: kBodyTextSmall1,
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.black54,
                fontSize: kBodyTextSmall2,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
              labelStyle: TextStyle(
                fontSize: kBodyTextSmall1,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
            ),
          ),
          verticalSpaceSmall,
          TextFormField(
            controller: emailController,
            validator: (value) => InputValidators.validateEmailAddress(value),
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kcLightGreyColor3,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kcLightGreyColor3,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kcLightGreyColor3,
                ),
              ),
              labelText: 'EMAIL ADDRESS',
              hintText: 'name@example.com',
              hintStyle: TextStyle(
                color: Colors.black54,
                height: 2,
                fontSize: kBodyTextSmall1,
                fontWeight: FontWeight.w500,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.black54,
                fontSize: kBodyTextSmall2,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
              labelStyle: TextStyle(
                fontSize: kBodyTextSmall1,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
