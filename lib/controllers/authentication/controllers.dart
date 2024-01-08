import 'package:flutter/material.dart';

class PageControllers{
  static final PageController signUpController = PageController();
  static final PageController credentialsController = PageController();
  static final PageController verifyController = PageController();

  void dispose(){
    signUpController.dispose();
    credentialsController.dispose();
    verifyController.dispose();
  }
}

class TextControllers{


}