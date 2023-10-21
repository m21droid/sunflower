import 'dart:math';

import 'package:flutter/material.dart';

class NightAnimatedWidget extends AnimatedWidget {
  const NightAnimatedWidget({super.key, required super.listenable});

  static const radian1 = pi / 2.5;
  static const radian2 = 2 * pi - radian1;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final radians = animation.value * 2 * pi;
        BoxDecoration? decoration;
        if (radians < radian1) {
          final opacity = 1 - radians / radian1;
          decoration = _decoration(opacity);
        } else {
          if (radians > radian2) {
            final opacity = (radians - radian2) / radian1;
            decoration = _decoration(opacity);
          }
        }
        return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: decoration);
      },
    );
  }

  BoxDecoration _decoration(double opacity) => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0),
            Colors.black.withOpacity(opacity * 0.66),
            Colors.black.withOpacity(opacity)
          ],
        ),
      );
}
