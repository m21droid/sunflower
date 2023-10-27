import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunflower/core/temp.dart';
import 'package:sunflower/feature/presentation/pages/map/widgets/date_flow_delegate.dart';
import 'package:sunflower/feature/presentation/pages/map/widgets/floating_circle_widget.dart';
import 'package:sunflower/feature/presentation/widgets/floating_action_button_widget.dart';

class AppAnimatedFloatingActionButton extends StatefulWidget {
  final DateTime date;

  final VoidCallback? onPressedDate;
  final VoidCallback? onPressedLocation;

  const AppAnimatedFloatingActionButton({
    super.key,
    required this.date,
    this.onPressedDate,
    this.onPressedLocation,
  });

  @override
  State<AppAnimatedFloatingActionButton> createState() =>
      _AppAnimatedFloatingActionButtonState();
}

class _AppAnimatedFloatingActionButtonState
    extends State<AppAnimatedFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: animDuration, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      AppFloatingCircle(widget.date.year.toString()),
      AppFloatingCircle(DateFormat('MMM').format(widget.date)),
      AppFloatingCircle(widget.date.day.toString()),
      AppFloatingActionButton(Icons.change_circle,
          onPressed: widget.onPressedDate),
      AppFloatingActionButton(Icons.calendar_month, onPressed: () {
        if (_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      }),
      AppFloatingActionButton(Icons.my_location,
          onPressed: widget.onPressedLocation)
    ];
    return Flow(
        delegate:
            DateFlowDelegate(controller: _controller, count: children.length),
        children: children);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
