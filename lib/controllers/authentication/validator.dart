class Validator {

  static String? isValidEmail(String email) {
    if (email.isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    bool isValidFormat = emailRegex.hasMatch(email);
    if (!isValidFormat) {
      return "Invalid email format";
    }
    return null;
  }

  static String? isValidPassword(String password) {
    if (password.isEmpty) {
      return "Password Cannot be empty";
    }
    return null;
  }

}