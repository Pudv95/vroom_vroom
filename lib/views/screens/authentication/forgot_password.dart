import 'package:flutter/material.dart';
import 'package:vroom_vroom/views/screens/authentication/widgets/reset_buttons.dart';



class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          maxHeight: height,
        ),
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
            SelectableButton(text: 'Reset with email', isSelected: false, onSelect: (){}),
            SelectableButton(text: 'Reset with SMS', isSelected: false, onSelect: (){}),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
