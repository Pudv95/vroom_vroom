import 'package:flutter/material.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/enter_otp_requirements.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_otp.dart';

class VerifyNumber extends StatelessWidget {
  VerifyNumber({super.key});

  final List<Widget> credPage = [const OTPRequirement(isEmail: false),const VerifyOTP(isEmail: false)];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageControllers.verifyController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return credPage[index];
      },);
  }
}
