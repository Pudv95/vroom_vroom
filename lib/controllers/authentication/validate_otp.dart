import 'package:flutter/material.dart';
import 'package:vroom_vroom/services/authentication/verify_otps.dart';

validateOTP(String otp,BuildContext context) async {
  try {
    final Map<String, dynamic> responseData = await Verification().verifyOTP(
        otp, context
    );

    if (responseData['success']) {
      print('OTP verified!');
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