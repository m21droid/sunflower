import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  final IconData? _icon;
  final VoidCallback? onPressed;

  const AppFloatingActionButton(this._icon, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppFloatingActionButton >>>>>>>> $_icon');
    return FloatingActionButton(
        heroTag: _icon.hashCode,
        onPressed: onPressed,
        child: Icon(_icon, color: AppColors.dark));
  }
}
