import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';

class VerifyOTPProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String _otp = '';
  String _otpError = '';
  String _token = "";

  String get otp => _otp;
  String get otpError => _otpError;
  String get token => _token;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setOTP(String value) {
    _otp = value;
    notifyListeners();
  }

  void validateOTP(String? apiErrorMessage, BuildContext context,
      {loggingIn = true, isEmail = true}) {
    _otpError = '';

    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _otpError = apiErrorMessage;
    } else {
      _otpError = '';
      if (loggingIn) {
        context.go('/login/forgot_password/reset_password');
      } else {
        (isEmail)
            ? PageControllers.signUpController.animateToPage(1,
                duration: const Duration(milliseconds: 500),
                curve: Easing.linear)
            : PageControllers.signUpController.animateToPage(2,
                duration: const Duration(milliseconds: 500),
                curve: Easing.linear);
      }
    }

    notifyListeners();
  }
}
