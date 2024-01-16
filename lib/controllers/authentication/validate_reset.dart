import 'package:flutter/material.dart';
import 'package:vroom_vroom/services/authentication/reset_password.dart';


validateReset(String password,BuildContext context) async {
  try {
    final Map<String, dynamic> responseData = await CreateNewPassword().resetPassword(
        password, context
    );

    if (responseData['success']) {
      print('Password change!');
      print('msg: ${responseData['msg']}');
      return responseData;
    } else {
      return responseData;
    }
  } catch (error) {
    print('Login failed with error: $error');
    return null;
  }
}