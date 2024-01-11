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
    if(password.length < 8){
      return "Incorrect Password";
    }
    return null;
  }

  static String? isValidNumber(String number) {
    final numberRegex = RegExp(r'^[6-9]\d{9}$');

    if (numberRegex.hasMatch(number)) {
      return null;
    } else {
      return 'Please enter a valid number';
    }
  }

  static String? isValidOTP(String otp){
    if (otp.isEmpty) {
      return "Please Enter OTP";
    }
    if(otp.length < 6){
      return "Enter Valid OTP";
    }
    return null;
  }

}