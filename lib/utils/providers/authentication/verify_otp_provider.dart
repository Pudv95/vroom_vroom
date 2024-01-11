import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyOTPProvider extends ChangeNotifier {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;


  String _otp = '';
  String _otpError = '';

  String get otp => _otp;
  String get otpError => _otpError;

  void setOTP(String value) {
    _otp = value;
    notifyListeners();
  }

  void validateOTP(String? apiErrorMessage, BuildContext context) {
    _otpError = '';

    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _otpError = apiErrorMessage;
    } else {
      _otpError = '';
      context.go('/forgot_password/reset_password');
    }

    notifyListeners();
  }
}