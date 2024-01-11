import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vroom_vroom/controllers/authentication/validate_otp.dart';
import 'package:vroom_vroom/controllers/authentication/validator.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/utils/providers/authentication/forgot_password_provider.dart';
import 'package:vroom_vroom/utils/providers/authentication/verify_otp_provider.dart';

import '../../../../models/authentication/forget_password_model.dart';

class VerifyOTP extends StatelessWidget {
  final bool isEmail;
  final bool isLoggingIn;
  const VerifyOTP({super.key,required this.isEmail,this.isLoggingIn = false});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<VerifyOTPProvider>();
    final state1 = context.watch<ForgotPasswordProvider>();
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: AppColors.textColor, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(16),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(16),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: Colors.red)
      ),
    );
    double height = MediaQuery.sizeOf(context).height;
    return ListView(
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
        Form(
          key: state.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Pinput(
            errorText: (state.otpError == '')?null:state.otpError,
            onChanged: (value) => state.setOTP(value),
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            errorPinTheme: errorPinTheme,
            validator: (value) => Validator.isValidOTP(value!),
            length: 6,
          ),
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
        ElevatedButton(onPressed: () async {
          if(state.formKey.currentState!.validate()){
            if(isLoggingIn){
              Map data = validateOTP(state.otp, state1.model.forgotPasswordToken!);
              if(data['success']){
                state.validateOTP(data['msg'], context);
              }
              else{
                state.validateOTP(data['msg'], context);
              }
              return;
            }
            // isEmail?
            // PageControllers.signUpController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Easing.linear)
            //     :PageControllers.signUpController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Easing.linear);
          }
        }, child: Text('Confirm',style: Theme.of(context).textTheme.labelLarge,))

      ],
    );
  }
}
