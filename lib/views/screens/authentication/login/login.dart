import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import 'package:vroom_vroom/controllers/authentication/validate_login.dart';
import 'package:vroom_vroom/controllers/authentication/validator.dart';
import 'package:vroom_vroom/models/authentication/login_model.dart';
import 'package:vroom_vroom/services/authentication/google_o_auth.dart';
import 'package:vroom_vroom/services/authentication/login.dart';
import 'package:vroom_vroom/utils/providers/authentication/login_provider.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    final state  = context.watch<LoginProvider>();
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height,
            maxWidth: width,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Center(
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: (16/height)*height,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome back to the carpooling \ncommunity',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: (48/height)*height,),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: state.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: TextControllers.emailController,
                        onChanged: (value) => state.setEmail(value),
                        decoration: InputDecoration(
                          errorText: (state.emailError == '')?null:state.emailError,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(15,5,10,5),
                            child: SvgPicture.asset('asset/icons/email.svg',),
                          ),
                          labelText: 'Email',
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIconConstraints: const BoxConstraints(maxHeight: 80,maxWidth: 80),
                          filled: true,
                          fillColor: AppColors.secondaryColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) => Validator.isValidEmail(value!),
                      ),

                      SizedBox(height: (28/height)*height),

                      TextFormField(
                        controller: TextControllers.passwordController,
                        onChanged: (value) => state.setPassword(value),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: (state.passwordError == '')?null:state.passwordError,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(15,5,10,5),
                            child: SvgPicture.asset('asset/icons/password.svg'),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIconConstraints: const BoxConstraints(maxHeight: 80,maxWidth: 80),
                          filled: true,
                          fillColor: AppColors.secondaryColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) => Validator.isValidPassword(value!),
                      ),

                      SizedBox(height: (22/height)*height),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            context.push('/forgot_password');
                          },
                          child: Text('Forgot Password?',style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.primaryColor),),
                        ),
                      ),

                      SizedBox(height: (28/height)*height),

                      // Login Button
                      ElevatedButton(
                        onPressed: () async {
                          if(state.formKey.currentState!.validate()){
                            LoginUserModel? res = await performLogin(TextControllers.emailController.text.toString(), TextControllers.passwordController.text.toString());
                            if (res != null) {
                              state.validateLogin(res.msg, context);

                            } else {
                              state.validateLogin("Invalid Credentials!", context);
                            }
                          }
                        },
                        child: Text('Login',style: Theme.of(context).textTheme.labelLarge,),
                      ),

                      SizedBox(height: (18/height)*height),

                      ElevatedButton.icon(
                        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(backgroundColor: MaterialStateProperty.all<Color>(AppColors.textColor),),
                        onPressed: () async {
                          await GoogleAuth().handleSignIn();
                        },
                        icon: SvgPicture.asset('asset/icons/google.svg'),
                        label: Text('Continue with Google',style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black),),
                      ),

                      SizedBox(height: (22/height)*height),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: const Color.fromRGBO(169, 169, 169, 1))),
                          const SizedBox(width: 5),
                          TextButton(
                            onPressed: () {
                              context.push('/signup');
                            },
                            child: Text("Sign up", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.primaryColor)),
                          ),
                        ],
                      ),
                    ],
                  ),
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
