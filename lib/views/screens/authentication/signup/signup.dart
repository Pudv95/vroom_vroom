import 'package:flutter/material.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_credentials.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/user_details.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_number.dart';

class SignUp extends StatefulWidget {
  final int? page;
  const SignUp({super.key,this.page = 0});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<Widget> pages = [VerifyCredentials(),const VerifyNumber(isEmail: false,),const UserDetails()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.page == 1) {
      WidgetsBinding.instance
        .addPostFrameCallback((_) => PageControllers.signUpController.nextPage(duration: Duration(milliseconds: 500), curve: Easing.linear));
    }
    if(widget.page == 2){
      WidgetsBinding.instance
          .addPostFrameCallback((_) => PageControllers.credentialsController.nextPage(duration: Duration(milliseconds: 500), curve: Easing.linear));
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: height,
              maxWidth: width,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  (20 / width) * width, 0, (20 / width) * width, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height/35,),
                  Center(
                      child: SmoothPageIndicator(
                        controller: PageControllers.signUpController,
                        count: 3,
                        effect: WormEffect(
                          dotHeight: (8/height)*height,
                          dotWidth: (100/width)*width,
                          spacing: (10/width)*width,
                          dotColor: const Color(0xff2d2d39),
                          activeDotColor: AppColors.textColor,
                        ),
                      )),
                  SizedBox(
                    height: height*0.94,
                    child: PageView.builder(
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: PageControllers.signUpController,
                      itemBuilder: (BuildContext context, int index) {
                        return pages[index];
                    },),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

