import 'package:vroom_vroom/models/authentication/signup_model.dart';
import 'package:vroom_vroom/services/authentication/signup.dart';

createUser(String email, String pass) async {
  try {
    final Map<String, dynamic> responseData = await SignUpUser().registerNewUser(
        email, pass
    );

    final SignUpModel signUpModel = SignUpModel.fromJson(responseData);

    if (signUpModel.success!) {
      print('Signup successful!');
      print('Email: ${signUpModel.email}');
      print('msg: ${signUpModel.message}');
      return signUpModel;
    } else {

      print('Signup failed with error: Something went wrong.');
      return signUpModel;
    }
  } catch (error) {
    print('SignUp failed with error: $error');
    return null;
  }
}