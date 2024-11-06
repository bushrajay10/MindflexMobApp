import "package:email_validator/email_validator.dart";

class Validator {
  // Method to check if the email is valid
  static bool isEmail(String email) => EmailValidator.validate(email);

  // Email validation for form fields
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    } else if (!isEmail(value.trim())) {
      return 'Please enter a valid email';
    }
    return null; // No error
  }

  // Username validation for form fields
  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    } else if (value.length < 4) {
      return 'Name must be at least 4 characters long';
    }
    return null; // No error
  }

  // Mobile number validation for form fields
  String? mobileValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a mobile number';
    }

    String pattern = r'^(?:[+0]9)?[0-9]{10,12}$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null; // No error
  }
}
