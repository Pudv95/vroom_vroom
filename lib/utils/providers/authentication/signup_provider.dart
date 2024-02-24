import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vroom_vroom/controllers/authentication/validator.dart';
import 'package:vroom_vroom/models/authentication/signup_model.dart';

import '../../../controllers/authentication/controllers.dart';

class SignUpProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String _email = '';
  String _password = '';
  String _emailError = '';
  String _passwordError = '';
  SignUpModel _model = SignUpModel(termsAndConditions:false,name: '', email: '', password: [], gender: '', age: '', success: null, message: '', refreshToken: '', accessToken: '', number: '');

  String get email => _email;
  String get password => _password;
  String get emailError => _emailError;
  String get passwordError => _passwordError;
  SignUpModel get user => _model;

  void setEmail(String value) {
    _email = value;
    _emailError = Validator.isValidEmail(value) ?? '';
    notifyListeners();
  }

  void toggleTnP(){
    _model.termsAndConditions =!_model.termsAndConditions!;
    notifyListeners();
  }

  void setUser(SignUpModel user){
    _model = user;
    notifyListeners();
  }

  void setGender(gender){
    user.gender = gender;
    notifyListeners();
  }
  void setAge(age){
    user.age = age;
    notifyListeners();
  }
  void setName(name){
    user.name = name;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _passwordError = Validator.isValidPassword(value) ?? '';
    notifyListeners();
  }


  void validateSignUp(String? apiErrorMessage) {
    _emailError = '';
    _passwordError = '';
    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _emailError = apiErrorMessage;
      if (_emailError.toLowerCase().contains('password')) {
        _emailError = '';
      }
      _passwordError = apiErrorMessage;
      notifyListeners();
    }
    else{
      _emailError = '';
      _passwordError = '';
      PageControllers.credentialsController.animateToPage(1,
          duration: const Duration(milliseconds: 500),
          curve: Easing.linear);
    }

    notifyListeners();
  }
}
