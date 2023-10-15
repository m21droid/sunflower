import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';

class AppToast extends StatelessWidget {
  final String _text;

  const AppToast(this._text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        style: const TextStyle(color: AppColors.secondaryText, fontSize: 14),
        textAlign: TextAlign.center);
  }
}
