import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:sunflower/core/temp.dart';

class DateFlowDelegate extends FlowDelegate {
  final AnimationController controller;
  final int count;

  const DateFlowDelegate({required this.controller, required this.count})
      : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    const sizeButton = sizeFAB;
    const sizePadding = 16.0;
    const offset = 2.0 * sizeButton;
    final xStart = context.size.width - sizeButton;
    final yStart = context.size.height - sizeButton - sizePadding / 2;
    final yNext = yStart - sizeButton - sizePadding;

    final n = count - 2;
    final radian = pi / 2.0 / (n - 1);
    final radius = offset * controller.value;
    final scale = (7.0 + controller.value * 3.0) / 10.0;
    final delta = sizeButton * (1.0 - scale) / 2.0;
    var i = 0;
    for (; i < n; i++) {
      final radians = i * radian;
      final x = xStart - radius * cos(radians) + delta;
      final y = yNext - radius * sin(radians) + delta;
      context.paintChild(
        i,
        transform: Matrix4.identity()
          ..translate(x, y, 0)
          ..scale(scale),
      );
    }
    context.paintChild(i++,
        transform: Matrix4.identity()..translate(xStart, yNext));
    context.paintChild(i++,
        transform: Matrix4.identity()..translate(xStart, yStart));
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
