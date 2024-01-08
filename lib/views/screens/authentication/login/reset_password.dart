import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(child: Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              const Spacer(),
              Center(
                child: Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: (16/height)*height,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Create a new secure password for your account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: (48/height)*height,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(15,5,10,5),
                    child: SvgPicture.asset('asset/icons/password.svg'),
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
              ),
              SizedBox(height: (28/height)*height,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(15,5,10,5),
                    child: SvgPicture.asset('asset/icons/password.svg'),
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
              ),
              SizedBox(height: (224/height)*height,),
              ElevatedButton(onPressed: (){}, child: Text('Reset Password',style: Theme.of(context).textTheme.labelLarge,)),
              const Spacer(),
            ],
          ),
        ),
      ),
    ));
  }
}
