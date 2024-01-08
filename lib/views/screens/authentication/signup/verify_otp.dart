import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class VerifyOTP extends StatelessWidget {
  final bool isEmail;
  const VerifyOTP({super.key,required this.isEmail});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        SizedBox(
          height: (65 / height) * height,
        ),
        Center(
          child: Text(
            isEmail?'Verify your email':'Verify your phone number',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          height: (16 / height) * height,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            isEmail?'You need to enter 6-digit code we have \nsent to your email address':'You need to enter 6-digit code we have \nsent to your phone number',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: (71 / height) * height,
        ),
        Pinput(
        length: 6,
        ),
        SizedBox(
          height: (236 / height) * height,
        ),
        Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't received an email ?",
                ),
                TextButton(
                  onPressed: () {

                  },
                  child: Text("Send again",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: AppColors.primaryColor)),
                ),
                SizedBox(height: (22/height)*height,),
              ],
            )),
        SizedBox(height: (22/height)*height,),
        ElevatedButton(onPressed: (){
          isEmail?PageControllers.signUpController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Easing.linear):PageControllers.signUpController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Easing.linear);
        }, child: Text('Confirm',style: Theme.of(context).textTheme.labelLarge,))

      ],
    );
  }
}
