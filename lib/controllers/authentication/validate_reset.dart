import 'package:vroom_vroom/services/authentication/reset_password.dart';

validateReset(String password,String token) async {
  try {
    final Map<String, dynamic> responseData = await CreateNewPassword().resetPassword(
        password, token
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