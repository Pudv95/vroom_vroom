import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

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
            'Verify your email',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          height: (16 / height) * height,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'You need to enter 4-digit code we have \nsent to your email address',
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
        ElevatedButton(onPressed: (){}, child: Text('Confirm',style: Theme.of(context).textTheme.labelLarge,))

      ],
    );
  }
}
