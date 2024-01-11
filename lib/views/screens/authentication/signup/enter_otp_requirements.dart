import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vroom_vroom/controllers/authentication/controllers.dart';
import 'package:vroom_vroom/controllers/authentication/validate_forgot_password.dart';
import 'package:vroom_vroom/controllers/authentication/validator.dart';
import 'package:vroom_vroom/models/authentication/forget_password_model.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/utils/providers/authentication/forgot_password_provider.dart';

class OTPRequirement extends StatelessWidget {
  final bool isEmail;
  final bool isLoggingIn;
  OTPRequirement({super.key,required this.isEmail,this.isLoggingIn = false});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ForgotPasswordProvider>();
    double height = MediaQuery.sizeOf(context).height;
    return ListView(
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
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            keyboardType: isEmail?TextInputType.emailAddress:TextInputType.number,
            maxLength: !isEmail?10:320,
            onChanged: (value) => state.setRequirement(value),
            decoration: InputDecoration(
              labelText: isEmail?'Email':'Phone number',
              errorText: (state.requirementFieldError == '')?null:state.requirementFieldError,
              prefixIcon:Padding(padding: const EdgeInsets.all(15), child: isEmail?SvgPicture.asset('asset/icons/email.svg',):const Text('+91 ')),
              filled: true,
              fillColor: AppColors.secondaryColor,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: (value) => (isEmail)?Validator.isValidEmail(value!):Validator.isValidNumber(value!),
          ),
        ),
        SizedBox(
          height: (285 / height) * height,
        ),
        ElevatedButton(onPressed: ()async{
          if(_formKey.currentState!.validate()){
            print('here');
            ForgotPasswordModel? res = await validOTPRequest(state.requirementField);
            state.setForgetPassModel(res);
            print(res?.toJson());
            if (res != null) {
              state.validateRequirement(res.msg, context);

            } else {
              state.validateRequirement("User doesn\'t exist!", context);
            }
          }
        }, child: Text('Next',style: Theme.of(context).textTheme.labelLarge,))
      ],
    );
  }
}
