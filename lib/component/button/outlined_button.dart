import 'package:flutter/material.dart';
import 'package:submission/utils/color.dart';

class OutlinedButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const OutlinedButtonComponent(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.contentBackground),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.contentBackground),
      ),
    );
  }
}
