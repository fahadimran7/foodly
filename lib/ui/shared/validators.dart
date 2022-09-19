class InputValidators {
  static validateEmailAddress(email) {
    if (email == null || email.isEmpty) {
      return false;
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return false;
    }
    return true;
  }

  static validateFullName(name) {
    if (name == null || name.isEmpty) {
      return false;
    }
    return true;
  }
}
