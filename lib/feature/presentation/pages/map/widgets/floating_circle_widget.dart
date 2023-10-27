import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/core/temp.dart';

class AppFloatingCircle extends StatelessWidget {
  final String _text;
  final double size;
  final Color color;

  const AppFloatingCircle(this._text,
      {super.key, this.size = sizeFAB, this.color = AppColors.secondary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        _text,
        style: const TextStyle(
            color: AppColors.fab, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
