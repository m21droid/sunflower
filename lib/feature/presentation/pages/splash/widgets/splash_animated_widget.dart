import 'dart:math';

import 'package:flutter/material.dart';

class SplashAnimatedWidget extends AnimatedWidget {
  final Widget image;
  final Widget text;

  const SplashAnimatedWidget(
      {super.key,
      required super.listenable,
      required this.image,
      required this.text});

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(pi * (animation.value)),
          child: image,
        ),
        const SizedBox(height: 8),
        text
      ],
    );
  }
}
