import 'package:flutter/material.dart';

class SelectableButton extends StatelessWidget {

  final String text;
  final bool isSelected;
  final VoidCallback onSelect;

  const SelectableButton({
    super.key,
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
          isSelected ? Colors.blue : Colors.grey,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}