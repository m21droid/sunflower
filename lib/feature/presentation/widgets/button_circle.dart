import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';

class CircleButton extends StatelessWidget {
  final IconData iconData;
  final double size;
  final double sizeIcon;
  final Color color;
  final GestureTapCallback? onTap;

  const CircleButton(this.iconData,
      {super.key,
      this.size = 48,
      this.sizeIcon = 24,
      this.color = Colors.white,
      this.onTap})
      : assert(size > sizeIcon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Icon(iconData, size: sizeIcon, color: AppColors.dark),
      ),
    );
  }
}
