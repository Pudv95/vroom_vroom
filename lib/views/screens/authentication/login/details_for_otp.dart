import 'package:flutter/material.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_number.dart';


class DetailsForOtp extends StatelessWidget {
  final bool isEmail;
  final bool isLoggingIn;
  const DetailsForOtp({super.key,required this.isEmail,this.isLoggingIn = false});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              (20 / width) * width, 0, (20 / width) * width, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: VerifyNumber(isEmail: isEmail,isLoggingIn: isLoggingIn,)
              ),
            ],
          ),
        ),
      )
    );
  }
}
