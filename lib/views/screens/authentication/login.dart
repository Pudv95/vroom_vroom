import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                  key: key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          icon: SvgPicture.asset('asset/icons/email.svg'),
                          labelText: 'Email',
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
                      ),

                      SizedBox(height: (28/height)*height),

                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          icon: SvgPicture.asset('asset/icons/password.svg'),
                          labelText: 'Password',
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
                      ),

                      SizedBox(height: (22/height)*height),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Forgot Password?',style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.primaryColor),),
                        ),
                      ),

                      SizedBox(height: (28/height)*height),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Login',style: Theme.of(context).textTheme.labelLarge,),
                      ),

                      SizedBox(height: (18/height)*height),

                      ElevatedButton.icon(
                        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(backgroundColor: MaterialStateProperty.all<Color>(AppColors.textColor),),
                        onPressed: () {},
                        icon: SvgPicture.asset('asset/icons/google.svg'),
                        label: Text('Login with Google',style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black),),
                      ),

                      SizedBox(height: (22/height)*height),

                      TextButton(
                        onPressed: () {},
                        child: Text("Don't have an account? Sign up",style: Theme.of(context).textTheme.displaySmall?.copyWith(color: const Color.fromRGBO(169, 169, 169, 1)),),
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
