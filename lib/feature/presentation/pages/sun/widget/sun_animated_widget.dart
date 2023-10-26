import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunflower/core/res/colors.dart';

class SunAnimatedWidget extends AnimatedWidget {
  final sun = Random().nextInt(5);

  SunAnimatedWidget({super.key, required super.listenable});

  @override
  Widget build(BuildContext context) {
    const size = 48.0;
    final animation = listenable as Animation<double>;
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                final radians = animation.value * 2 * pi;
                return Align(
                  alignment: Alignment(-sin(radians), cos(radians)),
                  child: SvgPicture.asset(
                    'assets/images/ic_sun_$sun.svg',
                    width: size,
                    height: size,
                    colorFilter: AppColors.secondaryColorFilter,
                  ),
                );
              },
            ),
          ),
          Image.asset('assets/images/landscape.png')
        ],
      ),
    );
  }
}
