import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vroom_vroom/services/authentication/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future accessToken = LoginUser().getAccessToken(context);
    Future.delayed(const Duration(milliseconds: 500),()async{
      String? token = await accessToken;
      if(token == null && context.mounted){
        context.go('/login');
      }
      else{
        bool isAuthenticated = await LoginUser().verifyToken(token!);
        if(isAuthenticated && context.mounted){
          context.go('/dashboard');
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
