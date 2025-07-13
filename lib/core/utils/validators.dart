class Validators {
  static String? password(String? value, {String message = 'Enter password'}) {
    if (value == null || value.isEmpty) {
      return message;
    } else if (value.length < 8) {
      return 'Password should be atleast 8 characters long';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*])')
        .hasMatch(value)) {
      return 'Password should contain at least a symbol, number and a capital letter';
    } else {
      return null;
    }
  }

  static bool isEmailAddressValid(String email) {
    final regex = RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    );
    return regex.hasMatch(email);
  }

  static bool isInputValid(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }

    //regex validates against nigerian phone numbers
    if (!RegExp(r'^((?:0|\+?234)[789][01][\d]{8})$').hasMatch(phoneNumber)) {
      return "Invalid Phone number";
    }

    return null;
  }

  static String? validEmailAddress(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }

    //regex validates against nigerian phone numbers
    if (isEmailAddressValid(email.trim())) {
      return null;
    }
    return 'Invalid email address';
  }

  String? emptyField(
    String? value, {
    String message = "Field cant't be empty",
  }) {
    if (value!.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  static String? nonEmptyField(String label, String? value) {
    return isInputValid(value) ? null : '$label is required';
  }
}
