import 'package:flutter/material.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/enter_otp_requirements.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_otp.dart';

class VerifyNumber extends StatelessWidget {
  final bool isEmail;
  final bool isLoggingIn;
  const VerifyNumber({super.key,required this.isEmail,this.isLoggingIn = false});

  @override
  Widget build(BuildContext context) {
    final List<Widget> credPage = [OTPRequirement(isEmail: isEmail,isLoggingIn: isLoggingIn,),VerifyOTP(isEmail: isEmail,isLoggingIn: isLoggingIn,)];
    return PageView.builder(
        controller: PageControllers.verifyController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return credPage[index];
        },);
  }
}
