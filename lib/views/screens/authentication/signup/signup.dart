import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/cerdentials.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/user_details.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_number.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final PageController pageController = PageController();
  final List<Widget> pages = [Credentials(),VerifyNumber(),UserDetails()];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
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
                const Spacer(),
                Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
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
                    controller: pageController,
                    itemBuilder: (BuildContext context, int index) {
                      return pages[index+1];
                  },),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

