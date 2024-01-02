import 'package:flutter/material.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final String label;
  final Widget icon;
  final bool passwordField;
  const CustomTextField({super.key,required this.textController,required this.label,required this.icon,this.passwordField = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: passwordField,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(15,5,10,5),
          child: icon
        ),
        labelText: label,
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
    );
  }
}
