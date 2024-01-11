import 'package:vroom_vroom/services/authentication/verify_otps.dart';

validateOTP(String otp,String token) async {
  try {
    final Map<String, dynamic> responseData = await Verification().verifyOTP(
        otp, token
    );

    if (responseData['success']) {
      print('OTP verified!');
      print('msg: ${responseData['msg']}');
      return responseData;
    } else {

      print('Login failed with error: Something went wrong.');
      return responseData;
    }
  } catch (error) {
    print('Login failed with error: $error');
    return null;
  }
}