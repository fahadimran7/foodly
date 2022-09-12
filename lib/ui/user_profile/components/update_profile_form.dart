import 'package:flutter/material.dart';

import '../../shared/ui_helpers.dart';
import '../../shared/validators.dart';

class UserProfileForm extends StatelessWidget {
  const UserProfileForm(
      {Key? key,
      this.formKey,
      this.fullName,
      this.email,
      required this.setFullName,
      required this.setEmail,
      required this.touched,
      required this.setTouched})
      : super(key: key);
  final Key? formKey;
  final String? fullName;
  final String? email;
  final bool touched;
  final void Function(String) setFullName;
  final void Function(String) setEmail;
  final void Function() setTouched;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            onTap: () => setTouched(),
            validator: touched
                ? (value) => InputValidators.validateFullName(value)
                : null,
            initialValue: fullName,
            onChanged: (value) => setFullName(value),
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 233, 233, 233),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 233, 233, 233),
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 233, 233, 233),
                ),
              ),
              labelText: 'FULL NAME',
              hintText: 'John Doe',
              hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
              labelStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
            ),
          ),
          verticalSpaceSmall,
          TextFormField(
            validator: (value) => InputValidators.validateEmailAddress(value),
            onChanged: (value) => setEmail(value),
            initialValue: email,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 233, 233, 233),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 233, 233, 233),
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 233, 233, 233),
                ),
              ),
              labelText: 'EMAIL ADDRESS',
              hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
              labelStyle: TextStyle(
                fontSize: 13,
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
