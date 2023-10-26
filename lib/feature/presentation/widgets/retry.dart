import 'package:flutter/material.dart';
import 'package:sunflower/feature/presentation/widgets/button_main.dart';
import 'package:sunflower/feature/presentation/widgets/info_widget.dart';

class AppRetry extends StatelessWidget {
  final String textMain;
  final String textButton;
  final VoidCallback? onPressed;

  const AppRetry(this.textMain,
      {Key? key, this.onPressed, this.textButton = 'Retry'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppInfoText(text: textMain),
        const SizedBox(height: 16),
        AppButton(textButton, onPressed: onPressed),
      ],
    );
  }
}
