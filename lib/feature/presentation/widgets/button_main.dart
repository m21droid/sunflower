import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const Button(this.text, {Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          minimumSize: const Size(240, 48)),
      child:
          Text(text, style: const TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
