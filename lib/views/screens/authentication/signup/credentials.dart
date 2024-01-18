import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vroom_vroom/controllers/authentication/validate_signup.dart';
import 'package:vroom_vroom/controllers/authentication/validator.dart';
import 'package:vroom_vroom/models/authentication/signup_model.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/utils/providers/authentication/signup_provider.dart';
import 'package:vroom_vroom/views/screens/authentication/widgets/custom_async_button.dart';
import 'package:vroom_vroom/views/screens/authentication/widgets/custom_input_field.dart';

class Credentials extends StatelessWidget {
  Credentials({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SignUpProvider>();
    double height = MediaQuery.sizeOf(context).height;
    return ListView(
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
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
            key: state.formKey,
            child: Column(
          children: [
            CustomTextField(
                errorText: (state.emailError == '')?null:state.emailError,
                onChanged: (value) => state.setEmail(value),
                label: 'Enter email',
                validator: (value) => Validator.isValidEmail(value!),
                icon: SvgPicture.asset('asset/icons/email.svg')),
            SizedBox(
              height: (28 / height) * height,
            ),
            CustomTextField(
                errorText: (state.passwordError == '')?null:state.passwordError,
                label: 'Password',
                validator: (password) => Validator.isValidPassword(password!),
                icon: SvgPicture.asset('asset/icons/password.svg')),
            SizedBox(
              height: (28 / height) * height,
            ),
            CustomTextField(
                validator: (password) => Validator.isValidPassword(password!),
                errorText: (state.passwordError == '')?null:state.passwordError,
                onChanged: (value) => state.setPassword(value),
                label: 'Confirm Password',
                icon: SvgPicture.asset('asset/icons/password.svg')),
          ],
        )),
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
        CustomElevatedButton(
            fn: () async {
              if(state.formKey.currentState!.validate()){
                SignUpModel signUpModel = await createUser(state.email, state.password);
                signUpModel.email = state.email;
                state.setUser(signUpModel);
                state.validateSignUp(signUpModel.message);
              }
            },
            title: 'Create Account'),
        SizedBox(
          height: (18 / height) * height,
        ),
        ElevatedButton.icon(
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.textColor),
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
                context.pop();
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
