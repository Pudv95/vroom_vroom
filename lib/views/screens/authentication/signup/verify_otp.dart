import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vroom_vroom/controllers/authentication/validate_otp.dart';
import 'package:vroom_vroom/controllers/authentication/validator.dart';
import 'package:vroom_vroom/models/authentication/signup_model.dart';
import 'package:vroom_vroom/services/authentication/verify_credentials.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/utils/providers/authentication/forgot_password_provider.dart';
import 'package:vroom_vroom/utils/providers/authentication/signup_provider.dart';
import 'package:vroom_vroom/utils/providers/authentication/verify_otp_provider.dart';
import 'package:vroom_vroom/views/screens/authentication/widgets/custom_async_button.dart';

import '../../../../controllers/authentication/validate_forgot_password.dart';
import '../../../../models/authentication/forget_password_model.dart';

class VerifyOTP extends StatelessWidget {
  final bool isEmail;
  final bool isLoggingIn;
  const VerifyOTP({super.key,required this.isEmail,this.isLoggingIn = false});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<VerifyOTPProvider>();
    final state1 = context.watch<ForgotPasswordProvider>();
    final state2 = context.watch<SignUpProvider>();
    final signUpState = context.watch<SignUpProvider>();
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
          child: Consumer<VerifyOTPProvider>(builder: (BuildContext context, value, Widget? child) {
            return Pinput(
              errorText: (state.otpError == '')?null:state.otpError,
              onChanged: (value) => state.setOTP(value),
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              errorPinTheme: errorPinTheme,
              forceErrorState: (state.otpError == '')?false:true,
              validator: (value) => Validator.isValidOTP(value!),
              length: 6,
            );
          },
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
                  "Didn't received the otp ?",
                ),
                TextButton(
                  onPressed: () async {
                    if(isLoggingIn){
                      print('here');
                      ForgotPasswordModel? res = await validOTPRequest(state1.requirementField);
                      state1.setForgetPassModel(res);
                      print(res?.toJson());
                      if (res != null) {
                        state1.validateRequirement(res.msg, context);

                      } else {
                        state1.validateRequirement("User doesn\'t exist!", context);
                      }
                    }
                    else{
                      SignUpModel user = state2.user;
                      print(user.toJson());
                      user.number = state1.requirementField;
                      String? message = await VerifyCredentials(otp: '',email: state1.requirementField,number: state1.requirementField).sendVerificationOTPToNumber(context);
                      state1.validateRequirement(message, context);
                    }
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
        CustomElevatedButton(fn: () async {
          if(state.formKey.currentState!.validate()){
            if(isLoggingIn){
              print('logging in');
              print(state1.model.forgotPasswordToken);
              Map<String,dynamic> data = await validateOTP(state.otp, context);
              print(data);
              if(context.mounted){
                if(data['success']){
                  state.validateOTP(data['msg'], context);
                  state.setToken(data['token']);
                }
                else{
                  state.validateOTP(data['msg'], context);
                }
              }
            }
            else{
                SignUpModel user = signUpState.user;
                print('signing up');
                if(isEmail){
                  String? success =  await VerifyCredentials(otp: state.otp, email: user.email, number: user.number).verifyEmail(context);
                  state.validateOTP(success, context,loggingIn: false);
                }
                else{
                  print('herer');
                  String? success = await VerifyCredentials(otp: state.otp, email: user.email, number: user.number).verifyPhone(context);
                  print(success);
                  print(user.toJson());
                  state.validateOTP(success, context,loggingIn: false,isEmail: false);
                }
            }
          }
        }, title: 'Confirm')

      ],
    );
  }
}

