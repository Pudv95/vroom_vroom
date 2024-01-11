import 'package:flutter/material.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/credentials.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_otp.dart';

class VerifyCredentials extends StatelessWidget {
  VerifyCredentials({super.key});
  final List<Widget> credPage = [Credentials(),VerifyOTP(isEmail: true)];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageControllers.credentialsController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return credPage[index];
    },);
  }
}


