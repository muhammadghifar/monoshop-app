import 'package:flutter/material.dart';
import 'package:submission/utils/color.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ElevatedButtonComponent(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.contentBackground, foregroundColor: AppColors.defaultBackground),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.defaultBackground),
      ),
    );
  }
}

// Widget elevated_button(String text, Function() onPressed) {
//   return ElevatedButton(
//     onPressed: onPressed,
//     child: Text(text),
//     style: ElevatedButton.styleFrom(backgroundColor: AppColors.contentBackground),
//   );
// }
