import 'package:flutter/material.dart';
import 'package:vroom_vroom/controllers/authentication/validator.dart';

class SignUpProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _emailError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String get emailError => _emailError;
  String get passwordError => _passwordError;
  String get confirmPasswordError => _confirmPasswordError;

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

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    _confirmPasswordError = _password != _confirmPassword
        ? 'Passwords do not match'
        : Validator.isValidPassword(value) ?? '';
    notifyListeners();
  }

  void validateSignUp(String? apiErrorMessage) {
    _emailError = '';
    _passwordError = '';
    _confirmPasswordError = '';

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

    if (_confirmPassword.isEmpty) {
      _confirmPasswordError = 'Confirm Password cannot be empty';
    } else if (_password != _confirmPassword) {
      _confirmPasswordError = 'Passwords do not match';
    } else if (Validator.isValidPassword(_confirmPassword) != null) {
      _confirmPasswordError = Validator.isValidPassword(_confirmPassword)!;
    }

    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _emailError = apiErrorMessage;
      _passwordError = apiErrorMessage;
      _confirmPasswordError = apiErrorMessage;
    }

    notifyListeners();
  }
}
