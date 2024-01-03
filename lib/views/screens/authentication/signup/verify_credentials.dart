import 'package:flutter/material.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/credentials.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_email.dart';

class VerifyCredentials extends StatelessWidget {
  VerifyCredentials({super.key});
  final List<Widget> credPage = [Credentials(),const VerifyEmail()];
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return PageView.builder(
      controller: _pageController,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return credPage[index];
    },);
  }
}


