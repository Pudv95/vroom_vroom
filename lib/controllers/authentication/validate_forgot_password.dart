import 'package:vroom_vroom/models/authentication/forget_password_model.dart';
import 'package:vroom_vroom/services/authentication/reset_passoword.dart';

Future<ForgotPasswordModel?> validOTPRequest(String requirement) async {
  try {
    final Map<String, dynamic> responseData = await SendOtp().sendOTP(
        requirement
    );

    final ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel.fromJson(responseData);

    if (forgotPasswordModel.success!) {
      print('OTP Sent!');
      print('Token: ${forgotPasswordModel.forgotPasswordToken}');
      print('msg: ${forgotPasswordModel.msg}');
      return forgotPasswordModel;
    } else {
      return forgotPasswordModel;
    }
  } catch (error) {
    print('Login failed with error: $error');
    return null;
  }
}