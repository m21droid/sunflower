import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';

class _AppToast extends StatelessWidget {
  final String _text;

  const _AppToast(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        style: const TextStyle(color: AppColors.secondaryText, fontSize: 14),
        textAlign: TextAlign.center);
  }
}

extension AppContext on BuildContext {
  void showToast(String message) {
    final toast = _AppToast(message);
    final snackBar =
        SnackBar(content: toast, backgroundColor: AppColors.secondary);
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
