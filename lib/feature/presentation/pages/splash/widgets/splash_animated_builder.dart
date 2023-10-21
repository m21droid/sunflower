import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';

class SplashAnimatedBuilder extends StatelessWidget {
  final AnimationController controller;
  final Widget image;
  final Widget text;

  const SplashAnimatedBuilder(
      {super.key,
      required this.controller,
      required this.image,
      required this.text});

  @override
  Widget build(BuildContext context) {
    const size = 24.0;
    const interval = 0.5;

    final slideCurve = CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, interval, curve: Curves.elasticOut));
    final slideAnimation =
        Tween(begin: const Offset(-3.0, 0.0), end: Offset.zero)
            .animate(slideCurve);

    final transformCurve = CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, interval, curve: Curves.bounceIn));
    final transformAnimation =
        Tween(begin: 0.0, end: 2.0).animate(transformCurve);

    final fadeAnimation = CurvedAnimation(
        parent: controller,
        curve: const Interval(interval / 2, interval, curve: Curves.easeIn));

    final sizeCurve = CurvedAnimation(
        parent: controller,
        curve: const Interval(interval, interval + 0.1, curve: Curves.linear));
    final sizeAnimation =
        Tween<Size>(begin: const Size(0, 0), end: const Size(size, size))
            .animate(sizeCurve);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: transformAnimation,
          builder: (context, child) => Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateY(pi * (transformAnimation.value)),
            child: SlideTransition(position: slideAnimation, child: image),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: size, height: size),
            FadeTransition(opacity: fadeAnimation, child: text),
            SizedBox(
              width: size,
              height: size,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: sizeAnimation,
                    builder: (context, child) => Container(
                      width: sizeAnimation.value.width,
                      height: sizeAnimation.value.height,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            AppColors.secondary,
                            AppColors.secondary.withOpacity(0)
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
