import 'package:flutter/material.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget icon;
  final bool passwordField;
  final String? errorText;
  final void Function(String)?  onChanged;
  final String? Function(String?)?  validator;
  const CustomTextField({super.key,required this.label,required this.icon,this.passwordField = false, required this.errorText,this.onChanged,required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordField,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(15,5,10,5),
          child: icon
        ),
        labelText: label,
        errorText: errorText,
        prefixIconConstraints: const BoxConstraints(maxHeight: 80,maxWidth: 80),
        filled: true,
        fillColor: AppColors.secondaryColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
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
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
