import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class SelectableButton extends StatelessWidget {

  final String text;
  final bool isSelected;
  final String iconPath;
  final VoidCallback onSelect;

  const SelectableButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSelect,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromRGBO(45, 45, 57, 1),
        ),
        side: MaterialStateProperty.all(
          isSelected
              ? const BorderSide(color: AppColors.primaryColor, width: 1.0)
              : BorderSide.none,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}