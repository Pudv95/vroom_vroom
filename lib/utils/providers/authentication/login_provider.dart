import 'package:flutter/material.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import '../../../controllers/authentication/validator.dart';

class LoginProvider extends ChangeNotifier {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String _email = '';
  String _password = '';
  String _emailError = '';
  String _passwordError = '';

  String get email => _email;
  String get password => _password;
  String get emailError => _emailError;
  String get passwordError => _passwordError;

  void setEmail(String value) {
    _email = value;
    _emailError = Validator.isValidEmail(value) ?? '';
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _passwordError = Validator.isValidPassword(value) ?? '';
    notifyListeners();
  }

  void validateLogin(String? apiErrorMessage, BuildContext context) {
    _emailError = '';
    _passwordError = '';

    if (_email.isEmpty) {
      _emailError = 'Email cannot be empty';
    } else if (Validator.isValidEmail(_email) != null) {
      _emailError = Validator.isValidEmail(_email)!;
    }

    if (_password.isEmpty) {
      _passwordError = 'Password cannot be empty';
    } else if (Validator.isValidPassword(_password) != null) {
      _passwordError = Validator.isValidPassword(_password)!;
    }

    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _emailError = apiErrorMessage;
      _passwordError = apiErrorMessage;
    } else {
      _emailError = '';
      _passwordError = '';

    }

    notifyListeners();
  }
}