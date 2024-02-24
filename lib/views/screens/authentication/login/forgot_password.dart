import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vroom_vroom/views/screens/authentication/widgets/reset_buttons.dart';



class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width,
            maxHeight: height,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB((30/width)*width, 0, (30/width)*width, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Center(
                  child: Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: (16/height)*height,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No problem! We’ll help you to recover \nyour access',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: (48/height)*height,),
                SelectableButton(text: 'Reset with email',iconPath: 'asset/icons/email.svg' ,isSelected: !selected, onSelect: (){
                  if(selected) {
                    selected = !selected;
                  }
                  setState(() {
            
                  });
                }),
                SizedBox(height: (18/height)*height,),
                SelectableButton(text: 'Reset with SMS', iconPath:'asset/icons/sms.svg'  ,isSelected: selected, onSelect: (){
                  if(!selected) {
                    selected = !selected;
                  }
                      setState(() {
            
                      });
                }),
                SizedBox(height: (252.5/height)*height,),
                ElevatedButton(onPressed: (){
                  if(selected){
                    //sms
                    context.go('/login/forgot_password/verify_detail_requirement', extra: {'isEmail':false,'isLoggingIn':true});
                  }
                  else{
                    //email
                    context.go('/login/forgot_password/verify_detail_requirement' , extra: {'isEmail':true,'isLoggingIn':true});
                  }
                }, child: Text('Reset Password',style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),)),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
