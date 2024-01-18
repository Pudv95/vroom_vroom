import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vroom_vroom/controllers/authentication/validate_reset.dart';
import 'package:vroom_vroom/controllers/authentication/validator.dart';
import 'package:vroom_vroom/services/authentication/reset_password.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/utils/providers/authentication/reset_password_provider.dart';
import 'package:vroom_vroom/utils/providers/authentication/verify_otp_provider.dart';
import 'package:vroom_vroom/views/screens/authentication/widgets/custom_async_button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final state1 = context.watch<VerifyOTPProvider>();
    final state = context.watch<ResetPasswordProvider>();
    return SafeArea(
        child: Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              const Spacer(),
              Center(
                child: Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(
                height: (16 / height) * height,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Create a new secure password for your account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                height: (48 / height) * height,
              ),
              Form(
                key: state.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                        child: SvgPicture.asset('asset/icons/password.svg'),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(maxHeight: 80, maxWidth: 80),
                      filled: true,
                      fillColor: AppColors.secondaryColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) => Validator.isValidPassword(value!),
                  ),
                  SizedBox(
                    height: (28 / height) * height,
                  ),
                  TextFormField(
                    onChanged: (value) => state.setPassword(value),
                    decoration: InputDecoration(
                      errorText: (state.passwordError == '')
                          ? null
                          : state.passwordError,
                      labelText: 'Confirm Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                        child: SvgPicture.asset('asset/icons/password.svg'),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(maxHeight: 80, maxWidth: 80),
                      filled: true,
                      fillColor: AppColors.secondaryColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value != state.password) {
                        return 'Passwords does\'t match';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: (224 / height) * height,
                  ),
                ],
              )),
              CustomElevatedButton(
                  fn: () async {
                    if(state.formKey.currentState!.validate()){
                      print(state1.token);
                      Map<String,dynamic> data = await CreateNewPassword().resetPassword(state.password, context);
                      print(data);
                      if(data['success']){
                        state.validateOTP(data['msg'], context);
                      }
                      else{
                        state.validateOTP(data['msg'], context);
                      }
                      return;
                    }
                  },
                  title: 'Reset Password'),
              const Spacer(),
            ],
          ),
        ),
      ),
    ));
  }
}
