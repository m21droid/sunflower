import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';

class AppButton extends StatelessWidget {
  static const bool type = false;

  final String text;
  final VoidCallback? onPressed;

  const AppButton(this.text, {Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    return type
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                minimumSize: const Size(240, 48)),
            child: Text(text,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
          )
        : InkWell(
            onTap: onPressed,
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                  color: AppColors.button,
                  borderRadius:
                      BorderRadius.only(topRight: radius, bottomLeft: radius)),
              constraints: const BoxConstraints(minWidth: 120),
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, color: AppColors.secondaryText)),
            ),
          );
  }
}
