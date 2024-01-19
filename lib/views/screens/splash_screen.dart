import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:vroom_vroom/models/user/user_model.dart';
import 'package:vroom_vroom/services/authentication/login.dart';
import 'package:vroom_vroom/services/authentication/verify_credentials.dart';
import 'package:vroom_vroom/services/user/get_user.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future accessToken = LoginUser().getAccessToken();
    Future.delayed(const Duration(milliseconds: 500),()async{
      String? token = await accessToken;
      if(token == null && context.mounted){
        context.go('/login');
      }
      else{
        bool isAuthenticated = await LoginUser().verifyToken(token!);
        if(isAuthenticated){
            final Map<String,dynamic>? user = await GetUser().getUser();
            if(user == null){
              Fluttertoast.showToast(msg: 'Login Expired');
              FlutterSecureStorage().deleteAll();
              context.go('/login');
              return;
            }
            UserModel userModel = UserModel.fromJson(user);
            print(userModel.toJson());
            if(!(userModel.email_verified!)){
              Fluttertoast.showToast(msg: 'Email not Verified');
              VerifyCredentials().resendEmailVerification();
              context.go('/signup',extra: 2);

            }
            else if(!(userModel.phone_verified!)){
              Fluttertoast.showToast(msg: 'Phone number not Verified');
              context.go('/signup',extra: 1);
            }
            else{
              context.go('/dashboard');
            }
        }
        else{
            context.go('/login');
        }
      }
    });
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset('asset/icons/logo.svg'),
            const SizedBox(height: 10,),
            SvgPicture.asset('asset/icons/logo_text.svg'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
