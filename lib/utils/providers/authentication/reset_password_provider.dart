import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordProvider extends ChangeNotifier {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;


  String _password = '';
  String _passwordError = '';

  String get password => _password;
  String get passwordError => _passwordError;


  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void validateOTP(String? apiErrorMessage, BuildContext context) {
    _passwordError = '';

    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _passwordError = apiErrorMessage;
    } else {
      _passwordError = '';
      Fluttertoast.showToast(msg: 'Password changed Successfully!');
      context.go('/login');
    }

    notifyListeners();
  }
}