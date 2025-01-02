import 'package:flutter/material.dart';
import 'package:submission/utils/color.dart';

class TextButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const TextButtonComponent(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: AppColors.linkColor, decoration: TextDecoration.underline),
      ),
    );
  }
}
