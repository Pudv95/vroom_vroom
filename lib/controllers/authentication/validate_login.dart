import 'dart:developer';

import 'package:vroom_vroom/models/authentication/login_model.dart';
import 'package:vroom_vroom/services/authentication/login.dart';

Future<LoginUserModel?> performLogin(String email, String pass) async {
  try {
    final Map<String, dynamic> responseData = await LoginUser().getToken(
        email, pass
    );

    final LoginUserModel loginUserModel = LoginUserModel.fromJson(responseData);

    if (loginUserModel.success!) {
      print('Login successful!');
      print('Access Token: ${loginUserModel.accessToken}');
      print('Refresh Token: ${loginUserModel.refreshToken}');
      print('Email: ${loginUserModel.email}');
      print('msg: ${loginUserModel.msg}');
      return loginUserModel;
    } else {

      print('Login failed with error: Something went wrong.');
      return loginUserModel;
    }
  } catch (error) {
    print('Login failed with error: $error');
    return null;
  }
}