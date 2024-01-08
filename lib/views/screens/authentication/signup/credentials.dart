import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/views/screens/authentication/widgets/custom_input_field.dart';

class Credentials extends StatelessWidget {
  Credentials({super.key});
  final TextEditingController emailController = TextEditingController();

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
            'Sign Up',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          height: (16 / height) * height,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Authenticate and join the carpooling \ncommunity for a ride-sharing revolution!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: (48 / height) * height,
        ),
        CustomTextField(
            textController: emailController,
            label: 'Enter email',
            icon: SvgPicture.asset('asset/icons/email.svg')),
        SizedBox(
          height: (28 / height) * height,
        ),
        CustomTextField(
            textController: emailController,
            label: 'Password',
            icon: SvgPicture.asset('asset/icons/password.svg')),
        SizedBox(
          height: (28 / height) * height,
        ),
        CustomTextField(
            textController: emailController,
            label: 'Confirm Password',
            icon: SvgPicture.asset('asset/icons/password.svg')),
        SizedBox(
          height: (28 / height) * height,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(value: true, onChanged: (value) {}),
            Expanded(child: privacyPolicyLinkAndTermsOfService()),
          ],
        ),
        SizedBox(
          height: (22 / height) * height,
        ),
        ElevatedButton(
            onPressed: () {
                PageControllers.credentialsController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Easing.linear);
            },
            child: Text(
              'Create Account',
              style: Theme.of(context).textTheme.labelLarge,
            )),
        SizedBox(
          height: (18 / height) * height,
        ),
        ElevatedButton.icon(
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.textColor),
          ),
          onPressed: () {},
          icon: SvgPicture.asset('asset/icons/google.svg'),
          label: Text(
            'Continue with Google',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Colors.black),
          ),
        ),
        SizedBox(
          height: (22 / height) * height,
        ),
        Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                ),
                TextButton(
                  onPressed: () {
                    // Add your sign-in action here
                  },
                  child: Text("Sign In",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: AppColors.primaryColor)),
                ),
              ],
            )),
      ],
    );
  }
}

Widget privacyPolicyLinkAndTermsOfService() {
  return Text.rich(
      maxLines: 2,
      softWrap: true,
      TextSpan(
          text: 'By continuing, you agree to our ',
          style: const TextStyle(fontSize: 12, color: Colors.white),
          children: <TextSpan>[
            TextSpan(
                text: 'Terms of Service',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryColor,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {}),
            TextSpan(
                text: ' and ',
                style: const TextStyle(fontSize: 12, color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {})
                ])
          ]));
}
