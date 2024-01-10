import 'package:flutter/material.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import '../../../controllers/authentication/validator.dart';

class ForgotPasswordProvider extends ChangeNotifier {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;


  String _requirementField = '';
  String _requirementError = '';

  String get requirementField => _requirementField;
  String get requirementFieldError => _requirementError;

  void setRequirement(String value) {
    _requirementField = value;
    notifyListeners();
  }


  void validateRequirement(String? apiErrorMessage, BuildContext context) {
    _requirementError = '';

    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _requirementError = apiErrorMessage;
    } else {
      _requirementError = '';
      PageControllers.verifyController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Easing.linear);
    }

    notifyListeners();
  }
}