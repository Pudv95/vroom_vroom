import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Future<void> Function() fn;
  const CustomElevatedButton({super.key,required this.title,required this.fn});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        EasyLoading.show();
        await fn();
        EasyLoading.dismiss();
      },
      child: Text(title,style: Theme.of(context).textTheme.labelLarge,),
    );

  }
}
