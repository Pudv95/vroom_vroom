import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class OTPRequirement extends StatelessWidget {
  final bool isEmail;
  const OTPRequirement({super.key,required this.isEmail});

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
            isEmail?'Enter your email':'Enter your phone number',
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
            isEmail?'We\'ll mail you a code to verify your email':'We\'ll call you verify your phone number',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: (71 / height) * height,
        ),
        TextFormField(
          keyboardType: isEmail?TextInputType.emailAddress:TextInputType.number,
          decoration: InputDecoration(
            labelText: isEmail?'Email':'Phone number',
            prefixIcon: const Padding(padding: EdgeInsets.all(15), child: Text('+91 ')),
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
        SizedBox(
          height: (285 / height) * height,
        ),
        ElevatedButton(onPressed: (){
          PageControllers.verifyController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Easing.linear);
        }, child: Text('Next',style: Theme.of(context).textTheme.labelLarge,))
      ],
    );
  }
}
