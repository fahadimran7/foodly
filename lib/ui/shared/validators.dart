class InputValidators {
  static validateEmailAddress(email) {
    if (email == null || email.isEmpty) {
      return 'Email Address cannot be empty';
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return 'Enter a valid Email Address';
    }
    return null;
  }

  static validateFullName(name) {
    if (name == null || name.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }
}
