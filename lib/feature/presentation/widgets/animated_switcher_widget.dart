import 'package:flutter/material.dart';

class AppAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  final bool isVisible;

  const AppAnimatedSwitcher(
      {super.key, this.isVisible = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: isVisible
          ? child
          : const SizedBox.shrink(key: Key('AppAnimatedSwitcher')),
    );
  }
}
