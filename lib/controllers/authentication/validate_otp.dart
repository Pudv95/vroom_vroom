import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vroom_vroom/services/authentication/verify_otps.dart';

Future<Map<String,dynamic>> validateOTP(String otp,BuildContext context,token) async {


  try {
    final Map<String, dynamic> responseData = await Verification().verifyOTP(
        otp, context, token
    );
    print(responseData);
    if (responseData['success']) {
      // print('OTP verified!');
      // print('msg: ${responseData['msg']}');
      return responseData;
    } else {
      Fluttertoast.showToast(msg: 'Please Try again');
      return responseData;
    }
  } catch (error) {
    print('Login failed with error: $error');
    return {
      'success': false,
      'msg': 'OTP not Valid!'
    };
  }
}